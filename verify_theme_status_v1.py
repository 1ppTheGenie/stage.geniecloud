"""
Verify Theme Status for Steve's Accounts
Check if Apple Black theme exists and is available
"""
import pyodbc

# Database connection (read-only)
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=192.168.29.45,1433;"
    "DATABASE=FarmGenie;"
    "UID=cursor;"
    "PWD=1ppINSAyay$;"
    "Connection Timeout=30;"
)

def check_theme_status():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("THEME STATUS CHECK")
        print("=" * 60)
        
        # Check if Apple Black theme exists
        print("\n1. Checking if Apple Black theme exists...")
        cursor.execute("""
            SELECT HubThemeId, ThemeDisplayName, ParamTheme, ParamHue, IsDark, IsEnabled
            FROM dbo.HubTheme 
            WHERE ParamTheme = 'apple-black' OR ThemeDisplayName LIKE '%Apple%'
        """)
        rows = cursor.fetchall()
        if rows:
            print("   Apple Black theme(s) found:")
            for row in rows:
                print(f"   - ID: {row.HubThemeId}, Name: {row.ThemeDisplayName}, Theme: {row.ParamTheme}, Hue: {row.ParamHue}")
        else:
            print("   Apple Black theme NOT FOUND in database")
            print("   --> Need to run INSERT_AppleBlack_Theme_ForSteveAccounts_v1.sql")
        
        # Check availability for Steve's accounts
        print("\n2. Checking theme availability for your accounts...")
        accounts = [
            ('2d0bd648-3f05-4e9a-bec9-1fb050d5170b', 'Primary Account'),
            ('a8436051-333d-4725-b8ce-88bf5262d26a', 'Texas Genie')
        ]
        
        for user_id, name in accounts:
            cursor.execute("""
                SELECT t.ThemeDisplayName, a.HubThemeAvailabilityId
                FROM dbo.HubThemeAvailability a
                JOIN dbo.HubTheme t ON a.HubThemeId = t.HubThemeId
                WHERE a.AspNetUserId = ?
                AND t.ParamTheme = 'apple-black'
            """, user_id)
            rows = cursor.fetchall()
            if rows:
                print(f"   {name} ({user_id[:8]}...): Apple Black AVAILABLE")
            else:
                print(f"   {name} ({user_id[:8]}...): Apple Black NOT available")
        
        # Check current default themes
        print("\n3. Current default themes for your accounts...")
        for user_id, name in accounts:
            cursor.execute("""
                SELECT ump.DefaultThemeId, t.ThemeDisplayName, t.ParamTheme, t.ParamHue
                FROM dbo.UserMarketingProfile ump
                LEFT JOIN dbo.HubTheme t ON ump.DefaultThemeId = t.HubThemeId
                WHERE ump.AspNetUserId = ?
            """, user_id)
            row = cursor.fetchone()
            if row:
                print(f"   {name}: {row.ThemeDisplayName} ({row.ParamTheme}/{row.ParamHue})")
            else:
                print(f"   {name}: No marketing profile found")
        
        # Show some existing themes as examples
        print("\n4. Sample of existing themes in system...")
        cursor.execute("""
            SELECT TOP 10 HubThemeId, ThemeDisplayName, ParamTheme, ParamHue
            FROM dbo.HubTheme 
            WHERE IsEnabled = 1
            ORDER BY ThemeDisplayName
        """)
        rows = cursor.fetchall()
        for row in rows:
            print(f"   - {row.ThemeDisplayName} ({row.ParamTheme}/{row.ParamHue})")
        
        conn.close()
        print("\n" + "=" * 60)
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    check_theme_status()


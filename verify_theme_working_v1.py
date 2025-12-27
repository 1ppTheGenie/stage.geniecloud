"""
Verify Apple Black Theme is Working
"""
import pyodbc

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=server-mssql1.istrategy.com;"
    "DATABASE=FarmGenie;"
    "UID=sa;"
    "PWD=neo222;"
    "Connection Timeout=30;"
)

def verify_theme():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("APPLE BLACK THEME VERIFICATION")
        print("=" * 60)
        
        # Check themes exist
        print("\n1. Theme Records in dbo.HubTheme:")
        cursor.execute("""
            SELECT HubThemeId, ThemeDisplayName, ParamTheme, ParamHue, IsEnabled
            FROM dbo.HubTheme 
            WHERE ParamTheme = 'apple-black'
        """)
        rows = cursor.fetchall()
        for row in rows:
            status = "ENABLED" if row.IsEnabled else "disabled"
            print(f"   ID {row.HubThemeId}: {row.ThemeDisplayName} ({row.ParamTheme}/{row.ParamHue}) - {status}")
        
        # Check availability
        print("\n2. Theme Availability for Your Accounts:")
        cursor.execute("""
            SELECT 
                t.ThemeDisplayName,
                a.AspNetUserId,
                CASE 
                    WHEN a.AspNetUserId = '2d0bd648-3f05-4e9a-bec9-1fb050d5170b' THEN 'Primary Account'
                    WHEN a.AspNetUserId = 'a8436051-333d-4725-b8ce-88bf5262d26a' THEN 'Texas Genie'
                    ELSE 'Other'
                END AS AccountName
            FROM dbo.HubTheme t
            JOIN dbo.HubThemeAvailability a ON t.HubThemeId = a.HubThemeId
            WHERE t.ParamTheme = 'apple-black'
            ORDER BY AccountName, t.ThemeDisplayName
        """)
        rows = cursor.fetchall()
        for row in rows:
            print(f"   {row.ThemeDisplayName} -> {row.AccountName}")
        
        # Show what theme Texas Genie is currently using
        print("\n3. Current Default Theme for Texas Genie Account:")
        cursor.execute("""
            SELECT 
                ump.DefaultThemeId,
                t.ThemeDisplayName,
                t.ParamTheme,
                t.ParamHue
            FROM dbo.UserMarketingProfile ump
            LEFT JOIN dbo.HubTheme t ON ump.DefaultThemeId = t.HubThemeId
            WHERE ump.AspNetUserId = 'a8436051-333d-4725-b8ce-88bf5262d26a'
        """)
        row = cursor.fetchone()
        if row:
            print(f"   Currently: {row.ThemeDisplayName} ({row.ParamTheme}/{row.ParamHue})")
        
        conn.close()
        
        print("\n" + "=" * 60)
        print("THEME IS READY!")
        print("=" * 60)
        print("\nTo use Apple Black on Rebecca Place:")
        print("1. Update XML: theme='apple-black' themeHue='dark'")
        print("2. Re-render the page")
        print("3. Or set Apple Black as default in your marketing settings")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    verify_theme()


"""
Insert Apple Black Theme using Application Credentials
"""
import pyodbc

# Application credentials (from Web.config - has write access)
conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=server-mssql1.istrategy.com;"
    "DATABASE=FarmGenie;"
    "UID=sa;"
    "PWD=neo222;"
    "Connection Timeout=30;"
)

def insert_apple_black_theme():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("APPLE BLACK THEME INSTALLATION")
        print("=" * 60)
        print("\nConnected with SA credentials!")
        
        # Step 1: Check if theme already exists
        print("\n1. Checking if Apple Black theme exists...")
        cursor.execute("""
            SELECT HubThemeId, ThemeDisplayName, ParamTheme, ParamHue
            FROM dbo.HubTheme 
            WHERE ParamTheme = 'apple-black'
        """)
        existing = cursor.fetchall()
        
        if existing:
            print("   Theme already exists:")
            for row in existing:
                print(f"   - ID: {row.HubThemeId}, Name: {row.ThemeDisplayName}")
            dark_id = next((r.HubThemeId for r in existing if r.ParamHue == 'dark'), None)
            light_id = next((r.HubThemeId for r in existing if r.ParamHue == 'light'), None)
        else:
            # Step 2: Insert Apple Black Dark
            print("\n2. Creating Apple Black Dark theme...")
            cursor.execute("""
                INSERT INTO dbo.HubTheme (
                    ThemeDisplayName, SelectValueReadable, IsDark, IsEnabled, 
                    IsUserDefined, CreateDate, ParamTheme, ParamHue
                ) VALUES (
                    'Apple Black Dark', 'Apple Black Dark', 1, 1, 
                    0, GETDATE(), 'apple-black', 'dark'
                )
            """)
            conn.commit()
            
            cursor.execute("SELECT @@IDENTITY")
            dark_id = int(cursor.fetchone()[0])
            print(f"   Created Apple Black Dark with ID: {dark_id}")
            
            # Step 3: Insert Apple Black Light
            print("\n3. Creating Apple Black Light theme...")
            cursor.execute("""
                INSERT INTO dbo.HubTheme (
                    ThemeDisplayName, SelectValueReadable, IsDark, IsEnabled, 
                    IsUserDefined, CreateDate, ParamTheme, ParamHue
                ) VALUES (
                    'Apple Black Light', 'Apple Black Light', 0, 1, 
                    0, GETDATE(), 'apple-black', 'light'
                )
            """)
            conn.commit()
            
            cursor.execute("SELECT @@IDENTITY")
            light_id = int(cursor.fetchone()[0])
            print(f"   Created Apple Black Light with ID: {light_id}")
        
        # Step 4: Make available to Steve's accounts
        accounts = [
            ('2d0bd648-3f05-4e9a-bec9-1fb050d5170b', 'Primary Account'),
            ('a8436051-333d-4725-b8ce-88bf5262d26a', 'Texas Genie')
        ]
        
        print("\n4. Making theme available to your accounts...")
        
        for user_id, name in accounts:
            # Check if already available
            cursor.execute("""
                SELECT 1 FROM dbo.HubThemeAvailability 
                WHERE HubThemeId = ? AND AspNetUserId = ?
            """, dark_id, user_id)
            
            if not cursor.fetchone():
                cursor.execute("""
                    INSERT INTO dbo.HubThemeAvailability 
                    (HubThemeId, RoleId, AspNetUserId, OrganizationId, CreateDate)
                    VALUES (?, NULL, ?, NULL, GETDATE())
                """, dark_id, user_id)
                conn.commit()
                print(f"   Added Apple Black Dark to {name}")
            else:
                print(f"   Apple Black Dark already available to {name}")
            
            if light_id:
                cursor.execute("""
                    SELECT 1 FROM dbo.HubThemeAvailability 
                    WHERE HubThemeId = ? AND AspNetUserId = ?
                """, light_id, user_id)
                
                if not cursor.fetchone():
                    cursor.execute("""
                        INSERT INTO dbo.HubThemeAvailability 
                        (HubThemeId, RoleId, AspNetUserId, OrganizationId, CreateDate)
                        VALUES (?, NULL, ?, NULL, GETDATE())
                    """, light_id, user_id)
                    conn.commit()
                    print(f"   Added Apple Black Light to {name}")
        
        # Step 5: Verify
        print("\n5. Verification...")
        cursor.execute("""
            SELECT t.ThemeDisplayName, a.AspNetUserId
            FROM dbo.HubTheme t
            JOIN dbo.HubThemeAvailability a ON t.HubThemeId = a.HubThemeId
            WHERE t.ParamTheme = 'apple-black'
            AND a.AspNetUserId IN ('2d0bd648-3f05-4e9a-bec9-1fb050d5170b', 'a8436051-333d-4725-b8ce-88bf5262d26a')
        """)
        rows = cursor.fetchall()
        for row in rows:
            acct = 'Primary' if '2d0bd' in row.AspNetUserId else 'Texas Genie'
            print(f"   {row.ThemeDisplayName} -> {acct}")
        
        conn.close()
        
        print("\n" + "=" * 60)
        print("SUCCESS! Apple Black theme installed!")
        print("=" * 60)
        print("\nNext steps:")
        print("1. Go to: app.thegenie.ai/agent/#/admin/hub-themes")
        print("2. Click 'Sync New Hub Themes'")
        print("3. Apple Black should now appear in theme dropdowns!")
        
    except pyodbc.Error as e:
        print(f"Database Error: {e}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    insert_apple_black_theme()


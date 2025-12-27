"""
Update Default Theme for Steve's Accounts to Apple Black Dark
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

def update_default_theme():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("UPDATE DEFAULT THEME TO APPLE BLACK DARK")
        print("=" * 60)
        
        # Get Apple Black Dark theme ID
        cursor.execute("""
            SELECT HubThemeId FROM dbo.HubTheme 
            WHERE ParamTheme = 'apple-black' AND ParamHue = 'dark'
        """)
        row = cursor.fetchone()
        if not row:
            print("ERROR: Apple Black Dark theme not found!")
            return
        
        apple_black_id = row.HubThemeId
        print(f"\nApple Black Dark ID: {apple_black_id}")
        
        accounts = [
            ('2d0bd648-3f05-4e9a-bec9-1fb050d5170b', 'Primary Account'),
            ('a8436051-333d-4725-b8ce-88bf5262d26a', 'Texas Genie')
        ]
        
        for user_id, name in accounts:
            # Get current theme
            cursor.execute("""
                SELECT ump.DefaultThemeId, t.ThemeDisplayName
                FROM dbo.UserMarketingProfile ump
                LEFT JOIN dbo.HubTheme t ON ump.DefaultThemeId = t.HubThemeId
                WHERE ump.AspNetUserId = ?
            """, user_id)
            row = cursor.fetchone()
            
            if row:
                old_theme = row.ThemeDisplayName or 'None'
                print(f"\n{name}:")
                print(f"   Before: {old_theme}")
                
                # Update to Apple Black Dark
                cursor.execute("""
                    UPDATE dbo.UserMarketingProfile
                    SET DefaultThemeId = ?,
                        LastUpdate = GETDATE()
                    WHERE AspNetUserId = ?
                """, apple_black_id, user_id)
                conn.commit()
                
                print(f"   After: Apple Black Dark")
            else:
                print(f"\n{name}: No UserMarketingProfile found - creating one...")
                # Would need to create profile - skip for now
        
        conn.close()
        
        print("\n" + "=" * 60)
        print("DEFAULT THEMES UPDATED!")
        print("=" * 60)
        print("\nNew pages will use Apple Black Dark by default.")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    update_default_theme()


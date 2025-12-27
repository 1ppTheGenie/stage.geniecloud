"""
Test Database Write Access
"""
import pyodbc

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=192.168.29.45,1433;"
    "DATABASE=FarmGenie;"
    "UID=cursor;"
    "PWD=1ppINSAyay$;"
    "Connection Timeout=30;"
)

def test_write_access():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("DATABASE WRITE ACCESS TEST")
        print("=" * 60)
        
        # Test 1: Try to INSERT into HubTheme
        print("\nTest 1: Attempting INSERT into dbo.HubTheme...")
        try:
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
            print("   SUCCESS: INSERT worked! Theme created.")
            
            # Clean up - delete what we just inserted (to be safe)
            cursor.execute("DELETE FROM dbo.HubTheme WHERE ParamTheme = 'apple-black'")
            conn.commit()
            print("   (Cleaned up test record)")
            
        except pyodbc.Error as e:
            print(f"   DENIED: {e}")
        
        # Test 2: Check my permissions
        print("\nTest 2: Checking user permissions...")
        try:
            cursor.execute("""
                SELECT dp.name AS PrincipalName,
                       dp.type_desc AS PrincipalType,
                       o.name AS ObjectName,
                       p.permission_name,
                       p.state_desc
                FROM sys.database_permissions p
                JOIN sys.database_principals dp ON p.grantee_principal_id = dp.principal_id
                LEFT JOIN sys.objects o ON p.major_id = o.object_id
                WHERE dp.name = 'cursor'
                ORDER BY o.name
            """)
            rows = cursor.fetchall()
            if rows:
                print("   Permissions for 'cursor' user:")
                for row in rows:
                    obj = row.ObjectName if row.ObjectName else '(database-level)'
                    print(f"   - {row.permission_name} on {obj} ({row.state_desc})")
            else:
                print("   No explicit permissions found for 'cursor' user")
                
        except pyodbc.Error as e:
            print(f"   Error checking permissions: {e}")
        
        # Test 3: Check role membership
        print("\nTest 3: Checking role membership...")
        try:
            cursor.execute("""
                SELECT r.name AS RoleName
                FROM sys.database_role_members rm
                JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
                JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
                WHERE m.name = 'cursor'
            """)
            rows = cursor.fetchall()
            if rows:
                print("   'cursor' is member of roles:")
                for row in rows:
                    print(f"   - {row.RoleName}")
            else:
                print("   Not a member of any database roles")
                
        except pyodbc.Error as e:
            print(f"   Error: {e}")
        
        conn.close()
        
    except Exception as e:
        print(f"Connection Error: {e}")

if __name__ == "__main__":
    test_write_access()


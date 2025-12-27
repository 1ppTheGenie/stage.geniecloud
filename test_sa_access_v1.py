"""
Test SA User Access
"""
import pyodbc

conn_str = (
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=192.168.29.45,1433;"
    "DATABASE=FarmGenie;"
    "UID=sa;"
    "PWD=1ppINSAyay$;"
    "Connection Timeout=30;"
)

def test_sa_access():
    try:
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        
        print("=" * 60)
        print("SA USER ACCESS TEST")
        print("=" * 60)
        print("\nConnection successful with SA user!")
        
        # Check role membership
        print("\nChecking SA permissions...")
        cursor.execute("""
            SELECT r.name AS RoleName
            FROM sys.database_role_members rm
            JOIN sys.database_principals r ON rm.role_principal_id = r.principal_id
            JOIN sys.database_principals m ON rm.member_principal_id = m.principal_id
            WHERE m.name = 'dbo' OR m.name = 'sa'
        """)
        rows = cursor.fetchall()
        if rows:
            print("SA is member of roles:")
            for row in rows:
                print(f"   - {row.RoleName}")
        
        # Check if we're sysadmin
        cursor.execute("SELECT IS_SRVROLEMEMBER('sysadmin')")
        is_sysadmin = cursor.fetchone()[0]
        print(f"\nIs sysadmin: {'YES' if is_sysadmin else 'NO'}")
        
        conn.close()
        print("\n" + "=" * 60)
        print("SA LOGIN WORKS!")
        print("=" * 60)
        
    except pyodbc.Error as e:
        print(f"Connection FAILED: {e}")

if __name__ == "__main__":
    test_sa_access()


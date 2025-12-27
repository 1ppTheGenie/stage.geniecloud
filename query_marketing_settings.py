"""
Query Marketing Settings for Texas Genie Account
ASP User ID: a8436051-333d-4725-b8ce-88bf5262d26a
"""
import pyodbc

# Texas Genie ASP User ID
USER_ID = 'a8436051-333d-4725-b8ce-88bf5262d26a'

# Connect to FarmGenie database
conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=192.168.29.45,1433;'
    'DATABASE=FarmGenie;'
    'UID=cursor;'
    'PWD=1ppINSAyay$;'
    'timeout=30'
)
cursor = conn.cursor()

# First, find tables with User or Marketing in name
print("=== TABLES WITH USER/MARKETING ===")
cursor.execute("""
    SELECT TABLE_NAME 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_NAME LIKE '%User%' 
       OR TABLE_NAME LIKE '%Market%' 
       OR TABLE_NAME LIKE '%Agent%'
       OR TABLE_NAME LIKE '%Setting%'
    ORDER BY TABLE_NAME
""")
tables = [row[0] for row in cursor.fetchall()]
for t in tables:
    print(t)

# Try to find the user
print("\n=== SEARCHING FOR USER ===")
for table in tables:
    try:
        cursor.execute(f"SELECT TOP 1 * FROM [{table}] WHERE Id = ? OR UserId = ?", USER_ID, USER_ID)
        row = cursor.fetchone()
        if row:
            print(f"\nFOUND in {table}:")
            cols = [desc[0] for desc in cursor.description]
            for i, col in enumerate(cols):
                val = row[i] if row[i] else '(empty)'
                if isinstance(val, str) and len(val) > 200:
                    val = val[:200] + '...'
                print(f"  {col}: {val}")
    except Exception as e:
        pass  # Table doesn't have Id or UserId column

conn.close()
print("\n=== DONE ===")


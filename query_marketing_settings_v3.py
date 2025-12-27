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

# First get the columns for UserMarketingProfile
print("=== UserMarketingProfile Columns ===")
cursor.execute("""
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'UserMarketingProfile'
    ORDER BY ORDINAL_POSITION
""")
columns = [row[0] for row in cursor.fetchall()]
print(columns)

# Find the ID column name
id_col = None
for c in columns:
    if 'id' in c.lower() and 'user' in c.lower():
        id_col = c
        break
    elif c.lower() == 'id':
        id_col = c

print(f"\nUsing column: {id_col or 'Id'}")

# Query using correct column
col_to_use = id_col or 'Id'
cursor.execute(f"SELECT * FROM UserMarketingProfile WHERE [{col_to_use}] = ?", USER_ID)
row = cursor.fetchone()
if row:
    print("\n=== TEXAS GENIE MARKETING PROFILE ===")
    cols = [desc[0] for desc in cursor.description]
    for i, col in enumerate(cols):
        val = row[i] if row[i] else '(empty)'
        if isinstance(val, str) and len(val) > 300:
            val = val[:300] + '...'
        print(f"{col}: {val}")
else:
    print("Not found - trying AspNetUserId column")
    for c in columns:
        if 'asp' in c.lower() or 'user' in c.lower():
            try:
                cursor.execute(f"SELECT * FROM UserMarketingProfile WHERE [{c}] = ?", USER_ID)
                row = cursor.fetchone()
                if row:
                    print(f"Found using {c}!")
                    cols = [desc[0] for desc in cursor.description]
                    for i, col in enumerate(cols):
                        val = row[i] if row[i] else '(empty)'
                        if isinstance(val, str) and len(val) > 300:
                            val = val[:300] + '...'
                        print(f"{col}: {val}")
                    break
            except:
                pass

conn.close()
print("\n=== DONE ===")


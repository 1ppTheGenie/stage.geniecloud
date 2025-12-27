"""
Query Marketing Images for Texas Genie Account
ASP User ID: a8436051-333d-4725-b8ce-88bf5262d26a
"""
import pyodbc

USER_ID = 'a8436051-333d-4725-b8ce-88bf5262d26a'

conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=192.168.29.45,1433;'
    'DATABASE=FarmGenie;'
    'UID=cursor;'
    'PWD=1ppINSAyay$;'
    'timeout=30'
)
cursor = conn.cursor()

# Get columns for UserMarketingImage
print("=== UserMarketingImage Columns ===")
cursor.execute("""
    SELECT COLUMN_NAME 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = 'UserMarketingImage'
    ORDER BY ORDINAL_POSITION
""")
columns = [row[0] for row in cursor.fetchall()]
print(columns)

# Query using AspNetUserId
print("\n=== TEXAS GENIE MARKETING IMAGES ===")
cursor.execute("SELECT * FROM UserMarketingImage WHERE AspNetUserId = ?", USER_ID)
rows = cursor.fetchall()
if rows:
    cols = [desc[0] for desc in cursor.description]
    for row in rows:
        print("\n---")
        for i, col in enumerate(cols):
            val = row[i] if row[i] else '(empty)'
            if isinstance(val, str) and len(val) > 400:
                val = val[:400] + '...'
            print(f"{col}: {val}")
else:
    print("No images found")

# Also check MarketingImageType to understand types
print("\n=== MarketingImageType Reference ===")
cursor.execute("SELECT * FROM MarketingImageType ORDER BY Id")
rows = cursor.fetchall()
cols = [desc[0] for desc in cursor.description]
for row in rows:
    type_info = {cols[i]: row[i] for i in range(len(cols))}
    print(f"  {type_info}")

# Check AspNetUsers for additional info
print("\n=== AspNetUsers Basic Info ===")
cursor.execute("""
    SELECT Id, UserName, Email, FirstName, LastName, Phone, PhotoUrl 
    FROM AspNetUsers WHERE Id = ?
""", USER_ID)
row = cursor.fetchone()
if row:
    cols = [desc[0] for desc in cursor.description]
    for i, col in enumerate(cols):
        val = row[i] if row[i] else '(empty)'
        print(f"{col}: {val}")

conn.close()
print("\n=== DONE ===")


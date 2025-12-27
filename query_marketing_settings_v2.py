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

# Query UserMarketingProfile for Texas Genie
print("=== UserMarketingProfile ===")
cursor.execute("SELECT * FROM UserMarketingProfile WHERE UserId = ?", USER_ID)
row = cursor.fetchone()
if row:
    cols = [desc[0] for desc in cursor.description]
    for i, col in enumerate(cols):
        val = row[i] if row[i] else '(empty)'
        if isinstance(val, str) and len(val) > 300:
            val = val[:300] + '...'
        print(f"{col}: {val}")
else:
    print("Not found in UserMarketingProfile")

# Also check AspNetUsers for basic info
print("\n=== AspNetUsers ===")
cursor.execute("SELECT Id, UserName, Email, FirstName, LastName, Phone FROM AspNetUsers WHERE Id = ?", USER_ID)
row = cursor.fetchone()
if row:
    cols = [desc[0] for desc in cursor.description]
    for i, col in enumerate(cols):
        val = row[i] if row[i] else '(empty)'
        print(f"{col}: {val}")
else:
    print("Not found in AspNetUsers")

# Check UserMarketingImage for logos/photos
print("\n=== UserMarketingImage ===")
cursor.execute("SELECT * FROM UserMarketingImage WHERE UserId = ?", USER_ID)
rows = cursor.fetchall()
if rows:
    cols = [desc[0] for desc in cursor.description]
    for row in rows:
        print("---")
        for i, col in enumerate(cols):
            val = row[i] if row[i] else '(empty)'
            if isinstance(val, str) and len(val) > 200:
                val = val[:200] + '...'
            print(f"  {col}: {val}")
else:
    print("No images found")

# Check UserMarketingDisclaimer
print("\n=== UserMarketingDisclaimer ===")
cursor.execute("SELECT * FROM UserMarketingDisclaimer WHERE UserId = ?", USER_ID)
rows = cursor.fetchall()
if rows:
    cols = [desc[0] for desc in cursor.description]
    for row in rows:
        print("---")
        for i, col in enumerate(cols):
            val = row[i] if row[i] else '(empty)'
            if isinstance(val, str) and len(val) > 200:
                val = val[:200] + '...'
            print(f"  {col}: {val}")
else:
    print("No disclaimers found")

conn.close()
print("\n=== DONE ===")


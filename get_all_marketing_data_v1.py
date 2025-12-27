"""
Get ALL Marketing Data for Texas Genie Account
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

# Get MarketingImageType 
print("=== MarketingImageType ===")
cursor.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'MarketingImageType'")
print([row[0] for row in cursor.fetchall()])

cursor.execute("SELECT * FROM MarketingImageType")
rows = cursor.fetchall()
cols = [desc[0] for desc in cursor.description]
for row in rows:
    print(dict(zip(cols, row)))

# Get all images for user with type names
print("\n=== Texas Genie Images ===")
cursor.execute("""
    SELECT m.UserMarketingImageId, m.MarketingImageTypeId, t.Name as TypeName, m.Url
    FROM UserMarketingImage m 
    LEFT JOIN MarketingImageType t ON m.MarketingImageTypeId = t.MarketingImageTypeId 
    WHERE m.AspNetUserId = ?
""", USER_ID)
rows = cursor.fetchall()
cols = [desc[0] for desc in cursor.description]
for row in rows:
    print(dict(zip(cols, row)))

# Get user address info
print("\n=== User Address (UserOffice) ===")
cursor.execute("SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'UserOffice'")
print([row[0] for row in cursor.fetchall()])

cursor.execute("SELECT * FROM UserOffice WHERE AspNetUserId = ?", USER_ID)
rows = cursor.fetchall()
cols = [desc[0] for desc in cursor.description]
for row in rows:
    print(dict(zip(cols, row)))

conn.close()
print("\n=== DONE ===")


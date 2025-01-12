import psycopg2

con = psycopg2.connect(
    host='localhost',
    database='pokemon',
    user='postgres',
    password='password',
    port='5434'
)

cur = con.cursor()
cur.execute('SELECT * FROM Pokemon')
res = cur.fetchall()
print(res)
con.close()
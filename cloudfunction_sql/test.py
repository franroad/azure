import pymysql

# Connect to the database
connection = pymysql.connect(unix_socket='/home/franciscobe/cloudsql/test-policy-356412:us-central1:fran-sql',
                             user='fran',
                             password='XXX',
                             database='products',
                             cursorclass=pymysql.cursors.DictCursor)

#run a select
with connection:
     with connection.cursor() as cursor:
        
        sql = "SELECT * FROM `products`"# select all from the table producst
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)

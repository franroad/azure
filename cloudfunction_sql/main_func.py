import pymysql
import os # libreria necesaria para lo de os.environ.


def get_products(value): #recieving the 50 passeed as an arg 
# Connect to the database
    connection = pymysql.connect(unix_socket='/home/franciscobe/cloudsql/test-policy-356412:us-central1:fran-sql',#ruta al string/socket que se crea cuando nos conectamos con las credenciales por primera vez.
                             user='fran',
                             password="password", #la pasamos como variable de entorno we specify this at Cloud function config
                             database='products',
                             cursorclass=pymysql.cursors.DictCursor)

#run a select
    with connection:
        with connection.cursor() as cursor:
            max_price=value
            sql="SELECT `product_name` FROM `products` WHERE `price` >=%s;"
            #sql="SELECT * FROM `products` WHERE `price` >=%s;"
            cursor.execute(sql,(max_price))
            result=cursor.fetchall()#-->selects all the possible rows matching
            #result=cursor.fetchone()#only selects one row
            print(result)
        
            #sql = "SELECT * FROM `products`"# select all from the table producst
            #cursor.execute(sql)
            #result = cursor.fetchall()
            #print(result)

get_products(50) #calling the function,sending the 50 as an arg.
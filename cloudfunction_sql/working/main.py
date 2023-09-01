import sqlalchemy
#info =https://codelabs.developers.google.com/codelabs/connecting-to-cloud-sql-with-cloud-functions#2
db_user="fran"
db_password="1231"
db1="products"
con_name="test-policy-356412:us-central1:fran-sql"

# If your database is MySQL, uncomment the following two lines:
driver_name = 'mysql+pymysql'
query_string = dict({"unix_socket": "/cloudsql/{}".format(con_name)})

def select(request):
    request_json = request.get_json()
    
    
    db = sqlalchemy.create_engine(
      sqlalchemy.engine.url.URL(
        drivername=driver_name,
        username=db_user,
        password=db_password,
        database=db1,
        query=query_string,
      ),
      pool_size=5,
      max_overflow=2,
      pool_timeout=30,
      pool_recycle=1800
    )
    try:
        with db.connect() as conn:
            results=conn.execute(sqlalchemy.text("SELECT * FROM products")).fetchall()
         
            print(results)

    except Exception as e:
        return 'Error: {}'.format(str(e))
    return 'ok'
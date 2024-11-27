import oracledb
import os
import platform

# d = None                               # On Linux, no directory should be passed
# if platform.system() == "Darwin":      # macOS
#   d = os.environ.get("HOME")+("/Downloads/instantclient_23_3")
# elif platform.system() == "Windows":   # Windows
#   d = r"C:\oracle\instantclient_23_6\instantclient_23_6"
# oracledb.init_oracle_client(lib_dir=d)


class Database:
  def __init__(self):
    self.d = None                               # On Linux, no directory should be passed
    if platform.system() == "Darwin":      # macOS
      self.d = os.environ.get("HOME")+("/Downloads/instantclient_23_3")
    elif platform.system() == "Windows":   # Windows
      self.d = r"C:\oracle\instantclient_23_6\instantclient_23_6"
    oracledb.init_oracle_client(lib_dir=d)
    self.un = 'CSNAME'
    self.cs = 'oracle.cs.torontomu.ca'
    self.pw = 'DDMMXXXX'

  def test_db(self):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = """select sysdate from dual"""
          for r in cursor.execute(sql):
              print(r)

  def get_users(self):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = """SELECT * FROM CUSTOMERS"""
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
  
  def login(self, username, password):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM CUSTOMERS WHERE customer_id = " + username + ", password = " + password 
          cursor.execute(sql)
          row = cursor.fetchone()
          return row

  def get_product_ids(self, pid):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM PRODUCTS WHERE product_id = " + pid 
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
      
  def get_product_id(self, pid):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM PRODUCTS WHERE product_id = " + pid 
          cursor.execute(sql)
          rows = cursor.fetchone()
          return rows
  
  def get_seller_ids(self, sid):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM PRODUCTS WHERE seller_id = " + sid
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
  
  def get_category(self, cat):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM PRODUCTS WHERE categories = " + cat
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
      
  def seller_info(self, sid):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT i.* FROM Products p JOIN Inventory i ON p.product_id = i.product_id WHERE p.seller_id = " + sid
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
      
  def order_history(self, cid):
    with oracledb.connect(user=self.un, password=self.pw, host=self.cs, port=1521, sid="orcl") as connection:
      with connection.cursor() as cursor:
          sql = "SELECT * FROM Order_History WHERE customer_id = " + cid
          cursor.execute(sql)
          rows = cursor.fetchall()
          return rows
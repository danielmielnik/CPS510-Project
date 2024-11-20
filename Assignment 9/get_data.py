import oracledb
import os
import platform

d = None                               # On Linux, no directory should be passed
if platform.system() == "Darwin":      # macOS
  d = os.environ.get("HOME")+("/Downloads/instantclient_23_3")
elif platform.system() == "Windows":   # Windows
  d = r"C:\oracle\instantclient_23_6\instantclient_23_6"
oracledb.init_oracle_client(lib_dir=d)


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

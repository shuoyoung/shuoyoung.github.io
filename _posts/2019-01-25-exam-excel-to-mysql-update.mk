`import pymysql
import re

host = 'hostip'
username = 'root'
password = 'root'

def connectMySQL():
    print('开始连接数据库')
    # 打开数据库连接
    db = pymysql.connect(host,username,password,charset='utf8')

    # 使用 cursor() 方法创建一个游标对象 cursor
    cursor = db.cursor()

    cursor.execute('use 库名')

    # 开始操作
    filename = ''#给定路径
    executeScriptsFromFile(filename, cursor)

    db.close()


def executeScriptsFromFile(filename,cursor):
    fd = open(filename, 'r',encoding='utf-8')
    while True:
        line = fd.readline()
        if not line:
            break
        # 使用正则获取每行的：    身份证号   班级
        match_obj = re.match(r'(\S+)\s+(\d+)', line, re.I)
        if match_obj:
            id_num = match_obj.group(1)
            class_num = match_obj.group(2)
            #执行sql语句，sql语句根据正则匹配到的id_num，在表中寻找对应记录修改class_num

        else:
            print("No match")
    

    print('sql执行完成')
    fd.close()

if __name__ == "__main__":
    connectMySQL()`

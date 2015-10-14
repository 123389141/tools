# -*- coding: UTF-8 -*-

#指定要替换的文件
def configRepFile():
    file = 'replace.txt'
    return file
#指定要替换文件的替换内容
def configReplace(hj):
    cs = {'strFind':'private static final String URL_FIRST = "http://mobile-api2011.elong.com/bus/"','strRepl':'aaaaaaa static final String URL_FIRST = "http://172.21.11.144:8080/bus/"'}
    hd = {'strFind':'private static final String URL_FIRST = "http://mobile-api2011.elong.com/bus/"','strRepl':'bbbbbbb static final String URL_FIRST = "http://172.21.11.144:8080/bus/"'}
    sc = {'strFind':'private static final String URL_FIRST = "http://mobile-api2011.elong.com/bus/"','strRepl':'ccccccc static final String URL_FIRST = "http://172.21.11.144:8080/bus/"'}
    
    if hj == 'cs':
        return cs
    if hj == 'hd':
        return hd
    if hj == 'sc':
        return sc
    return {'strFind':'','strRepl':''}

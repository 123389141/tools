# -*- coding: UTF-8 -*-
import sys
import config

#读取配置文件
def readConfigFile(hj):
    global REPLACEFILE
    global STRFIND
    global STRREPL
    REPLACEFILE = config.configRepFile()
    STRFIND = config.configReplace(hj)['strFind']
    STRREPL = config.configReplace(hj)['strRepl']
    #print 'read config faild or not found config.py'

#替换主方法
def replace(replaceFile,strFind,strRepl):
    try:
        f = open(replaceFile,'r')
        fileInfo = f.read()
        newFileInfo = fileInfo.replace(strFind,strRepl)
        #print newFileInfo
        f.close

        f = open('replaceFile','w')
        f.write(newFileInfo)
        f.close
        
        return True
    except:
        return False

if __name__ == '__main__':
    hj = sys.argv[1]
    readConfigFile(hj)
    replaceFile = REPLACEFILE
    strFind = STRFIND
    strRepl = STRREPL
    if replace(replaceFile,strFind,strRepl):  
        print "repalce success"  
    else:  
        print "repalce false" 

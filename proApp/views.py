from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from proApp import dbconnection
from django.core.files.storage import FileSystemStorage
from datetime import date
import os
basepath = os.path.dirname(__file__)
# Create your views here.
def home(request):  
    qry1="select * from staff order by id desc"
    data=dbconnection.selectalldata(qry1)
    return render(request,'index.html',{'data':data})

def scan(request): 
    if request.method=='POST':
        u =request.POST.get("u") 
        pas =request.POST.get("pas")          
        qry="select * from login where uid='"+u+"' and pwd='"+pas+"'"
        data=dbconnection.selectdata(qry)   
        if data:
            utype=data[3]
            print(utype)
            if utype =="stf":
                request.session['u']=u
                return HttpResponseRedirect("http://127.0.0.1:8000/vain")
            else:
                request.session['x']=u
                return HttpResponseRedirect("http://127.0.0.1:8000/adminhome")
        else:
           return HttpResponseRedirect("http://127.0.0.1:8000/scan?error=1") 
    if request.GET.get("error"):
        x=1
    else:
        x=0     
    return render(request,'scan.html',{'x':x})


def login(request):  
    if request.method=='POST':
        a=request.POST.get('uid')
        b=request.POST.get('pas')
        sql="select * from login where uid='"+a+"' and pwd='"+b+"'"
        data=dbconnection.logindata(sql)
        if data:                        
            if data[3]=="admin":
                request.session['x']=a
                return HttpResponseRedirect("http://127.0.0.1:8000/adminhome")
    return render(request,'login.html',{})

def adhome(request):
    qry1="select * from staff order by id desc"
    data=dbconnection.selectalldata(qry1)
    return render(request,'office/index.html',{'data':data})


def logout(request):
    return HttpResponseRedirect("http://127.0.0.1:8000/")

from django.urls import path
from . import views


urlpatterns = [
    path('', views.home), 
    path('scan/', views.scan), 
    path('login/', views.login), 
    path('adminhome/', views.adhome),
    path('logout/', views.logout),
]

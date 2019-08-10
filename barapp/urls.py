from django.urls import path
from . import views

urlpatterns = [
    path('', views.main, name='main'),
    path('drink/', views.build_drink, name='build_drink'),
    path('savetab', views.saveTab, name='savetab')
]
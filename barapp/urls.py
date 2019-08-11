from django.urls import path
from . import views

urlpatterns = [
    path('', views.main, name='main'),
    path('category/<int:category_pk>', views.category, name='beer'),
    path('drink/', views.build_drink, name='build_drink'),
    path('savetab', views.saveTab, name='savetab')
]
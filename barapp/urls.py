from django.urls import path
from . import views

urlpatterns = [
    path('', views.main, name='main'),
    path('category/<int:category_pk>', views.category, name='category'),
    path('neworder', views.newOrder, name='new-order'),
    path('saveorder', views.saveOrder, name='save-order'),
    path('startorder/<int:tab_pk>', views.startOrder, name='start-order'),


    # path('drink/', views.build_drink, name='build_drink'),
    # path('savetab', views.saveTab, name='savetab')
]
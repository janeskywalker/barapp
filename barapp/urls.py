from django.urls import path
from . import views

urlpatterns = [
    # main page, either in session or no session
    path('', views.main, name='main'),

    # user click on new order btn to create new order
    path('neworder', views.newOrder, name='new-order'),

    # user click on catetory, either in session or no session
    path('category/<int:category_pk>', views.category, name='category'),

    # user click on drink and ingredient item button to add to order
    path('addDrinkToOrder', views.addDrinkToOrder, name='add-drink'),

    path('addIngredientToOrder', views.addIngredientToOrder, name='add-ingredient'),


    # user click on save order to save order
    path('saveorder/<int:tab_pk>', views.saveOrder, name='save-order'),

    # user click on close tab to close current session
    path('closetab/<int:tab_pk>', views.closeTab, name='close-tab'),

    # just an endpoint serve  no specific purpose
    path('startorder/<int:tab_pk>', views.startOrder, name='start-order'),

]
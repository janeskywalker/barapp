from django.contrib import admin
from .models import User, Tab, Ingredient, Drink, Category

# Register your models here.
admin.site.register(Tab)
admin.site.register(Ingredient)
admin.site.register(Drink)
admin.site.register(Category)
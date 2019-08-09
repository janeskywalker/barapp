from django.contrib import admin
from .models import User, Tab, Ingredient, Recipe, Drink, Category

# Register your models here.
admin.site.register(Tab)
admin.site.register(Ingredient)
admin.site.register(Recipe)
admin.site.register(Drink)
admin.site.register(Category)
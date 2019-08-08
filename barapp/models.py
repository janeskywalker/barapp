from django.db import models
from django.contrib.auth.models import User

# Create your models here.


# User model - bar tender


# Tab model - order and customer
class Tab(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    open_date_time = models.DateTimeField(auto_now_add=True)
    close_date_time = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='tabs')

    def __str__(self):
        return self.open_date_time


# drink model
class Drink(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    price = models.IntegerField(default=0)
    tab = models.ForeignKey(
        Tab, on_delete=models.CASCADE, related_name='drinks')

    def __str__(self):
        return self.name


# Ingredient model
class Ingredient(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    price = models.IntegerField(default=0)
    category = models.CharField(max_length=100, default="unassigned")
    location = models.CharField(max_length=100, default="unassigned")
    single_serve = models.BooleanField(default=True)
    tasting_note = models.TextField(default="unassigned")
    drink = models.ForeignKey(
        Drink, on_delete=models.CASCADE, related_name='ingredients')

    def __str__(self):
        return self.name


# Recipe model
class Recipe(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    ingredients_list = models.TextField(max_length=1000, default="unassigned")
    preperation = models.TextField(max_length=1000, default="unassigned")
    location = models.CharField(max_length=100, default="unassigned")
    category = models.TextField(max_length=1000, default="unassigned")

    def __str__(self):
        return self.name

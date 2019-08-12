from django.db import models
from django.contrib.auth.models import User


# from django.db.models import CharField, Model
# from django_mysql.models import ListCharField
# from djangotoolbox.fields import ListField

# class Person(Model):
#     name = CharField()
#     post_nominals = ListCharField(
#         base_field=CharField(max_length=10),
#         size=6,
#         max_length=(6 * 11)  # 6 * 10 character nominals, plus commas
#     )

# Create your models here.






class Category(models.Model):
    name = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return self.name




class Ingredient(models.Model):
    name = models.CharField(max_length=100)
    price = models.IntegerField(default=0)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)
 
    def __str__(self):
        return self.name


class Drink(models.Model):
    name = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)
    ingredients = models.ManyToManyField(Ingredient)

    def __str__(self):
        return self.name

# Tab model - order and customer
class Tab(models.Model):
    name = models.CharField(max_length=100)
    open_date_time = models.DateTimeField(auto_now_add=True)
    close_date_time = models.DateTimeField(auto_now_add=False, blank=True, null=True)
    drinks = models.ManyToManyField(Drink, blank=True)
    ingredients = models.ManyToManyField(Ingredient, blank=True)

    def __str__(self):
        return self.name
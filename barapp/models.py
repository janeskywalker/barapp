from django.db import models
from django.contrib.auth.models import User


from django.contrib.postgres.fields import ArrayField


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



# Tab model - order and customer
class Tab(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    open_date_time = models.DateTimeField(auto_now_add=True)
    close_date_time = models.DateTimeField(auto_now_add=False, blank=True, null=True)
    # drink_id = ListCharField(
    #     base_field=CharField(max_length=10),
    #     size=6,
    #     max_length=(6 * 11)  # 6 * 10 character nominals, plus commas
    # )

    drink_id = ArrayField(
        ArrayField(
            models.CharField(max_length=10, blank=True),
            size=8,
        ),
        size=8,
    ),
    ingredients_id = ArrayField(
        ArrayField(
            models.CharField(max_length=10, blank=True),
            size=8,
        ),
        size=8
    )

    def __str__(self):
        return self.name


class Category(models.Model):
    name = models.CharField(max_length=100, blank=True)

    def __str__(self):
        return self.name

class Drink(models.Model):
    name = models.CharField(max_length=100, default="unassigned"),
    category_id = ArrayField(
        ArrayField(
            models.CharField(max_length=10, blank=True),
            size=8,
        ),
        size=8,
    ),
    ingredients_id = ArrayField(
        ArrayField(
            models.CharField(max_length=10, blank=True),
            size=8,
        ),
        size=8,
    ),

    def __str__(self):
        return self.name


class Ingredient(models.Model):
    name = models.CharField(max_length=100, default="unassigned")
    price = models.IntegerField(default=0)
    # category = models.ManyToManyField(Category)
    category_id = ArrayField(
        ArrayField(
            models.CharField(max_length=10, blank=True),
            size=8,
        ),
        size=8,
    ),
 
    def __str__(self):
        return self.name
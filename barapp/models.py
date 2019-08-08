from django.db import models

# Create your models here.

# User model - bar tender


class User(models.Model):
    name = models.CharField(max_length=100)
    nationality = models.CharField(max_length=100)
    photo_url = models.TextField()
    spotify_link = models.TextField(default='https://www.spotify.com/')
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='artists')

    def __str__(self):
        return self.name

    def hello(self):
        return f"I am {self.name}"

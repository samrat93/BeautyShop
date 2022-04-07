from django.db import models
from django.db.models.base import Model
from store.models.contact import *
from store.models.category import *
from store.models.customer import *
from store.models.orders import *
from store.models.product import *
from store.models.orders import *

# Create your models here.
class Image_slider(models.Model):
    title = models.CharField(max_length=100)
    img = models.ImageField(upload_to = 'Image_Slider')
    desc = models.TextField()
    def __str__(self):
        return self.title

class Vlogs(models.Model):
    title = models.CharField(max_length=150)
    urls = models.URLField(max_length = 200)
    date = models.DateField()

class About_us(models.Model):
    title = models.CharField(max_length=150)
    date = models.DateField()
    desc = models.TextField()
    image = models.ImageField(upload_to = 'About_us')

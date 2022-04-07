from django.db import models
from django.db.models.fields import CharField

class City(models.Model):
    city_name = CharField(max_length=25,null=True)


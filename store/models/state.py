from django.db import models
from django.db.models.fields import CharField

class State(models.Model):
    state_name = CharField(max_length=25,null=True)


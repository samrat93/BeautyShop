from django.db import models

class Contact(models.Model):
    name = models.CharField(max_length=35)
    subject = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=12)
    message = models.TextField() 

    def Contact(self):
        self.save()

    def __str__(self):
        return self.name

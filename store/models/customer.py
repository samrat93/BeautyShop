from django.db import  models
from django.core.validators import MinLengthValidator
from django.db.models.fields import CharField

class Customer(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone = models.CharField(max_length=12)
    email = models.EmailField()
    password = models.CharField(max_length=500)
    gender = models.CharField(max_length=10,null=True)
    state = models.CharField(max_length=25,null=True)
    city = models.CharField(max_length=25,null=True)
    address = models.CharField(max_length=500,null=True)
    pincode = models.CharField(max_length=10,null=True)
    image = models.ImageField(upload_to = 'user_profile_img',null=True)


    def register(self):
        self.save()

    @staticmethod
    def get_customer_by_email(email):
        try:
            return Customer.objects.get(email=email)
        except:
            return False

    @staticmethod
    def get_customer_by_id(c_id):
        try:
            return Customer.objects.get(id=c_id)
        except:
            return False


    def isExists(self):
        if Customer.objects.filter(email = self.email):
            return True

        return  False





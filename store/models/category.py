from django.db import  models

class Category(models.Model):
    name = models.CharField(max_length=20)
    image = models.ImageField(upload_to='uploads/category/')
    description = models.CharField(max_length=200, default='' , null=True , blank=True)

    @staticmethod
    def get_all_categories():
        return Category.objects.all()

    def __str__(self):
        return self.name

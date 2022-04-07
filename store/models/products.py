from store.models.products import *
from store.models.category import *
from store.models.contact import *
from store.models.orders import *
from store.models.product import *
from dashboard.models import Image_slider

class Products(models.Model):
    @staticmethod
    def get_products_by_id(ids):
        return Product.objects.filter(id__in =ids)

    @staticmethod
    def get_all_products():
        return Product.objects.all()

    @staticmethod
    def get_all_products_by_categoryid(category_id):
        if category_id:
            return Product.objects.filter(category = category_id)
        else:
            return Product.get_all_products();
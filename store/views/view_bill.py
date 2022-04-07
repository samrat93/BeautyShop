from django.shortcuts import render, redirect
from store.models.customer import Customer
from django.views import View
from store.models.product import Product
from store.models.orders import Order
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa

class View_bill(View,):
    def get(self,request,id):
        order = Order.objects.get(id =id)
        return render(request,'view_bill.html',{'order':order})
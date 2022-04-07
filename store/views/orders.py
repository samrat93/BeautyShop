from django.shortcuts import render, redirect

from django.contrib.auth.hashers import check_password
from store.models.customer import Customer
from django.views import View

from store.models.product import Product
from store.models.orders import Order
from store.middlewares.auth import auth_middleware
from django.core.paginator import Paginator

class OrderView(View):
    def get(self , request ):
        customer = request.session.get('customer')
        orders_list = Order.get_orders_by_customer(customer)
        paginator = Paginator(orders_list,6)
        page_number = request.GET.get('page')
        orders = paginator.get_page(page_number)
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request , 'orders.html'  , {'orders' : orders,'cust_data':cust_data})
        else:
            print(orders)
            return render(request , 'orders.html'  , {'orders' : orders})

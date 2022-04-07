from django.shortcuts import render , redirect

from django.contrib.auth.hashers import  check_password
from store.models.customer import Customer
from django.views import  View
from store.models.product import  Product
from store.models import Order

class Check_out(View):
    def post(self,request):
        address = request.POST.get('address')
        phone = request.POST.get('phone')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        country = request.POST.get('country')
        postal = request.POST.get('postal')
        
        customer = request.session.get('customer')
        cart = request.session.get('cart')
        products = Product.get_products_by_id(list(cart.keys()))
        print(address, phone, customer, "heelo",cart, products)

        for product in products:
            print(cart.get(str(product.id)))
            order = Order(customer=Customer(id=customer),
                          product=product,
                          price=product.price*cart.get(str(product.id)),
                          address=address,
                          phone=phone,
                          first_name = first_name,
                          last_name = last_name,
                          email = email,
                          country = country,
                          postal = postal,
                          quantity=cart.get(str(product.id)))
            order.save()
        request.session['cart'] = {}

        return redirect('cart')

    def get(self , request):
        ids = list(request.session.get('cart').keys())
        products = Product.get_products_by_id(ids)
        print(products)
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request , 'checkout.html' , {'products' : products,'cust_data':cust_data})
        else:
            return render(request , 'checkout.html' , {'products' : products} )

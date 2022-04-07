from django.shortcuts import render , redirect

from django.contrib.auth.hashers import  check_password
from store.models.customer import Customer
from django.views import  View
from store.models.product import  Product

class Cart(View):
    def post(self,request):
        product = request.POST.get('product')
        remove = request.POST.get('remove')
        cart = request.session.get('cart')
        if cart:
            quantity = cart.get(product)
            if quantity:
                if remove:
                    if quantity<=1:
                        cart.pop(product)
                    else:
                        cart[product] = quantity-1
                else:
                    cart[product] = quantity+1
            else:
                cart[product] = 1
        else:
            cart = {}
            cart[product] =1
        request.session['cart'] = cart
        print('cart',request.session['cart'])
        return redirect('cart')

    def get(self , request):
        ids = list(request.session.get('cart').keys())
        products = Product.get_products_by_id(ids)
        print(products)
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request , 'cart.html' , {'products' : products,'cust_data':cust_data})
        else:
            return render(request , 'cart.html' , {'products' : products} )

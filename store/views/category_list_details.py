from store.views import product_details
from django.core import paginator
from django.shortcuts import render , redirect , HttpResponseRedirect
from django.views import View
from store.models.product import Product
from store.models.category import Category
from store.models.customer import Customer
from dashboard.models import Image_slider
from django.core.paginator import Paginator

class category_list_details(View):
    def post(self,request,id):
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
        catid = Category.objects.get(id = id)
        #category = Category.objects.filter(catid)
        if catid:
            products = Product.get_all_products_by_categoryid(catid)
        return render(request,'category_list_view.html',{'products':products})

    def get(self,request,id):
        cart = request.session.get('cart')
        if not cart:
            request.session['cart'] = {}
        products = None
        catid = Category.objects.get(id = id)
        if catid:
            products = Product.get_all_products_by_categoryid(catid)
            categories = Category.objects.all()
            data = {}
            data['catid'] = catid
            data['products'] = products
            data['categories']= categories
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            data = {}
            data['catid'] = catid
            data['products'] = products
            data['categories']= categories
            data['cust_data'] = cust_data
            return render(request,'category_list_view.html',data)
        else:
            print('you are : ', request.session.get('email'))
            return render(request,'category_list_view.html',data)
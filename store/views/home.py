from django.core import paginator
from dashboard.models import Image_slider
from django.shortcuts import render , redirect , HttpResponseRedirect
from store.models.product import Product
from store.models.category import Category
from store.models.customer import Customer
from django.views import View
from django.core.paginator import Paginator


class Index(View):
    def post(self , request):
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
                        cart[product]  = quantity-1
                else:
                    cart[product]  = quantity+1

            else:
                cart[product] = 1
        else:
            cart = {}
            cart[product] = 1

        request.session['cart'] = cart
        print('cart' , request.session['cart'])
        return redirect('homepage')


    def get(self , request):
        # print()
        return HttpResponseRedirect(f'/store{request.get_full_path()[1:]}')

def store(request):
    cust = Customer.objects.all()
    cart = request.session.get('cart')
    if not cart:
        request.session['cart'] = {}
    products = None
    categories = Category.get_all_categories()
    slider = Image_slider.objects.all()
    #vlogs = Vlogs.objects.all()
    categoryID = request.GET.get('category')
    if categoryID:
        products = Product.get_all_products_by_categoryid(categoryID)
    else:
        products = Product.get_all_products()
    if request.session.has_key('customer'):
        get_session_id = request.session['customer']
        cust_data = Customer.objects.get(id = get_session_id)
        data = {}
        data['products'] = products
        data['categories'] = categories
        data['slider'] = slider
        data['cust_data'] = cust_data
        print('you are : ', request.session.get('email'))
        return render(request, 'index.html',data)
    else:
        data = {}
        data['products'] = products
        data['categories'] = categories
        data['slider'] = slider
        print('you are : ', request.session.get('email'))
        return render(request, 'index.html',data)



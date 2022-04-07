from django.shortcuts import render , redirect , HttpResponseRedirect
from django.views import View
from store.models.product import Product
from store.models.category import Category
from django.db.models import Q
from store.models import Customer

class Search(View):
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
    
        return redirect('search')

    def get(self,request):
        cart = request.session.get('cart')
        if not cart:
            request.session['cart'] = {}
        products = None
        categories = Category.objects.all()
        query = request.GET['search']
        if query:
            products = Product.objects.filter( Q(name__icontains = query)  | Q(description__icontains = query))
        else:
            products = Product.objects.all()
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            data = {}
            data['products'] = products
            data['categories'] = categories
            data['cust_data'] = cust_data
            return render(request,'search.html',data)
        else:
            data = {}
            data['products'] = products
            data['categories'] = categories
            return render(request,'search.html',data)
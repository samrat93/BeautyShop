from django.http import request
from store.models.customer import Customer
from store.models.product import Product
from store.models.category import Category
from store.views import contact
from django.shortcuts import redirect,render
from django.core.checks import messages
from django.contrib import messages
from. models import About_us, Contact, Image_slider, Vlogs
from.models import Product,Category
from django.contrib.auth.models import User,auth
from django.contrib.auth.decorators import login_required
from datetime import date
from django.core.paginator import Paginator
from store.models.orders import Order
from store.models.state import State
from store.models.city import City

import os

# Create your views here.
@login_required(login_url="/dashboard/admin_login")
def index(request):
    contact = Contact.objects.all()
    return render(request,'dashboard/index.html',{'contact':contact})

def admin_login(request):
    customer = Customer.objects.all()
    if request.method =='POST':
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username = username,password=password)
        if user is not None:
            auth.login(request,user)
            return redirect('index')
        else:
            messages.info(request,'Invalid Credentials !!!')
            return redirect('admin_login')
    else:
        return render(request,'dashboard/admin_login.html')

def admin_logout(request):
    auth.logout(request)
    return redirect('admin_login')

@login_required(login_url="/dashboard/admin_login")
def add_category(request):
    add_category = Category.objects.all()
    if request.method == 'POST':
        name = request.POST.get('name')
        image = request.FILES['image']
        description = request.POST.get('description')
        save_data = Category(name=name,image=image,description=description)
        save_data.save()
        messages.info(request,'Product Category Added Successfully')
        return redirect('add_category')
    return render(request,'dashboard/add_category.html',{'add_category':add_category})

@login_required(login_url="/dashboard/admin_login")
def edit_category(request,id):
    update_category = Category.objects.get(id=id)
    if request.method == 'POST':
        if len(request.FILES) != 0:
            if len(update_category.image) > 0:
                os.remove(update_category.image.path)
            update_category.image = request.FILES['image']
        update_category.name = request.POST.get('name')
        update_category.description = request.POST.get('description')
        update_category.save()
        messages.info(request,'Category Update Successfully')
        return redirect('add_category')
    else:
        return render(request,'dashboard/update/edit_category.html',{'update_category':update_category})

def delete_category(request,id):
    delete_category = Category.objects.get(id=id)
    if request.method == 'POST':
        delete_category.delete()
        messages.info(request,'Category Deleted Successfully')
        return redirect('add_category')
    return render(request,'dashboard/delete/delete_category.html')

@login_required(login_url="/dashboard/admin_login")
def add_product(request):  
    add_category= Category.objects.all()
    all_post = Product.objects.all().order_by('id')

    paginator = Paginator(all_post,10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    if request.method == 'POST':
        name = request.POST.get('name')
        category_id = request.POST.get('category')
        category = Category.objects.get(id=category_id)
        price = request.POST.get('price')
        image = request.FILES['image']
        description = request.POST.get('description')
        save_data = Product(name=name,category=category,price=price,image=image,description=description)
        save_data.save()
        messages.info(request,'Product Added Successfully')
        return redirect('add_product')
    
    return render(request,'dashboard/add_product.html',{'page_obj':page_obj,'add_category':add_category})

@login_required(login_url="/dashboard/admin_login")
def edit_product(request,id):
    update_product = Product.objects.get(id=id)
    category= Category.objects.all()
    if request.method == 'POST':
        if len(request.FILES) != 0:
            if len(update_product.image) > 0:
                os.remove(update_product.image.path)
            update_product.image = request.FILES['image']
        update_product.name = request.POST.get('name')
        category_id = request.POST.get('category')
        update_product.category = Category.objects.get(id=category_id)
        update_product.description = request.POST.get('description')
        update_product.price = request.POST.get('price')
        update_product.save()
        messages.info(request,'Product Update Successfully')
        return redirect('add_product')
    else:
        return render(request,'dashboard/update/edit_product.html',{'category':category,'update_product':update_product})

def delete_product(request,id):
    delete_product = Product.objects.get(id=id)
    if request.method == 'POST':
        delete_product.delete()
        messages.info(request,'Product Deleted Successfully')
        return redirect('add_product')
    return render(request,'dashboard/delete/delete_product.html')

@login_required(login_url="/dashboard/admin_login")
def image_slider(request):
    sliders = Image_slider.objects.all()
    if request.method == 'POST':
        title = request.POST.get('title')
        img = request.FILES['img']
        desc = request.POST.get('desc')
        save_data = Image_slider(title=title,img=img,desc=desc)
        save_data.save()
        messages.info(request,'Image Slider Created Successfully')
        return redirect('image_slider')
    return render(request,'dashboard/image_slider.html',{'sliders':sliders})

@login_required(login_url="/dashboard/admin_login")
def edit_slider(request,id):
    update_slider = Image_slider.objects.get(id=id)
    if request.method == 'POST':
        if len(request.FILES) != 0:
            if len(update_slider.img) > 0:
                os.remove(update_slider.img.path)
            update_slider.img = request.FILES['img']
        update_slider.title = request.POST.get('title')
        update_slider.desc = request.POST.get('desc')
        update_slider.save()
        messages.info(request,'Slider Update Successfully')
        return redirect('image_slider')
    else:
        return render(request,'dashboard/update/edit_slider.html',{'update_slider':update_slider})

def delete_slider(request,id):
    delete_slider = Image_slider.objects.get(id=id)
    if request.method == 'POST':
        delete_slider.delete()
        messages.info(request,'Slide Deleted Successfully')
        return redirect('image_slider')
    return render(request,'dashboard/delete/delete_slider.html')

@login_required(login_url="/dashboard/admin_login")
def add_about_us(request):
    add_about_us = About_us.objects.all()
    """if request.method == 'POST':
        title = request.POST.get('title')
        image = request.FILES['image']
        desc = request.POST.get('desc')
        c_date = date.today()
        save_data = About_us(title=title,image=image,desc=desc,date=c_date)
        save_data.save()
        messages.info(request,'About Us Added Successfully')
        return redirect('add_about_us') """
    return render(request,'dashboard/add_about_us.html',{'add_about_us':add_about_us})


@login_required(login_url="/dashboard/admin_login")
def edit_about_us(request,id):
    update_about_us = About_us.objects.get(id=id)
    if request.method == 'POST':
        if len(request.FILES) != 0:
            if len(update_about_us.image) > 0:
                os.remove(update_about_us.image.path)
            update_about_us.image = request.FILES['image']
        update_about_us.title = request.POST.get('title')
        update_about_us.desc = request.POST.get('desc')
        update_about_us.date = date.today()
        update_about_us.save()
        messages.info(request,'About_Us Update Successfully')
        return redirect('add_about_us')
    else:
        return render(request,'dashboard/update/edit_about_us.html',{'update_about_us':update_about_us})

@login_required(login_url="/dashboard/admin_login")
def vlogs(request):
    vlogs = Vlogs.objects.all()
    if request.method == 'POST':
        title = request.POST.get('title')
        c_date = date.today()
        urls = request.POST.get('urls')
        save_data = Vlogs(title=title,date=c_date,urls=urls)
        save_data.save()
        messages.info(request,'Vlogs Added Successfully')
        return redirect('vlogs')
    return render(request,'dashboard/vlogs.html',{'vlogs':vlogs})

@login_required(login_url="/dashboard/admin_login")
def edit_vlogs(request,id):
    update_vlogs = Vlogs.objects.get(id=id)
    if request.method == 'POST':
        update_vlogs.title = request.POST.get('title')
        update_vlogs.urls = request.POST.get('urls')
        update_vlogs.date = date.today()
        update_vlogs.save()
        messages.info(request,'Vlogs Update Successfully')
        return redirect('vlogs')
    else:
        return render(request,'dashboard/update/edit_vlogs.html',{'update_vlogs':update_vlogs})

def delete_vlogs(request,id):
    delete_vlogs = Vlogs.objects.get(id=id)
    if request.method == 'POST':
        delete_vlogs.delete()
        messages.info(request,'Vlog Deleted Successfully')
        return redirect('vlogs')
    return render(request,'dashboard/delete/delete_vlogs.html')

def cust_orders(request):
    all_order = Order.objects.all().order_by('-id')
    paginator = Paginator(all_order,10)
    page_number = request.GET.get('page')
    cust_order = paginator.get_page(page_number)
    return render(request,'dashboard/cust_orders.html',{'cust_order':cust_order})

def update_orders(request,id):
    update_orders = Order.objects.get(id=id)
    if request.method == 'POST':
        update_orders.status = request.POST.get('status','')=='on'
        update_orders.save()
        return redirect('cust_orders')
    else:
        return render(request,'dashboard/update/update_orders.html',{'update_orders':update_orders})


def cust_list(request):
    all_post = Customer.objects.all().order_by('id')

    paginator = Paginator(all_post,10)
    page_number = request.GET.get('page')
    list_cust = paginator.get_page(page_number)
    return render(request,'dashboard/cust_list.html',{'list_cust':list_cust})

@login_required(login_url="/dashboard/admin_login")
def state_city(request):
    state_details = State.objects.all()
    #city_details = City.objects.all()
    if request.method == 'POST':
        state_name = request.POST.get('state_name')
        #city_name = request.POST.get('city_name')
        save_data = State(state_name=state_name)
        #save_data = City(city_name=city_name)
        save_data.save()
        messages.info(request,'State Added Successfully')
        return redirect('state_city')
    return render(request,'dashboard/state_city.html',{'state_details':state_details})
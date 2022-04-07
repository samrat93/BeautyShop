from store.views.update_user_details import Update_user_details
from store.views.shipping_return import Shipping_Return
from store.views.product_details import Product_details
from store.views import category_list_details, contact
from store.views.search import Search
from store import views
from store.models.contact import Contact
from django.contrib import admin
from django.urls import path
from .views.home import Index , store
from .views.signup import Signup
from .views.login import Login , logout
from .views.cart import Cart
from .views.orders import OrderView
from .middlewares.auth import  auth_middleware
from .views.contact import Contact, Contact_Us
from .views.user_details import *
from .views.change_profile_photo import *
from .views.forget_password import *
from .views.change_password import *
from .views.products import *
from .views.search import *
from .views.about_us import *
from .views.our_vlogs import *
from .views.term_and_condition import *
from .views.category_list_details import *
from .views.product_details import *
from .views.view_bill import *
from .views.check_out import *
from .views.download_bill import *
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', Index.as_view(), name='homepage'),
    path('store', store , name='store'),
    #path('dashboard/',views.dashboard,name='dashboard'),
    path('signup', Signup.as_view(), name='signup'),
    path('login', Login.as_view(), name='login'),
    path('logout', logout , name='logout'),
    path('cart', auth_middleware(Cart.as_view()) , name='cart'),
    path('orders', auth_middleware(OrderView.as_view()), name='orders'),
    path('contact',Contact_Us.as_view(),name='contact'),
    path('user_details',User_Details.as_view(),name='user_details'),
    path('products',products.as_view(),name='products'),
    path('about_us',About_Us.as_view(),name='about_us'),
    path('product_details/<int:id>',Product_details.as_view(),name='product_details'),
    path('term_and_condition',Term_Condition.as_view(),name='term_and_condition'),
    path('shipping_and_return_policy',Shipping_Return.as_view(),name='shipping_and_return_policy'),
    path('category_list_view/<int:id>',category_list_details.as_view(),name='category_list_view'),
    path('search',Search.as_view(),name='search'),
    path('our_vlogs',Our_vlogs.as_view(),name = 'our_vlogs'),
    path('view_bill/<int:id>',View_bill.as_view(),name = 'view_bill'),
    path('checkout',Check_out.as_view(),name = 'checkout'),
    path('download_bill/<int:id>',Download_bill.as_view(),name='download_bill'),

    path('update_user_details',Update_user_details.as_view(),name='update_user_details'),
    path('change_profile_photo',Change_profile_photo.as_view(),name='change_profile_photo'),
    path('forget_password',Forget_password.as_view(),name='forget_password'),
    path('change_password',Change_password.as_view(),name='change_password'),
    
]

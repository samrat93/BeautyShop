from django.urls import path
from. import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('index',views.index,name='index'),
    path('admin_login',views.admin_login, name='admin_login'),
    path('add_category',views.add_category,name='add_category'),
    path('add_product',views.add_product,name='add_product'),
    path('edit_category/<int:id>',views.edit_category,name='edit_category'),
    path('edit_product/<int:id>',views.edit_product,name='edit_product'),
    path('delete_category/<int:id>',views.delete_category,name='delete_category'),
    path('delete_product/<int:id>',views.delete_product,name='delete_product'),
    path('admin_logout',views.admin_logout,name='admin_logout'),
    path('image_slider',views.image_slider,name='image_slider'),
    path('edit_slider/<int:id>',views.edit_slider,name='edit_slider'),
    path('delete_slider/<int:id>',views.delete_slider,name='delete_slider'),
    path('vlogs',views.vlogs,name='vlogs'),
    path('edit_vlogs/<int:id>',views.edit_vlogs,name='edit_vlogs'),
    path('delete_vlogs/<int:id>',views.delete_vlogs,name='delete_vlogs'),
    path('add_about_us',views.add_about_us,name='add_about_us'),
    path('edit_about_us/<int:id>',views.edit_about_us,name='edit_about_us'),
    #path('delete_about_us/<int:id>',views.delete_about_us,name='delete_about_us'),
    path('cust_orders',views.cust_orders,name='cust_orders'),
    path('update_orders/<int:id>',views.update_orders,name='update_orders'),
    path('cust_list',views.cust_list,name='cust_list'),
    path('state_city',views.state_city,name='state_city'),

    path('reset_password/',
     auth_views.PasswordResetView.as_view(template_name="register/password_reset.html"),
     name="reset_password"),

    path('reset_password_sent/', 
        auth_views.PasswordResetDoneView.as_view(template_name="register/password_reset_sent.html"), 
        name="password_reset_done"),

    path('reset/<uidb64>/<token>/',
     auth_views.PasswordResetConfirmView.as_view(template_name="register/password_reset_form.html"), 
     name="password_reset_confirm"),

    path('reset_password_complete/', 
        auth_views.PasswordResetCompleteView.as_view(template_name="register/password_reset_done.html"), 
        name="password_reset_complete"),

]

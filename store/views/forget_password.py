from django.shortcuts import render , redirect , HttpResponseRedirect
from django.contrib.auth.hashers import  check_password
from store.models.customer import Customer
from django.views import  View

from django.shortcuts import render , redirect , HttpResponseRedirect
from django.contrib.auth.hashers import  check_password
from store.models.customer import Customer
from django.views import  View


class Forget_password(View):
    def get(self , request):
        return render(request , 'forget_password.html')

    def post(self,request): 
        email = request.POST.get('email')
        customer = Customer.get_customer_by_email(email)
        error_message = None
        if customer:
            if email == customer.email:
                request.session['customer'] = customer.id
                return redirect('change_password')
            else:
                error_message = 'Email Not Found !!!'
        else:
            error_message = 'Email Not Found !!!'
        return render(request,'forget_password.html',{'error':error_message})

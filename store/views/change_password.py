from django.core.checks import messages
from django.shortcuts import render , redirect , HttpResponseRedirect
from django.contrib.auth.hashers import make_password
from store.models.customer import Customer
from django.views import  View
from django.contrib import messages
from django.shortcuts import render , redirect , HttpResponseRedirect
from store.models.customer import Customer
from django.views import  View


class Change_password(View):
    def get(self , request):
        get_session_id = request.session['customer']
        data = Customer.objects.get(id = get_session_id)
        return render(request , 'change_password.html',{'data':data})

    def post(self,request):
        get_session_id = request.session['customer']
        cust_details = Customer.objects.get(id = get_session_id)
        postData = request.POST
        password = postData.get('password')
        password2 = request.POST['cpassword']
        error_message = None

        customer = Customer(password = password)
        error_message = self.validateCustomer(customer)
        if not error_message:
            cust_details.password = password
            cust_details.password = make_password(cust_details.password)
            if password == password2:
                cust_details.save()
                return redirect('login')
            else:
                messages.info(request,'Password not matching...')
                return redirect('change_password')
        else:
            return render(request,'change_password.html',{'error':error_message})
        

    def validateCustomer(self, customer):
        error_message = None;
        
        if len(customer.password) < 6:
            error_message = 'Password must be 6 char long'
        # saving

        return error_message

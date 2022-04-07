from store.models.state import State
from django.db.models.manager import EmptyManager
from django.shortcuts import render,HttpResponse , redirect , HttpResponseRedirect
from django.views import View
from django.contrib.auth import authenticate, login as login_auth,logout as auth_logout,update_session_auth_hash
from django.core.checks import messages
from django.contrib import messages
from django.contrib.auth.models import User,auth
from django.contrib.auth.decorators import login_required
from store.models.customer import Customer
from store.models.state import State
import os

class Update_user_details(View):
    def get(self, request):
        if request.session.has_key('customer'):
            state = State.objects.all()
            get_session_id = request.session['customer']
            data = Customer.objects.get(id = get_session_id)
            return render(request, 'update_user_details.html',{'state':state,'data':data})
        else:
            return redirect('login')

    def post(self, request):
        get_session_id = request.session['customer']
        if request.POST:
            cust_details = Customer.objects.get(id = get_session_id)
            if len(request.FILES) != 0:
                address = request.POST.get('address')
                gender = request.POST.get('gender')
                state = request.POST.get('state')
                city = request.POST.get('city')
                pincode = request.POST.get('pincode')
                image = request.FILES.get('image')
                cust_details.address = address
                cust_details.gender = gender
                cust_details.state = state
                cust_details.city = city
                cust_details.pincode = pincode
                cust_details.image = image
                cust_details.save()
                return redirect('user_details')
            else:
                address = request.POST.get('address')
                gender = request.POST.get('gender')
                state = request.POST.get('state')
                city = request.POST.get('city')
                pincode = request.POST.get('pincode')
                cust_details.address = address
                cust_details.gender = gender
                cust_details.state = state
                cust_details.city = city
                cust_details.pincode = pincode
                cust_details.save()
                #messages.info(request,'Profile Update Successfully')
                return redirect('user_details')
        else:
            return render(request,'error')
        
        
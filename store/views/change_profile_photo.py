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

class Change_profile_photo(View):
    def get(self, request):
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            data = Customer.objects.get(id = get_session_id)
            return render(request, 'change_profile_photo.html',{'data':data})
        else:
            return redirect('login')

    def post(self, request):
        get_session_id = request.session['customer']
        if request.POST:
            cust_details = Customer.objects.get(id = get_session_id)
            if len(request.FILES) != 0:
                if len(cust_details.image) > 0:
                    os.remove(cust_details.image.path)
                cust_details.image = request.FILES.get('image')
                
            cust_details.save()
            #messages.info(request,'Profile Update Successfully')
            return redirect('user_details')
        else:
            return render(request,'error')
        
        
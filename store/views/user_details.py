from store.models.category import Category
from django.db.models.manager import EmptyManager
from django.shortcuts import render , redirect , HttpResponseRedirect
from django.views import View
from django.contrib.auth import authenticate, login as login_auth,logout as auth_logout,update_session_auth_hash
from django.core.checks import messages
from django.contrib import messages
from django.contrib.auth.models import User,auth
from django.contrib.auth.decorators import login_required
from store.models.customer import Customer
from store.models.state import State

class User_Details(View):
    def get(self,request):
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            data = Customer.objects.get(id = get_session_id)
            state = State.objects.filter(state_name= data.state)
            return render(request,'user_details.html',{'data':data,'state':state})
        else:
            return redirect('login')
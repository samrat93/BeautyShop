from dashboard.views import vlogs
from django.shortcuts import render
from django.views import View
from dashboard.models import About_us
from dashboard.models import Vlogs
from store.models import Customer

class About_Us(View):
    def get(self,request):
        vlogs = Vlogs.objects.all()
        about_us = About_us.objects.all()
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            data = {}
            data['about_us'] = about_us
            data['vlogs'] = vlogs
            data['cust_data'] = cust_data
            return render(request,'about_us.html',data)
        else:
            data = {}
            data['about_us'] = about_us
            data['vlogs'] = vlogs
            return render(request,'about_us.html',data)
from django.shortcuts import render
from django.views import View
from dashboard.models import Vlogs,About_us
from store.models import Customer

class Our_vlogs(View):
    def get(self,request):
        our_vlogs = Vlogs.objects.all()
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            data = {}
            data['our_vlogs'] = our_vlogs
            data['cust_data'] = cust_data
            return render(request,'our_vlogs.html',data)
        else:
            data = {}
            data['our_vlogs'] = our_vlogs
            return render(request,'our_vlogs.html',data)
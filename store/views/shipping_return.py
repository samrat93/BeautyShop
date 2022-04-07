from django.shortcuts import render
from django.views import View
from store.models import Customer


class Shipping_Return(View):
    def get(self,request):
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request,'shipping_and_return_policy.html',{'cust_data':cust_data})
        else:
            return render(request,'shipping_and_return_policy.html')


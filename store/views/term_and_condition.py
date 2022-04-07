from django.shortcuts import render , redirect , HttpResponseRedirect
from django.views import View
from store.models import Customer


class Term_Condition(View):
    def get(self,request):
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request,'term_and_condition.html',{'cust_data':cust_data})
        else:
            return render(request,'term_and_condition.html')


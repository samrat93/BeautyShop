from django.shortcuts import render , redirect , HttpResponseRedirect
from django.views import View
from django.core.checks import messages
from django.contrib import messages
from store.models.contact import Contact
from store.models import Customer

class Contact_Us(View):
    def get(self,request):
        if request.session.has_key('customer'):
            get_session_id = request.session['customer']
            cust_data = Customer.objects.get(id = get_session_id)
            return render(request,'contact.html',{'cust_data':cust_data})
        else:
            return render(request,'contact.html')

    def post(self,request):
        if request.method == 'POST':
            name = request.POST.get('name')
            subject = request.POST.get('subject')
            email = request.POST.get('email')
            phone = request.POST.get('phone')
            message = request.POST.get('message')
            contact = Contact(name = name,subject=subject,email=email,phone=phone,message=message)
            contact.save()
            messages.success(request,'Message Send Successfully')
        return render(request,'contact.html')
from django.shortcuts import render, redirect
from store.models.customer import Customer
from django.views import View
from store.models.product import Product
from store.models.orders import Order
from django.http import HttpResponse, response
from django.template.loader import get_template
from xhtml2pdf import pisa
import uuid

class Download_bill(View):
    def get(self,request,id):
        order = Order.objects.get(id =id)

        template_path = 'download_bill.html'
        context = {'order':order}
        response = HttpResponse(content_type='application/pdf')
        rand = uuid.uuid4()
        filename = "Invoice_%s.pdf" %(rand)
        content = "attachment; filename='%s'"%(filename)
        response['Content-Disposition'] = content
        
        template = get_template(template_path)
        
        html = template.render(context)
        
        pisa_status = pisa.CreatePDF(html, dest=response)
        if pisa_status.err:
            return HttpResponse('We had some error <pre>'+ html + '</pre>')
        return response
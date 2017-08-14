# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response

def docs(request):
    return render_to_response('README.md', locals(), request)
from django.shortcuts import render, redirect
from .models import *

# Create your views here.
def main(request):
    return render(request, 'main.html')
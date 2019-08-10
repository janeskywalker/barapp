from django.shortcuts import render, redirect

# IMPORT DJANGO AUTH
from django.contrib import auth

# IMPORT DJANGO USER MODEL
from django.contrib.auth.models import User


# Create your views here.


def login(request):
        # if post
    if request.method == 'POST':
            # get form into
        username = request.POST['username']
        password = request.POST['password']
        # authenticate user
        user = auth.authenticate(username=username, password=password)
        #  make sure a user exists
        if user is not None:
            # create a sesstion and log in
            auth.login(request, user)
            # redirect
            return redirect('main', {'currentUser': user})
        # else return not found
        else:
            return render(request, 'login.html', {'error': 'Invalid Credentials...'})
        # else sent form

    # handle the get request
    else:
        return render(request, 'login.html')


def logout(request):
    # destroy the session, easy logout
    auth.logout(request)
    return redirect('main')

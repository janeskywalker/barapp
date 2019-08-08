from django.shortcuts import render, redirect

# IMPORT DJANGO AUTH
from django.contrib import auth

# IMPORT DJANGO USER MODEL
from django.contrib.auth.models import User


# Create your views here.

# let user register as a new user
def register(request):
    if request.method == 'POST':
        # Get form values
        # this is a customized form, so we dont do form.is valid
        # first_name = request.POST['first_name']
        # last_name = request.POST['last_name']
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        password2 = request.POST['password2']

        # Check if passwords match
        if password == password2:
            # Check if username exists, no duplicate users
            if User.objects.filter(username=username).exists():
                # username is taken
                return render(request, 'accounts/register.html', {'error': 'That username has already been registered. Please try a different username'})
            else:
                # Check if email exists
                if User.objects.filter(email=email).exists():
                    #email is taken
                    return render(request, 'accounts/register.html', {'error': 'That email has already been registered'})
                else:
                    # is everthing is ok, create a user, Register User, fill in the fields, save it to the db - User model
                    user = User.objects.create_user(
                        username=username, password=password, email=email, first_name=first_name, last_name=last_name)
                    # commit to the db
                    user.save()
                    return redirect('login')

        # pw do not match
        else:
            # look into the same template folder
            return render(request, 'register.html', {'error': 'Passwords do not match'})

    # if it is a get request, send back the form
    else:
        return render(request, 'register.html')


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
            return redirect('main')
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

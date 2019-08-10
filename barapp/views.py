from django.shortcuts import render, redirect
from .models import *

# Create your views here.
def main(request):
    beers = Ingredient.objects.filter(category='beer')
    wines = Ingredient.objects.filter(category='wine')
    whiskeys = Ingredient.objects.filter(category='whiskey')
    gins = Ingredient.objects.filter(category='gin')
    vodkas = Ingredient.objects.filter(category='vodka')
    rums = Ingredient.objects.filter(category='rum')
    tequilas = Ingredient.objects.filter(category='tequila')
    liquors = Ingredient.objects.filter(category='liquor')
    mixers = Ingredient.objects.filter(category='mixer')
    categories = [
        {'type': 'Beer', 'data': beers},
        {'type': 'Wine', 'data': wines},
        {'type': 'Whiskey', 'data': whiskeys},
        {'type': 'Gin', 'data': gins},
        {'type': 'Vodka', 'data': vodkas},
        {'type': 'Rum', 'data': rums},
        {'type': 'Tequila', 'data': tequilas},
        {'type': 'Liquor', 'data': liquors},
        {'type': 'Mixers/Other', 'data': mixers},
    ]

    # print(pretty_request(request))

    return render(request, 'main.html', {'categories': categories})

def pretty_request(request):
    headers = ''
    for header, value in request.META.items():
        if not header.startswith('HTTP'):
            continue
        header = '-'.join([h.capitalize() for h in header[5:].lower().split('_')])
        headers += '{}: {}\n'.format(header, value)

    return (
        '{method} HTTP/1.1\n'
        'Content-Length: {content_length}\n'
        'Content-Type: {content_type}\n'
        '{headers}\n\n'
        '{body}'
    ).format(
        method=request.method,
        content_length=request.META['CONTENT_LENGTH'],
        content_type=request.META['CONTENT_TYPE'],
        headers=headers,
        body=request.body,
    )

def build_drink(request):
    return render(request, 'build_drink.html', {'categoryClicked': categoryClicked})



def saveTab(request):
    print(request)
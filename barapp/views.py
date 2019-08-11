from django.shortcuts import render, redirect
from .models import *

# Create your views here.
def main(request):
    categories = Category.objects.all()
    print(categories)
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


def category(request, category_pk):
    drinks = Drink.objects.filter(category_id=category_pk)
    print("drinks:", drinks)
    ingredients = Ingredient.objects.filter(category_id=category_pk)
    print("ingredients:", ingredients)

    return render(request, 'category.html', {'drinks': drinks, 'ingredients': ingredients})


from django.shortcuts import render, redirect
from .models import *
from functools import reduce
import datetime
from django.http import JsonResponse

def priceForIngredients(ingredients):
    price = 0
    for ing in ingredients:
        price = price + ing['price']
    return price

def findDrinkPrice(drink):
    return {
        'name': drink.name,
        'price': priceForIngredients(list(drink.ingredients.values()))
    }

# Create your views here.
def main(request):
    categories = Category.objects.all()
    print(categories)
    current_tab = 0
    if 'current_tab' in request.session:
        current_tab = request.session['current_tab']
        tab = Tab.objects.get(id=current_tab)
        drinks = list(map(findDrinkPrice, list(tab.drinks.all())))
        return render(request, 'main.html', { 'categories': categories, 'tab': {
            'name': tab.name,
            'drinks': drinks,
            'ingredients': tab.ingredients
        }})
    else:
        tabs = Tab.objects.all()
        return render(request, 'main.html', { 'categories': categories, 'tabs': tabs})

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


def category(request, category_pk):
    drinks = Drink.objects.filter(category_id=category_pk)
    print("drinks:", drinks)
    ingredients = Ingredient.objects.filter(category_id=category_pk)
    print("ingredients:", ingredients)

    # return render(request, 'category.html', {'drinks': drinks, 'ingredients': ingredients})

    current_tab = 0
    if 'current_tab' in request.session:
        current_tab = request.session['current_tab']
        print(current_tab)
        tab = Tab.objects.get(id=current_tab)
        drinks = list(map(findDrinkPrice, list(tab.drinks.all())))
        return render(request, 'category.html', { 'drinks': drinks, 'ingredients': ingredients, 'tab': {
            'name': tab.name,
            'drinks': drinks,
            'ingredients': tab.ingredients
        }})
    else:
        tabs = Tab.objects.all()
        return render(request, 'category.html', { 'tabs': tabs, 'drinks': drinks, 'ingredients': ingredients})


def newOrder(request):
    if request.method == 'POST':
        customername = request.POST['customername']
        tab = Tab(name = customername, open_date_time = datetime.datetime.now())
        tab.save()
        print(tab.id)

        request.session['current_tab'] = tab.id

        return redirect('main')
        
def saveOrder(request, tab_pk):
    if 'current_tab' in request.session:
        del request.session['current_tab']
    return redirect('main')


def startOrder(request, tab_pk):
        print(tab_pk)
        request.session['current_tab'] = tab_pk
        # return JsonResponse({'status': 'success'})
        return redirect('main')


def closeTab(request, tab_pk):
        print(tab_pk)
        tab = Tab.objects.get(id=tab_pk)
        tab.close_date_time = datetime.datetime.now()
        tab.save()
        if 'current_tab' in request.session:
            del request.session['current_tab']
        return redirect('main')

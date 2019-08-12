from django.shortcuts import render, redirect
from .models import *
from functools import reduce
import datetime
import json
import requests
from django.http import JsonResponse

# nothing important, keep scrolling
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


# main page, grab all 9 categories from db and display, 
# if there is current tab, set session, list that customer's drink. 
# If no current tab, grab all tabs(customers) and display
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


# category page showing customer name, in session, close and save btn, grab draink and ingredients from that category and display
# if there is current tab, set session, list that customer's drink. 
# If no current tab, grab all tabs(customers) and display
def category(request, category_pk):
    drinks = Drink.objects.filter(category_id=category_pk)
    print("drinks:", drinks)
    ingredients = Ingredient.objects.filter(category_id=category_pk)
    print("ingredients:", ingredients)


    current_tab = 0
    if 'current_tab' in request.session:
        current_tab = request.session['current_tab']
        print(current_tab)
        tab = Tab.objects.get(id=current_tab)
        tabDrinks = list(map(findDrinkPrice, list(tab.drinks.all())))
        return render(request, 'category.html', { 'drinks': drinks, 'ingredients': ingredients, 'tab': {
            'name': tab.name,
            'drinks': tabDrinks,
            'ingredients': tab.ingredients
        }})
    else:
        tabs = Tab.objects.all()
        return render(request, 'category.html', { 'tabs': tabs, 'drinks': drinks, 'ingredients': ingredients})


# after user press sumbit new order btn, we save the customer name to db, set session to this current customer
def newOrder(request):
    if request.method == 'POST':
        customername = request.POST['customername']
        tab = Tab(name = customername, open_date_time = datetime.datetime.now())
        tab.save()
        print(tab.id)

        request.session['current_tab'] = tab.id

        return redirect('main')
        
# kill current session
def saveOrder(request, tab_pk):
    if 'current_tab' in request.session:
        del request.session['current_tab']
    return redirect('main')

# just an endpoint 
def startOrder(request, tab_pk):
        print(tab_pk)
        request.session['current_tab'] = tab_pk
        # return JsonResponse({'status': 'success'})
        return redirect('main')

# insert close time to current tab, close current session
def closeTab(request, tab_pk):
        print(tab_pk)
        tab = Tab.objects.get(id=tab_pk)
        tab.close_date_time = datetime.datetime.now()
        tab.save()
        if 'current_tab' in request.session:
            del request.session['current_tab']
        return redirect('main')

# add drink to db for current session
def addDrinkToOrder(request):
    if 'current_tab' in request.session:
        if request.method == 'POST':
            current_tab = request.session['current_tab']
            tab = Tab.objects.get(id=current_tab)
            json_obj = json.loads(request.body)
            drink_id = json_obj['drink_id']
            tab.drinks.add(Drink.objects.get(id=drink_id))
            return JsonResponse({ 'status': 'success' })
    return JsonResponse({ 'status': 'error' })

# add ingredient to db for current session
def addIngredientToOrder(request):
    if 'current_tab' in request.session:
        if request.method == 'POST':
            current_tab = request.session['current_tab']
            tab = Tab.objects.get(id=current_tab)
            json_obj = json.loads(request.body)
            ingredient_id = json_obj['ingredient_id']
            tab.ingredients.add(Ingredient.objects.get(id=ingredient_id))
            return JsonResponse({ 'status': 'success' })
    return JsonResponse({ 'status': 'error' })

def search(request):
    search_result = {}
    if request.POST:
        if (request.POST['select-search'][0]):
            drink = request.POST['search-term']
            url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=%s' % drink
            print(url)
            response = requests.get(url)
            search_was_successful = (response.status_code == 200)  
            search_result = response.json()
            search_result['success'] = search_was_successful
            return render(request, 'search_return.html', {'search_result': search_result})
        elif (request.GET['select-search'][1]):
            ingredient = request.POST['search-term']
            url = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=%s' % ingredient
            print(url)
            response = requests.get(url)
            search_was_successful = (response.status_code == 200) 
            search_result = response.json()
            search_result['success'] = search_was_successful
            return render(request, 'search_return.html', {'search_result': search_result})
    else: 
        return render(request, 'search_return.html', {'search_result': search_result})
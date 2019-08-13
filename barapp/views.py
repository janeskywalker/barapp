from django.shortcuts import render, redirect
from .models import *
from functools import reduce
import datetime
import json
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

# adds up the ingredient price
def priceForIngredients(ingredients):
    price = 0
    for ing in ingredients:
        price = price + ing['price']
    return price

# given a drink, return a dicctioney of drink name and price
# in our drink model, drink dont have a price, it is the ingredients's price
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
            'id': tab.id,
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


# add drink to db for current session
def addDrinkToOrder(request):
    if 'current_tab' in request.session:
        if request.method == 'POST':
            # grab current_tab from session
            current_tab = request.session['current_tab']
            # with id go grab the current tab
            tab = Tab.objects.get(id=current_tab)
            # grab requst body, which is a json object
            json_obj = json.loads(request.body)
            # extract the drink_id
            drink_id = json_obj['drink_id']
            # add the new drink to tab
            tab.drinks.add(Drink.objects.get(id=drink_id))

            newDrink = findDrinkPrice(Drink.objects.get(id=drink_id))
            print(newDrink)
 
            return JsonResponse(newDrink)

    return JsonResponse({ 'status': 'error'})


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

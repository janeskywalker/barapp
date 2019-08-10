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
    

    return render(request, 'main.html', {'categories': categories})

def build_drink(request):
    return render(request, 'build_drink.html', {'categoryClicked': categoryClicked})



def saveTab(request):
    print(request)
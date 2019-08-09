from django.shortcuts import render, redirect
from .models import *

# Create your views here.
def main(request):
    categories = {
        'Beer': 'Beer',
        'Wine': 'Wine',
        'Whiskey': 'Whiskey',
        'Gin': 'Gin',
        'Vodka': 'Vodka',
        'Rum': 'Rum',
        'Tequila': 'Tequila',
        'Liquor': 'Liquor',
        'Other/Mixers': 'Other/Mixers'
        }
        
    return render(request, 'main.html', {'categories': categories})

def build_drink(request):
    return render(request, 'build_drink.html', {'categoryClicked': categoryClicked})
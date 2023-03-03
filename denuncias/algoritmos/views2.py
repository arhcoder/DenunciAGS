import base64
from django.http import JsonResponse,request
from django.shortcuts import render
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from datetime import datetime
import os
import csv
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.feature_extraction.text import CountVectorizer
import os
from django.views.decorators.csrf import csrf_exempt
from .dataSet import data2
from nltk.stem import SnowballStemmer


import nltk
from nltk.chat.util import Chat, reflections
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from django.shortcuts import render
from django.http import HttpResponse
from nltk.chat.util import Chat, reflections
from django.views.decorators.csrf import csrf_exempt

nltk.download('punkt')
nltk.download('stopwords')

@csrf_exempt
def chatbot_view(request):
    if request.method == 'POST':
        my_var = request.POST.get("message", None)
        if my_var:
            print(my_var)
            pairs = [
            ['Hola|Hola!|Hola ¿qué tal?|hola|que tal', ['Hola, ¿cómo estás?', 'Hola!']],
            ['¿Cómo estás?|¿Cómo te sientes?|saludos', ['Estoy bien, gracias. ¿Y tú?', 'Me siento muy bien, gracias']],
            ['¿Cuál es tu nombre?|¿Cómo te llamas?|dime tu nombre|quien eres', ['Me llamo Aguascalientes Security Bot, ¿y tú?', 'Mi nombre es Aguascalientes Security Bot']],
            ['Adiós|Hasta luego|Chao|Hasta pronto|adios|chao', ['Adiós, ¡que tengas un buen día!', 'Hasta luego']],
            ['ayuda|apoyo|necesidad|emergencia', ['Estamos para ayudarte', 'Reporta tus denuncias al 911','La policia cibernetica te protege en linea']],
            ['contacto|información|directorio', ['Contactanos al 911','Visita nuestra redes sociales para mas informacion', 'Visita nuestra pagina web para ver el direcotorio ']],
            ['denuncia|delito|reportes', ['Denuncia en nuestra aplicacion online','En caso de emergencia contactate al 911', 'En la linea del 911 te ayudamos']],
            ]
            chatbot = Chat(pairs, reflections)
            response = chatbot.respond(str(my_var))
            if response is None:
                return JsonResponse({'error':'Lo siento, no puedo responder eso. '},safe=False)
            return JsonResponse(response,safe=False)
        else:
            return JsonResponse({'error': 'invalid input.'},safe=False)
    else:
        return JsonResponse({'error': 'Invalid request method.'},safe=False)





# Función para buscar palabras clave en los artículos de la ley
def buscar_palabras_clave(texto, palabras_clave):
    # Tokenizar el texto
    tokens = word_tokenize(texto.lower())
    # Obtener las palabras clave que no son stopwords y aplicar lematización
    stop_words = set(stopwords.words('spanish'))
    stemmer = SnowballStemmer('spanish')
    palabras_clave_sin_stopwords = [stemmer.stem(p) for p in palabras_clave if not p in stop_words]
    # Encontrar las palabras clave en el texto y aplicar lematización
    tokens_sin_stopwords = [stemmer.stem(t) for t in tokens if not t in stop_words]
    palabras_clave_encontradas = [p for p in palabras_clave_sin_stopwords if p in tokens_sin_stopwords]
    return palabras_clave_encontradas

# Función para obtener recomendaciones de artículos de ley
def obtener_recomendaciones(denuncia):
    # Tokenizar la denuncia
    tokens = word_tokenize(denuncia.lower())
    # Obtener las palabras clave de la denuncia y aplicar lematización
    stemmer = SnowballStemmer('spanish')
    palabras_clave = [stemmer.stem(t) for t in tokens if t.isalpha()]
    # Buscar las palabras clave en los artículos de la ley
    recomendaciones = {}
    for articulo, texto in data2.items():
        palabras_clave_encontradas = buscar_palabras_clave(texto, palabras_clave)
        if palabras_clave_encontradas:
            recomendaciones[articulo] = palabras_clave_encontradas
    return recomendaciones


@csrf_exempt
# Ejemplo de uso del sistema de recomendaciones de leyes
def recomendaciones_ley2(request):
    if request.method == 'POST':
        my_var = request.POST.get('denuncia', None)
        if my_var:
            print(my_var)
            recomendaciones = obtener_recomendaciones(str(my_var))
            return JsonResponse(recomendaciones)
        else:
            return JsonResponse({'error': 'invalid input.'})
    else:
        return JsonResponse({'error': 'Invalid request method.'})
    
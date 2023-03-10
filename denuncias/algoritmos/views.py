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
from .dataSet import data

import nltk
from nltk.chat.util import Chat, reflections
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
# from django.response import Http

# from INE import 


# Cargar los datos
dataChat = pd.read_csv('entrenamiento.csv')

# Crear un vectorizador para convertir las descripciones en vectores numéricos
vectorizer = CountVectorizer(stop_words='english')

# Crear el modelo de clasificación
clf = DecisionTreeClassifier()

# Entrenar el modelo
X = vectorizer.fit_transform(dataChat['descripcion'])
y = dataChat['clasificacion']
clf.fit(X, y)


# Función para buscar palabras clave en los artículos de la ley
def buscar_palabras_clave(texto, palabras_clave):
    # Tokenizar el texto
    tokens = word_tokenize(texto.lower())
    # Obtener las palabras clave que no son stopwords
    stop_words = set(stopwords.words('spanish'))
    palabras_clave_sin_stopwords = [p for p in palabras_clave if not p in stop_words]
    # Encontrar las palabras clave en el texto
    palabras_clave_encontradas = [p for p in palabras_clave_sin_stopwords if p in tokens]
    return palabras_clave_encontradas

# Función para obtener recomendaciones de artículos de ley
def obtener_recomendaciones(denuncia):
    # Tokenizar la denuncia
    tokens = word_tokenize(denuncia.lower())
    # Obtener las palabras clave de la denuncia
    palabras_clave = [t for t in tokens if t.isalpha()]
    # Buscar las palabras clave en los artículos de la ley
    recomendaciones = {}
    for articulo, texto in data.items():
        palabras_clave_encontradas = buscar_palabras_clave(texto, palabras_clave)
        if palabras_clave_encontradas:
            recomendaciones[articulo] = palabras_clave_encontradas
    return recomendaciones


# RECIEVES THE INE IMAGE FROM THE FRONTEND:
@csrf_exempt
def process_image(request):
    if request.method == "POST":

        import base64
        import json
        from django.http import JsonResponse

        # Obtener el cuerpo de la petición HTTP:
        request_body = request.body.decode("utf-8")
        cuerpo = json.loads(request_body)
        imagenF = cuerpo.get('imagenF', None)
        
        # imgaenF tiene contiene el string de codificación de la imágen:
        if imagenF:
            # Decodificar las imágenes:
            imagen_decodificada_f = base64.b64decode(imagenF)

            # Guardar las imágenes decodificadas localmente:
            with open("ine.jpg", "wb") as f:
                f.write(imagen_decodificada_f)
            
            # Ya teniendo el archivo de imágen guardado, ejecuta los algoritmos
            # para obtener los datos personales:
            from .INE.ine import getDataFromINE
            personalData = getDataFromINE("ine.jpg")

            # Devolver una respuesta HTTP 200 OK:
        return JsonResponse(personalData)
    else:
            # Devolver una respuesta HTTP 400 Bad Request
        return JsonResponse({"mensaje": "Error al obtener datos :c"}, status=400)
    
@csrf_exempt
# Ejemplo de uso del sistema de recomendaciones de leyes
def recomendaciones_ley(request):
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

@csrf_exempt
def clasificar_delito(request):
    if request.method == 'POST':
        descripcion = request.POST.get('denuncia', None)
        if descripcion:
            print(descripcion)
            # Obtener la descripción del delito desde la solicitud POST
            # Convertir la descripción en un vector numérico utilizando el vectorizador
            X_test = vectorizer.transform([descripcion])
            # Hacer la predicción utilizando el modelo de clasificación
            y_pred = clf.predict(X_test)
            # Devolver la clasificación como una respuesta JSON                     
            return JsonResponse({'clasificacion': y_pred[0]})
        else:
            return JsonResponse({'error': 'invalid input.'})
    else:
        return JsonResponse({'error': 'Invalid request method.'})

# Definir los patrones de conversación
patterns = [
    ['Hola|Hola!|Hola ¿qué tal?', ['Hola, ¿cómo estás?', '¡Hola!']],
    ['¿Cómo estás?|¿Cómo te sientes?', ['Estoy bien, gracias. ¿Y tú?', 'Me siento muy bien, gracias']],
    ['¿Cuál es tu nombre?|¿Cómo te llamas?', ['Me llamo Chatbot, ¿y tú?', 'Mi nombre es Chatbot']],
    ['Adiós|Hasta luego|Chao|Hasta pronto', ['Adiós, ¡que tengas un buen día!', 'Hasta luego']],

]

# Crear una función para comparar la similitud entre dos textos
stop_words = set(stopwords.words('spanish'))
def get_similarity(text1, text2):
    filtered_text1 = [word for word in word_tokenize(text1.lower()) if word not in stop_words]
    filtered_text2 = [word for word in word_tokenize(text2.lower()) if word not in stop_words]
    return nltk.edit_distance(filtered_text1, filtered_text2)

# Crear una función para buscar la mejor respuesta para la entrada del usuario
def get_response(user_message):
    best_pattern = None
    min_distance = float('inf')
    for pattern, responses in patterns:
        distance = get_similarity(user_message, pattern)
        if distance < min_distance:
            min_distance = distance
            best_pattern = pattern
    return chatbot.respond(best_pattern)

# Crear una instancia del Chatbot
chatbot = Chat(patterns, reflections)

@csrf_exempt
def chat_bot(request):
    if request.method == 'POST':
        conversacion = request.POST.get('conversacion', None)
        if conversacion:
            print(conversacion)
            # Ejecutar el loop principal para recibir y responder mensajes del usuario
            respuesta = get_response(conversacion)
            print('Chatbot:', respuesta)                    
            return JsonResponse({'conversacion': respuesta})
        else:
            return JsonResponse({'error': 'invalid input.'})
    else:
        return JsonResponse({'error': 'Invalid request method.'})


@csrf_exempt
def facial_recognition(request):
    if request.method == 'POST':
        conversacion = request.POST.get('conversacion', None)
        if conversacion:
            print(conversacion)
            # Ejecutar el loop principal para recibir y responder mensajes del usuario
            respuesta = get_response(conversacion)
            print('Chatbot:', respuesta)                    
            return JsonResponse({'conversacion': respuesta})
        else:
            return JsonResponse({'error': 'invalid input.'})
    else:
        return JsonResponse({'error': 'Invalid request method.'})
    


from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, send_from_directory,jsonify
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import csv
import os

app = Flask(__name__)

#with open('output.csv', mode='r') as file:
#    reader = csv.DictReader(file)
#    data = {rows['h1']: rows for rows in reader}

# Cargar las leyes en el sistema
data = {
    "Articulo 1": "robo",
    "Articulo 2": "pistola",
    "Articulo 3": "dinero"
    # Agregar más artículos de las leyes relevantes
}


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

# Ejemplo de uso del sistema de recomendaciones de leyes


@app.route('/recomendacion', methods=['POST'])
def recomendacion():
    # Obtener la descripción del delito desde la solicitud POST
    denuncia = request.json['descripcion']
    recomendaciones = obtener_recomendaciones(denuncia)
    return jsonify({'recomendacion': recomendaciones})


@app.route('/')
def index():
   print('Request for index page received')
   return render_template('index.html')

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/hello', methods=['POST'])
def hello():
   descripcion = request.form.get('descripcion')

   if descripcion:
       print('Request page received ')
       recomendaciones = obtener_recomendaciones(descripcion)
       return render_template('hello.html', recomendaciones = recomendaciones)
   else:
       print('Request for hello page received with no name or blank name -- redirecting')
       return redirect(url_for('index'))


if __name__ == '__main__':
   app.run()
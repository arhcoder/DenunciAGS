from datetime import datetime
from flask import Flask, render_template, request, redirect, url_for, send_from_directory,jsonify
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.feature_extraction.text import CountVectorizer
import os

app = Flask(__name__)

# Cargar los datos
data = pd.read_csv('entrenamiento.csv')

# Crear un vectorizador para convertir las descripciones en vectores numéricos
vectorizer = CountVectorizer(stop_words='english')

# Crear el modelo de clasificación
clf = DecisionTreeClassifier()

# Entrenar el modelo
X = vectorizer.fit_transform(data['descripcion'])
y = data['clasificacion']
clf.fit(X, y)


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
   name = request.form.get('name')

   if name:
       print('Request for hello page received with name=%s' % name)
       return render_template('hello.html', name = name)
   else:
       print('Request for hello page received with no name or blank name -- redirecting')
       return redirect(url_for('index'))

@app.route('/clasificar', methods=['POST'])
def clasificar_delito():
    # Obtener la descripción del delito desde la solicitud POST
    descripcion = request.json['descripcion']

    # Convertir la descripción en un vector numérico utilizando el vectorizador
    X_test = vectorizer.transform([descripcion])

    # Hacer la predicción utilizando el modelo de clasificación
    y_pred = clf.predict(X_test)

    # Devolver la clasificación como una respuesta JSON
    return jsonify({'clasificacion': y_pred[0]})

if __name__ == '__main__':
   app.run()
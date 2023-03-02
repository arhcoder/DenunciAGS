
from django.shortcuts import render
from django.http import HttpResponse
from nltk.chat.util import Chat, reflections
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def chatbot_view(request):
    pairs = [
        ['Hola|Hola!|Hola ¿qué tal?', ['Hola, ¿cómo estás?', '¡Hola!']],
        ['¿Cómo estás?|¿Cómo te sientes?', ['Estoy bien, gracias. ¿Y tú?', 'Me siento muy bien, gracias']],
        ['¿Cuál es tu nombre?|¿Cómo te llamas?', ['Me llamo Chatbot, ¿y tú?', 'Mi nombre es Chatbot']],
        ['Adiós|Hasta luego|Chao|Hasta pronto', ['Adiós, ¡que tengas un buen día!', 'Hasta luego']],
    ]

    chatbot = Chat(pairs, reflections)
    response = chatbot.respond(request.POST.get('message'))
    return HttpResponse(response)

    
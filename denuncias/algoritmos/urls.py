from django.urls import path
from .views import process_image
from .views2 import chatbot_view,recomendaciones_ley2
from . import views

urlpatterns = [
    #Estatus Denuncias
    path('recomendaciones/', recomendaciones_ley2,name="recomendaciones"),
    path('clasificador/', views.clasificar_delito,name="clasificador"),
    path('chat/', views.chat_bot,name="chat"),
    path('chatv2/', chatbot_view,name="chat2"),
    path("send_ine/", views.process_image, name="process_image"),
    ]

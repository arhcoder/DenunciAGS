from django.urls import path
from . import views

urlpatterns = [
    #Estatus Denuncias
    path('recomendaciones/', views.recomendaciones_ley,name="recomendaciones"),
    path('clasificador/', views.clasificar_delito,name="clasificador"),
    path('chat/', views.chat_bot,name="chat"),
    ]

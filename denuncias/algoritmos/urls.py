from django.urls import path
from .views import process_image
from . import views

urlpatterns = [
    #Estatus Denuncias
    path('recomendaciones/', views.recomendaciones_ley,name="recomendaciones"),
    path('clasificador/', views.clasificar_delito,name="clasificador"),
    path('chat/', views.chat_bot,name="chat"),
    path("send_ine/", views.process_image, name="process_image"),
    ]
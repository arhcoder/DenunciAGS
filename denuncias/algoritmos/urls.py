from django.urls import path
from . import views

urlpatterns = [
    #Estatus Denuncias
    path('recomendaciones/', views.recomendaciones_ley,name="estatus-denuncia_list"),
    ]

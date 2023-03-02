from django.urls import path
from . import views

urlpatterns = [
    #Denuncias
    path('', views.DenunciaListAPIView.as_view(),name="denuncia_list"),
    path('<int:id>/', views.DenunciaRetrieveAPIView.as_view(), name="denuncia_detail"),
    path('create/', views.DenunciaCreateAPIView.as_view(), name="denuncia_create"),
    path('update/<int:id>/', views.DenunciaRetrieveUpdateAPIView.as_view(), name="denuncia_update"),
    path('delete/<int:id>/', views.DenunciaDestroyAPIView.as_view(),name="denuncia_delete"),
    #Evidencias
     path('evidencia/', views.EvidenciaListAPIView.as_view(),name="evidencia_list"),
    path('evidencia/<int:id>/', views.EvidenciaRetrieveAPIView.as_view(), name="evidencia_detail"),
    path('evidencia/create/', views.EvidenciaCreateAPIView.as_view(), name="evidencia_create"),
    path('evidencia/update/<int:id>/', views.EvidenciaRetrieveUpdateAPIView.as_view(), name="evidencia_update"),
    path('evidencia/delete/<int:id>/', views.EvidenciaDestroyAPIView.as_view(),name="evidencia_delete")
    ]

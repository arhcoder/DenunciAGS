from django.urls import path
from . import views

urlpatterns = [
    #Estatus Denuncias
    path('estatus/', views.EstatusDenunciaListAPIView.as_view(),name="estatus-denuncia_list"),
    path('estatus/<int:id>/', views.EstatusDenunciaRetrieveAPIView.as_view(), name="estatus-denuncia_detail"),
    path('estatus/create/', views.EstatusDenunciaCreateAPIView.as_view(), name="estatus-denuncia_create"),
    path('estatus/update/<int:id>/', views.EstatusDenunciaRetrieveUpdateAPIView.as_view(), name="estatus-denuncia_update"),
    path('estatus/delete/<int:id>/', views.EstatusDenunciaDestroyAPIView.as_view(),name="estatus-denuncia_delete"),

    #Denuncias
    path('', views.DenunciaListAPIView.as_view(),name="denuncia_list"),
    path('<int:id>/', views.DenunciaRetrieveAPIView.as_view(), name="denuncia_detail"),
    path('create/', views.DenunciaCreateAPIView.as_view(), name="denuncia_create"),
    path('update/<int:id>/', views.DenunciaRetrieveUpdateAPIView.as_view(), name="denuncia_update"),
    path('delete/<int:id>/', views.DenunciaDestroyAPIView.as_view(),name="denuncia_delete"),

    #Lugar Denuncia
    path('lugarDenuncia/', views.LugarDenunciaListAPIView.as_view(),name="lugar-denuncia_list"),
    path('lugarDenuncia/<int:id>/', views.LugarDenunciaRetrieveAPIView.as_view(), name="lugar-denuncia_detail"),
    path('lugarDenuncia/create/', views.LugarDenunciaCreateAPIView.as_view(), name="lugar-denuncia_create"),
    path('lugarDenuncia/update/<int:id>/', views.LugarDenunciaRetrieveUpdateAPIView.as_view(), name="lugar-denuncia_update"),
    path('lugarDenuncia/delete/<int:id>/', views.LugarDenunciaDestroyAPIView.as_view(),name="lugar-denuncia_delete"),

    #Evidencias
     path('evidencia/', views.EvidenciaListAPIView.as_view(),name="evidencia_list"),
    path('evidencia/<int:id>/', views.EvidenciaRetrieveAPIView.as_view(), name="evidencia_detail"),
    path('evidencia/create/', views.EvidenciaCreateAPIView.as_view(), name="evidencia_create"),
    path('evidencia/update/<int:id>/', views.EvidenciaRetrieveUpdateAPIView.as_view(), name="evidencia_update"),
    path('evidencia/delete/<int:id>/', views.EvidenciaDestroyAPIView.as_view(),name="evidencia_delete"),

    #Domicilio
     path('domicilio/', views.DomicilioListAPIView.as_view(),name="domicilio_list"),
    path('domicilio/<int:id>/', views.DomicilioRetrieveAPIView.as_view(), name="domicilio_detail"),
    path('domicilio/create/', views.DomicilioCreateAPIView.as_view(), name="domicilio_create"),
    path('domicilio/update/<int:id>/', views.DomicilioRetrieveUpdateAPIView.as_view(), name="domicilio_update"),
    path('domicilio/delete/<int:id>/', views.DomicilioDestroyAPIView.as_view(),name="domicilio_delete"),
    ]

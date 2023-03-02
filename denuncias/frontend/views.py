from django.shortcuts import render
from rest_framework import generics
from .serializers import *
from .models import *

# Create your views here.


#
# DENUNCIAS 
#

class DenunciaListAPIView(generics.ListAPIView):
    queryset=denuncia.objects.all()
    serializer_class=DenunciaListSerializer

class DenunciaRetrieveAPIView(generics.RetrieveAPIView):
    lookup_field='id'
    queryset=denuncia.objects.all()
    serializer_class=DenunciaDetailSerializer

class DenunciaCreateAPIView(generics.CreateAPIView):
    queryset=denuncia.objects.all()
    serializer_class=DenunciaDetailSerializer

class DenunciaRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    lookup_field='id'
    queryset=denuncia.objects.all()
    serializer_class=DenunciaDetailSerializer

class DenunciaDestroyAPIView(generics.DestroyAPIView):
    lookup_field='id'
    queryset=denuncia.objects.all()

#
# EVIDENCIAS
#

class EvidenciaListAPIView(generics.ListAPIView):
    queryset=evidencias.objects.all()
    serializer_class=EvidenciaListSerializer

class EvidenciaRetrieveAPIView(generics.RetrieveAPIView):
    lookup_field='id'
    queryset=evidencias.objects.all()
    serializer_class=EvidenciaDetailSerializer

class EvidenciaCreateAPIView(generics.CreateAPIView):
    queryset=evidencias.objects.all()
    serializer_class=EvidenciaDetailSerializer

class EvidenciaRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    lookup_field='id'
    queryset=evidencias.objects.all()
    serializer_class=EvidenciaDetailSerializer

class EvidenciaDestroyAPIView(generics.DestroyAPIView):
    lookup_field='id'
    queryset=evidencias.objects.all()

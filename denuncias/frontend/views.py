from django.shortcuts import render
from rest_framework import generics
from .serializers import DenunciaListSerializer,DenunciaDetailSerializer
from .models import denuncia

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
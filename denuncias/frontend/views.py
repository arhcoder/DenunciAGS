from django.shortcuts import render
from rest_framework import generics
from .serializers import *
from .models import *

from .serializers import DenunciaDetailSerializer

class SeguimientoSearchView(generics.ListAPIView):
    serializer_class = DenunciaDetailSerializer

    def get_queryset(self):
        query = self.request.query_params.get('numSeguimiento')
        if query:
            return denuncia.objects.filter(numSeguimiento=query)
        else:
            return denuncia.objects.all()
#
# ESTATUS DENUNCIAS
#

class EstatusDenunciaListAPIView(generics.ListAPIView):
    queryset=estatusdenuncia.objects.all()
    serializer_class=EstatusDenunciaListSerializer

class EstatusDenunciaRetrieveAPIView(generics.RetrieveAPIView):
    lookup_field='id'
    queryset=estatusdenuncia.objects.all()
    serializer_class=EstatusDenunciaDetailSerializer

class EstatusDenunciaCreateAPIView(generics.CreateAPIView):
    queryset=estatusdenuncia.objects.all()
    serializer_class=EstatusDenunciaDetailSerializer

class EstatusDenunciaRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    lookup_field='id'
    queryset=estatusdenuncia.objects.all()
    serializer_class=EstatusDenunciaDetailSerializer

class EstatusDenunciaDestroyAPIView(generics.DestroyAPIView):
    lookup_field='id'
    queryset=estatusdenuncia.objects.all()

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
# LUGAR DENUNCIA
#

class LugarDenunciaListAPIView(generics.ListAPIView):
    queryset=lugarDenuncia.objects.all()
    serializer_class=LugarDenunciaListSerializer

class LugarDenunciaRetrieveAPIView(generics.RetrieveAPIView):
    lookup_field='id'
    queryset=lugarDenuncia.objects.all()
    serializer_class=LugarDenunciaDetailSerializer

class LugarDenunciaCreateAPIView(generics.CreateAPIView):
    queryset=lugarDenuncia.objects.all()
    serializer_class=LugarDenunciaDetailSerializer

class LugarDenunciaRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    lookup_field='id'
    queryset=lugarDenuncia.objects.all()
    serializer_class=LugarDenunciaDetailSerializer

class LugarDenunciaDestroyAPIView(generics.DestroyAPIView):
    lookup_field='id'
    queryset=lugarDenuncia.objects.all()

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

#
# DOMICILIO
#

class DomicilioListAPIView(generics.ListAPIView):
    queryset=domicilio.objects.all()
    serializer_class=DomicilioListSerializer

class DomicilioRetrieveAPIView(generics.RetrieveAPIView):
    lookup_field='id'
    queryset=domicilio.objects.all()
    serializer_class=DomicilioListSerializer

class DomicilioCreateAPIView(generics.CreateAPIView):
    queryset=domicilio.objects.all()
    serializer_class=DomicilioListSerializer

class DomicilioRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    lookup_field='id'
    queryset=domicilio.objects.all()
    serializer_class=DomicilioListSerializer

class DomicilioDestroyAPIView(generics.DestroyAPIView):
    lookup_field='id'
    queryset=domicilio.objects.all()    


#

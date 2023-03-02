from rest_framework import serializers
from .models import *

#
# ESTATUS DENUNCIA
#
class EstatusDenunciaListSerializer(serializers.ModelSerializer):
    class Meta:
        model = estatusdenuncia
        fields = [
           'nombre',
            'descripcion'
        ]



class EstatusDenunciaDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = estatusdenuncia
        fields = [
           'nombre',
            'descripcion'
        ]

#
# DENUNCIAS 
#

class DenunciaListSerializer(serializers.ModelSerializer):
    class Meta:
        model = denuncia
        fields = [
            'numSeguimiento',
            'apellidoPaterno',
            'apellidoPaterno',
            'curp',
            'estatus',
            'respuesta',
            'descripcion'
        ]

class DenunciaDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = denuncia
        fields = [
            'numSeguimiento',
            'apellidoPaterno',
            'apellidoPaterno',
            'curp',
            'estatus',
            'respuesta',
            'descripcion'
        ]

#
# LUGAR DENUNCIA
#

class LugarDenunciaListSerializer(serializers.ModelSerializer):
    class Meta:
        model = lugarDenuncia
        fields = [
           'denuncia',
            'calle',
            'entreCalleUno',
            'entreCalleDos',
            'descripcion'
        ]

class LugarDenunciaDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = lugarDenuncia
        fields = [
           'denuncia',
            'calle',
            'entreCalleUno',
            'entreCalleDos',
            'descripcion'
        ]

#
# EVIDENCIAS
#

class EvidenciaListSerializer(serializers.ModelSerializer):
    class Meta:
        model = evidencias
        fields = [
            'id',
            'descripcion',
            'url'
        ]



class EvidenciaDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = evidencias
        fields = [
           'id',
            'descripcion',
            'url'
        ]

#
# DOMICILIO 
#

class DomicilioListSerializer(serializers.ModelSerializer):
    class Meta:
        model = domicilio
        fields = [
           'denuncia',
            'municipio',
            'codigoPostal',
            'colonia',
            'calle',
            'numExterior',
            'numInterior'
        ]

class DomicilioDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = domicilio
        fields = [
           'denuncia',
            'municipio',
            'codigoPostal',
            'colonia',
            'calle',
            'numExterior',
            'numInterior'
        ]
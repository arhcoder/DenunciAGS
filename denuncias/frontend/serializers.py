from audioop import reverse
from rest_framework import serializers
from .models import *
from django.urls import reverse

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

class ImageSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        fields = ['id',
            'descripcion',
            'url',
            'image'
            ]
        model = evidencias



class DenunciaListSerializer(serializers.ModelSerializer):
    absolute_url = serializers.SerializerMethodField()
    class Meta:
        model = denuncia
        fields = [
            'numSeguimiento',
            'apellidoPaterno',
            'apellidoPaterno',
            'curp',
            'estatus',
            'respuesta',
            'descripcion',
            'absolute_url',
        ]
    def get_absolute_url(self, obj):
        return reverse('denuncia_detail', args=(obj.pk,))

class DenunciaDetailSerializer(serializers.ModelSerializer):
    denuncia_images = ImageSerializer(many=True,required=False)
    class Meta:
        model = denuncia
        fields = [
            'numSeguimiento',
            'apellidoPaterno',
            'apellidoPaterno',
            'curp',
            'estatus',
            'respuesta',
            'descripcion',
            'denuncia_images'
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
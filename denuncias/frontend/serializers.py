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
            'nombre',
    'curp',
    'estatus',
    'respuesta',
    'descripcion',
    'numSeguimiento',
    'accion_denuncia',
    'fecha_hechos',
    'hora_hechos',
    'lugar_hechos',
    'testigos',
    'denuncia_anonima',
    'telefono_denunciante',
    'correo_denunciante',
    'firma',
    'tipodenuncia',
    'nombredenunciado',
    #denuncia
    'calle_denuncia',
    'entreCalleUno_denuncia',
    'entreCalleDos_denuncia',
    #domicilio_denunciado
    'municipio_denunciado',
    'codigoPostal_denunciado',
    'colonia_denunciado',
    'calle_denunciado',
    'numExterior_denunciado',
    'numInterior_denunciado',
     #domicilio_denunciador
    'municipio_denunciador',
    'codigoPostal_denunciador',
    'colonia_denunciador',
    'calle_denunciador',
    'numExterior_denunciador',
    'numInterior_denunciador',
    'absolute_url'
        ]
    def get_absolute_url(self, obj):
        return reverse('denuncia_detail', args=(obj.pk,))

class DenunciaDetailSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = denuncia
        fields = [
               'nombre',
    'curp',
    'estatus',
    'respuesta',
    'descripcion',
    'numSeguimiento',
    'accion_denuncia',
    'fecha_hechos',
    'hora_hechos',
    'lugar_hechos',
    'testigos',
    'denuncia_anonima',
    'telefono_denunciante',
    'correo_denunciante',
    'firma',
    'tipodenuncia',
    'nombredenunciado',
    #denuncia
    'calle_denuncia',
    'entreCalleUno_denuncia',
    'entreCalleDos_denuncia',
    #domicilio_denunciado
    'municipio_denunciado',
    'codigoPostal_denunciado',
    'colonia_denunciado',
    'calle_denunciado',
    'numExterior_denunciado',
    'numInterior_denunciado',
     #domicilio_denunciador
    'municipio_denunciador',
    'codigoPostal_denunciador',
    'colonia_denunciador',
    'calle_denunciador',
    'numExterior_denunciador',
    'numInterior_denunciador',
   
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
from rest_framework import serializers
from .models import denuncia,evidencias


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
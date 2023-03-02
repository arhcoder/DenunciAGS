from rest_framework import serializers
from .models import modeloPrueba
from .models import denuncia

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = modeloPrueba
        fields = ('id','title', 'description')
        read_only_fields = ('created_at', )

class DenunciaListSerializer(serializers.ModelSerializer):
    class Meta:
        model = denuncia
        fields = [
            'id',
            'logo_image',
            'pizzeria_name',
            'city',
            'zip_code'
        ]


class DenunciaDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = denuncia
        fields = [
            'id',
            'pizzeria_name',
            'street',
            'city',
            'zip_code',
            'website',
            'phone_number',
            'description',
            'logo_image',
            'email',
            'active'
        ]
from rest_framework import serializers
from .models import modeloPrueba

class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = modeloPrueba
        fields = ('id','title', 'description')
        read_only_fields = ('created_at', )
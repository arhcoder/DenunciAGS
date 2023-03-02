from django.contrib import admin
from . import models
# Register your models here.

admin.site.register(models.modeloPrueba)
admin.site.register(models.denuncia)
admin.site.register(models.estatusdenuncia)
admin.site.register(models.domicilio)
admin.site.register(models.lugarDenuncia)
admin.site.register(models.evidencias)



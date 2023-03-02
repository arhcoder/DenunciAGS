from django.db import models
from .tracking_code import get_tracking_code
from django.dispatch import receiver
from django.db.models.signals import *

from .tracking_code import get_tracking_code

class estatusdenuncia(models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=200)
    def __str__(self): 
        return self.nombre   


class denuncia(models.Model):
    nombre = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    curp = models.CharField(max_length=45)
    estatus=models.ForeignKey(estatusdenuncia, on_delete=models.CASCADE,null=True)
    respuesta = models.CharField(max_length=300,null=True)
    descripcion=models.CharField(max_length=900)
    numSeguimiento = models.CharField(max_length=20,null=True)
    accion_denuncia=models.CharField(max_length=50,null=True)
    fecha_hechos=models.CharField(max_length=20,null=True)
    hora_hechos=models.CharField(max_length=20,null=True)
    lugar_hechos=models.CharField(max_length=200,null=True)
    testigos=models.CharField(max_length=400,null=True)
    denuncia_anonima=models.BooleanField(default=False,null=True)
    telefono_denunciante=models.CharField(max_length=20,null=True)
    correo_denunciante=models.CharField(max_length=200,null=True)
    firma=models.ImageField(upload_to="firmas",null=True)    
    def __str__(self): 
        return self.nombre+self.numSeguimiento


@receiver(post_save, sender=denuncia)
def set_created_at(sender, instance, **kwargs):
    vcurp=instance.curp
    seguimiento=get_tracking_code(vcurp)
    instance.numSeguimiento=seguimiento


class lugarDenuncia(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE)
    calle = models.CharField(max_length=100)
    entreCalleUno = models.CharField(max_length=100)
    entreCalleDos = models.CharField(max_length=100)
    descripcion = models.TextField(null=True)
    def __str__(self): 
        return self.denuncia+self.descripcion

class evidencias(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE)
    descripcion=models.CharField(max_length=200,null=True)
    url = models.TextField(max_length=500)
    image = models.ImageField(upload_to='fotos',blank=True)
    def __str__(self): 
        return self.descripcion

class domicilio(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE,related_name='denuncia_images',blank=True, null=True)
    municipio = models.TextField(max_length=45)
    codigoPostal = models.TextField(max_length=45)
    colonia = models.TextField(max_length=45)
    calle = models.TextField(max_length=45)
    numExterior = models.IntegerField()
    numInterior = models.TextField(max_length=45, null=True)

    def __str__(self): 
        return self.denuncia
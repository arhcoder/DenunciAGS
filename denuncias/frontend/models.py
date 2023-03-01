from django.db import models

# Create your models here.
class modeloPrueba(models.Model):
    title = models.CharField(max_length = 30)
    description = models.TextField()

class denuncia(models.Model):
    numSeguimiento = models.CharField(max_length=15, primary_key=True)
    nombre = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    curp = models.CharField(max_length=45)

class lugarDenuncia(models.Model):
    models.ForeignKey(denuncia, on_delete=models.CASCADE)
    calle = models.CharField(max_length=100)
    entreCalleUno = models.CharField(max_length=100)
    entreCalleDos = models.CharField(max_length=100)
    descripcion = models.TextField(null=True)

class evidencias(models.Model):
    models.ForeignKey(denuncia, on_delete=models.CASCADE)
    url = models.TextField(max_length=500)

class domicilio(models.Model):
    models.ForeignKey(denuncia, on_delete=models.CASCADE)
    municipio = models.TextField(max_length=45)
    codigoPostal = models.TextField(max_length=45)
    colonia = models.TextField(max_length=45)
    calle = models.TextField(max_length=45)
    numExterior = models.IntegerField()
    numInterior = models.TextField(max_length=45, null=True)

from django.db import models

# Create your models here.
class modeloPrueba(models.Model):
    title = models.CharField(max_length = 30)
    description = models.TextField()
    def __str__(self): 
        return self.title    

class estatusdenuncia(models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.CharField(max_length=200)


class denuncia(models.Model):
    numSeguimiento = models.CharField(max_length=15, primary_key=True)
    nombre = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    apellidoPaterno = models.CharField(max_length=45)
    curp = models.CharField(max_length=45)
    estatus=models.ForeignKey(estatusdenuncia, on_delete=models.CASCADE)
    respuesta = models.CharField(max_length=300,null=True)

class lugarDenuncia(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE)
    calle = models.CharField(max_length=100)
    entreCalleUno = models.CharField(max_length=100)
    entreCalleDos = models.CharField(max_length=100)
    descripcion = models.TextField(null=True)

class evidencias(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE)
    url = models.TextField(max_length=500)

class domicilio(models.Model):
    denuncia=models.ForeignKey(denuncia, on_delete=models.CASCADE)
    municipio = models.TextField(max_length=45)
    codigoPostal = models.TextField(max_length=45)
    colonia = models.TextField(max_length=45)
    calle = models.TextField(max_length=45)
    numExterior = models.IntegerField()
    numInterior = models.TextField(max_length=45, null=True)

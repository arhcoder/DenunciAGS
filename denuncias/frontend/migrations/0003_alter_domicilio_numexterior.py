# Generated by Django 4.1.7 on 2023-03-01 22:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('frontend', '0002_denuncia_domicilio_evidencias_lugardenuncia'),
    ]

    operations = [
        migrations.AlterField(
            model_name='domicilio',
            name='numExterior',
            field=models.IntegerField(),
        ),
    ]
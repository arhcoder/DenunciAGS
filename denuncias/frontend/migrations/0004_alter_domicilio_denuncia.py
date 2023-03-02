# Generated by Django 4.1.7 on 2023-03-02 08:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    dependencies = [
        ("frontend", "0003_evidencias_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="domicilio",
            name="denuncia",
            field=models.ForeignKey(
                blank=True,
                null=True,
                on_delete=django.db.models.deletion.CASCADE,
                related_name="denuncia_images",
                to="frontend.denuncia",
            ),
        ),
    ]

# Generated by Django 3.0.5 on 2020-06-05 21:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('indoorAppServer', '0007_auto_20200605_2256'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fingerprint',
            name='coordinate_X',
            field=models.FloatField(null=True),
        ),
        migrations.AlterField(
            model_name='fingerprint',
            name='coordinate_Y',
            field=models.FloatField(null=True),
        ),
    ]

# Generated by Django 3.0.8 on 2020-09-04 17:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('indoorAppServer', '0008_auto_20200605_2259'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserTable',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=100)),
            ],
        ),
    ]

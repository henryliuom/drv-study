# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-02 05:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('menuManage', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='firstmenus',
            name='iconclass',
            field=models.CharField(blank=True, max_length=80),
        ),
        migrations.AlterField(
            model_name='secondmenus',
            name='onshow',
            field=models.BooleanField(default=False),
        ),
    ]

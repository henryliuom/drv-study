# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-08-11 03:03
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('userPermission', '__first__'),
        ('menuManage', '0003_auto_20170811_1009'),
    ]

    operations = [
        migrations.CreateModel(
            name='Operaterecords',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date', models.DateTimeField(default=b'2017-08-11 11:03:17', verbose_name='\u64cd\u4f5c\u65f6\u95f4')),
                ('operate', models.CharField(choices=[('add', '\u6dfb\u52a0'), ('delete', '\u5220\u9664'), ('modify', '\u4fee\u6539'), ('view', '\u67e5\u770b')], max_length=6)),
                ('olddata', models.TextField(blank=True)),
                ('newdata', models.TextField(blank=True)),
                ('secondmenu', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='menuManage.Secondmenus', verbose_name='\u64cd\u4f5c\u6a21\u5757')),
                ('staff', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='userPermission.Staffs', verbose_name='\u64cd\u4f5c\u7528\u6237')),
            ],
            options={
                'db_table': 'meteor_operaterecords',
            },
        ),
    ]
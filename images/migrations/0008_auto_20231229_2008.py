# Generated by Django 3.1 on 2023-12-29 20:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('images', '0007_auto_20231228_2148'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product',
            name='nutritive_benefits',
            field=models.CharField(help_text="enter list separated with commas, end with a comma ','", max_length=255),
        ),
    ]

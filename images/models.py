from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

# # Create your models here.


def user_directory_path(instance, filename):
    return 'images/{0}/'.format(filename)

def validate_lowercase(value):
    if value != value.lower():
        raise ValidationError('value must be lower case')

class Category(models.Model):
    name = models.CharField(max_length=100, validators= [validate_lowercase])

    def __str__(self):
        return self.name
    
    class Meta:
        verbose_name_plural =  'Categories'

class Product(models.Model):

    options = (
        ('active', 'Active'),
        ('deactivated', 'Deactivated'),
    )
    title = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    nutritive_benefits = models.CharField(max_length=255)
    image = models.ImageField(upload_to=user_directory_path)
    price = models.IntegerField(default=0)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, default='1')
    created = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=11, choices=options, default='active')

    class Meta:
        verbose_name_plural =  'Products'


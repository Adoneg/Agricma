from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError

# # Create your models here.


def user_directory_path(instance, filename):
    return 'images/{0}/'.format(filename)

def validate_lowercase(value):
    if value != value.lower():
        raise ValidationError('VALUE MUST BE LOWERCASE')
    
def validate_comma(value):
    print(f'\n\n{value[-1]}\n\n\n')
    if value[-1] != ',':
        raise ValidationError("VALUE MUST END WITH A COMMA ','")

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
    nutritive_benefits = models.CharField(max_length=255, validators= [validate_comma], help_text="Enter list separated with commas, end with a comma too ','")
    image = models.ImageField(upload_to=user_directory_path)
    price = models.IntegerField(default=0)
    category = models.ForeignKey(Category, on_delete=models.PROTECT, default='1')
    created = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=11, choices=options, default='active')

    class Meta:
        verbose_name_plural =  'Products'


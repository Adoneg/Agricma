# serializers.py

from rest_framework import serializers
from images.models import Product

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = ('id', 'title', 'image')

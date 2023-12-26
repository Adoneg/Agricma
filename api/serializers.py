from rest_framework import serializers
from images.models import Images, Category


class ImagesSerializer(serializers.ModelSerializer):

    class Meta:
        model = Images
        fields = ('id', 'image', 'title', 'price', 'category')

        
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


""" class ImagesSerializer(serializers.ModelSerializer):

    image_url = serializers.SerializerMethodField('get_image_url')

    class Meta:
        model = Images
        fields = ('id',
                  'image',
                  'image_url')

    def get_image_url(self, obj):
        return obj.image.url """

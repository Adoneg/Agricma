# from wsgiref.util import FileWrapper
# from api.custom_renderers import JPEGRenderer, PNGRenderer
# from rest_framework import generics
# from images.models import Images, Category
# from .serializers import ImagesSerializer, CategorySerializer
# from rest_framework.response import Response
# from rest_framework import viewsets
# from rest_framework import renderers
# from rest_framework.decorators import api_view
# from rest_framework.views import APIView
# from rest_framework.decorators import renderer_classes, api_view
# from rest_framework.renderers import StaticHTMLRenderer
# from django.http import HttpResponse
# from PIL import Image
# # from rest_framework_api_key.permissions import HasAPIKey
from .permissions import HasAPIKey
# from rest_framework.views import APIView
# from rest_framework_api_key.models import APIKey
# # @api_view(['GET']) used for function based views

# # class ImageAPIView(generics.RetrieveAPIView):
# #     permission_classes = [HasAPIKey]

# #     queryset = Images.objects.filter(id=1) #initial queryset: perf, default data etc
# #     renderer_classes = [JPEGRenderer]

# #     def get(self, request, *args, **kwargs):
# #         queryset = Images.objects.get(id=self.kwargs['id']).image
# #         data = queryset
# #         return Response(data)

# class ImageAPIView(generics.RetrieveAPIView):
#     print("databbbbbbbbbbbbbbb")

#     permission_classes = [HasAPIKey]

#     queryset = Images.objects.filter(id=1) #initial queryset: perf, default data etc
#     renderer_classes = [JPEGRenderer]

#     def get(self, request, *args, **kwargs):
#         queryset = Images.objects.all()
#         data = queryset
#         for obj in data:
#             print(obj.image)
#             return Response(obj.image)
    
# class getImageData(generics.RetrieveAPIView, APIView):
#     permission_classes = [HasAPIKey]
#     queryset = Images.objects.filter(id=1)

#     def get(self, request, *args, **kwargs): #request: info about the req, args n kwargs: additional info params in the req
#         queryset = Images.objects.get(id=self.kwargs['id'])
#         serializer = ImagesSerializer(queryset)
#         queryset = Category.objects.get(id=serializer.data['category'])
#         catSerializer = CategorySerializer(queryset)

#         data = {
#                 'id': self.kwargs['id'],
#                 "cat": catSerializer.data['name'],
#                 "title": serializer.data['title'],
#                 "price": serializer.data['price'],
#                 }
#         return Response(data)
    
# views.py

from rest_framework import generics
from images.models import Product
from images.serializers import ImageSerializer

class ImageListAPIView(generics.ListAPIView):
    permission_classes = [HasAPIKey]

    queryset = Product.objects.all()
    serializer_class = ImageSerializer

# from wsgiref.util import FileWrapper
# from api.custom_renderers import JPEGRenderer, PNGRenderer
from rest_framework import generics
from images.serializers import ProductSerializer, CategorySerializer
from rest_framework.response import Response
from images.models import Product, Category
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

from images.serializers import ProductSerializer

# class ProdListAPIView(generics.ListAPIView):
#     permission_classes = [HasAPIKey]

#     queryset = Product.objects.all()
#     serializer_class = ImageSerializer

class ProdListAPIView(generics.ListAPIView):
    permission_classes = [HasAPIKey]
    
    def get(self, request, *args, **kwargs): #request: info about the req, args n kwargs: additional info params in the req
        queryset = Product.objects.all()
        serializer_class = ProductSerializer(queryset, many=True)

        data = []
        for item in serializer_class.data:
           queryset = Category.objects.get(id=item['category'])
           catSerializer = CategorySerializer(queryset)

           data.append({
                        'id': item['id'],
                        "cat": catSerializer.data['name'],
                        "title": item['title'],
                        "price": item['price'],
                        "image": item['image'],
                        "status": item['status'],
                        "description": item['description'],
                        "nutritive_benefits": item['nutritive_benefits'],
                        "created": item['created'],
                        })
        return Response(data)
    

class ProdCatListAPIView(generics.ListAPIView):
    permission_classes = [HasAPIKey]
    
    def get(self, request, *args, **kwargs):
        queryset = Category.objects.get(name=request.META['HTTP_CAT'].lower())

        queryset = Product.objects.filter(category=queryset.id)
        serializer_class = ProductSerializer(queryset, many=True)
        
        data = []
        for item in serializer_class.data:
           queryset = Category.objects.get(id=item['category'])
           catSerializer = CategorySerializer(queryset)

           data.append({
                        'id': item['id'],
                        "cat": request.META['HTTP_CAT'].lower(),
                        "title": item['title'],
                        "price": item['price'],
                        "image": item['image'],
                        "status": item['status'],
                        "description": item['description'],
                        "nutritive_benefits": item['nutritive_benefits'],
                        "created": item['created'],
                        })
        print(data)
        return Response(data)
    
class CatListAPIView(generics.ListAPIView):
    permission_classes = [HasAPIKey]

    def get(self, request, *args, **kwargs):
        queryset = Category.objects.all()
        catSerializer = CategorySerializer(queryset, many=True)

        return Response(catSerializer.data)
    
        print(f"\n\n{catSerializer.data}\n\n")

        data = []
        # for item in catSerializer.data:
        #    queryset = Category.objects.get(id=item['category'])
        #    catSerializer = CategorySerializer(queryset)
        #    print(f"\n\n{item}\n\n")
        #    data.append({
        #                 'id': item['id'],
        #                 "cat": item['name'],
        #                 })
        # print(data)

        





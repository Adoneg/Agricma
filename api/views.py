from rest_framework import generics
from images.serializers import ProductSerializer, CategorySerializer
from rest_framework.response import Response
from images.models import Product, Category
from .permissions import HasAPIKey

from images.serializers import ProductSerializer

class ProdListAPIView(generics.ListAPIView):
    permission_classes = [HasAPIKey]
    
    def get(self, request, *args, **kwargs): #request: info about the req, args n kwargs: additional info params in the req
        queryset = Product.objects.all()
        serializer_class = ProductSerializer(queryset, many=True)

        data = []
        for item in serializer_class.data:
           queryset = Category.objects.get(id=item['category'])
           catSerializer = CategorySerializer(queryset)


            # getting a list of nutritive benefits
           nutritive_benefits = []
           str = ''
           for letter in item['nutritive_benefits']:
               if letter == ',':
                nutritive_benefits.append(str)
                str = ''
               else:
                  str += letter


           data.append({
                        'id': item['id'],
                        "cat": catSerializer.data['name'],
                        "title": item['title'],
                        "price": item['price'],
                        "product": item['image'],
                        "status": item['status'],
                        "description": item['description'],
                        "nutritive_benefits": nutritive_benefits,
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
                        "product": item['image'],
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


        





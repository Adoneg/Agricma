# from django.urls import path
# from .views import ImageAPIView, getImageData
# #from . import views

# urlpatterns = [
#     path('', ImageAPIView.as_view()),
#     path('img/', ImageAPIView.as_view()),
#     path('imgdata/<id>', getImageData.as_view()),
#     #path('', views.ImageAPI, name='post_single'),
# ]

# urls.py

from django.urls import path
from .views import ProdListAPIView, ProdCatListAPIView, CatListAPIView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('prod_data/', ProdListAPIView.as_view(), name='image-list'),
    path('prod_cat/', ProdCatListAPIView.as_view(), name='ProdCatListAPIView-list'),
    path('cat/', CatListAPIView.as_view(), name='CatListAPIView-list'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

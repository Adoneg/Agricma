from django.urls import path
from .views import ImageAPIView, getImageData
#from . import views

urlpatterns = [
    path('', ImageAPIView.as_view()),
    path('img/<id>', ImageAPIView.as_view()),
    path('imgdata/<id>', getImageData.as_view()),
    #path('', views.ImageAPI, name='post_single'),
]

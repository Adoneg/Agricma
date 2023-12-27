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
from .views import ImageListAPIView

urlpatterns = [
    path('images/', ImageListAPIView.as_view(), name='image-list'),
]

# urls.py

from django.conf import settings
from django.conf.urls.static import static

# ...

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

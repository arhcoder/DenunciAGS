from rest_framework import routers
from .api import ProjectViewSet

router = routers.DefaultRouter()

router.register('api/frontend', ProjectViewSet, 'frontend')

urlpatterns = router.urls

from django.urls import path
from . import views

urlpatterns = [
    path('', views.DenunciaListAPIView.as_view(),name="denuncia_list"),
    path('<int:id>/', views.DenunciaRetrieveAPIView.as_view(), name="denuncia_detail"),
    path('create/', views.DenunciaCreateAPIView.as_view(), name="denuncia_create"),
    path('update/<int:id>/', views.DenunciaRetrieveUpdateAPIView.as_view(), name="denuncia_update"),
    path('delete/<int:id>/', views.DenunciaDestroyAPIView.as_view(),name="denuncia_delete")
    ]

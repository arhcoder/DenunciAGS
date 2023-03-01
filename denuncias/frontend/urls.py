from rest_framework import routers
from .api import ProjectViewSet

router = routers.DefaultRouter()

router.register('api/frontend', ProjectViewSet, 'frontend')

urlpatterns = router.urls
from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import CustomUserCreateView, CustomTokenObtainPairView, CustomUserCreateView, UserRetrieveUpdateAPIView, GetBusView

# URLs for the backend API
urlpatterns = [
    path('register/', CustomUserCreateView.as_view(), name='register'),
    path('login/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('login/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('retrieve_user/', UserRetrieveUpdateAPIView.as_view(), name='retrieve_user'),
    path('update_user/', UserRetrieveUpdateAPIView.as_view(), name='update_user'),
    path('bus/get/<int:bus_id>/', GetBusView.as_view(), name='get-bus'),
]

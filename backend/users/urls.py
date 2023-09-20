from django.urls import path
from rest_framework_simplejwt.views import TokenRefreshView
from .views import (
    CustomUserCreateView,
    CustomTokenObtainPairView,
    CustomUserCreateView,
    UserRetrieveUpdateAPIView,
    GetBusView,
    GetBusListView,
    BusRegistration,
    BusExit,
    GetUsersBus,
)

# URLs for the backend API
urlpatterns = [
    path("register/", CustomUserCreateView.as_view(), name="register"),
    path("login/", CustomTokenObtainPairView.as_view(), name="token_obtain_pair"),
    path("login/refresh/", TokenRefreshView.as_view(), name="token_refresh"),
    path("retrieve_user/", UserRetrieveUpdateAPIView.as_view(), name="retrieve_user"),
    path("update_user/", UserRetrieveUpdateAPIView.as_view(), name="update_user"),
    path("bus/get/<int:bus_id>/", GetBusView.as_view(), name="get-bus"),
    path("bus/get/list/", GetBusListView.as_view(), name="get-bus-list"),
    path("bus/register/<int:bus_id>/", GetBusView.as_view(), name="bus-register"),
    path("bus/exit/<int:bus_id>/", GetBusView.as_view(), name="bus-exit"),
    path("user/get/bus/", GetUsersBus.as_view(), name="get-users-bus"),
]

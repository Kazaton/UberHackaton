from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Bus, BusType, User
from .serializers import UserSerializer, CustomTokenObtainPairSerializer, BusSerializer
from rest_framework import generics, status, permissions 
from rest_framework_simplejwt.views import TokenObtainPairView

# Using serializers to provide information via JSON
class CustomTokenObtainPairView(TokenObtainPairView):
    # Custom Login with Tokens
    serializer_class = CustomTokenObtainPairSerializer

class CustomUserCreateView(generics.CreateAPIView):
    # Custom Registration
    serializer_class = UserSerializer
    
class UserRetrieveUpdateAPIView(generics.RetrieveUpdateAPIView):
    permission_classes = (permissions.IsAuthenticated,) # Checking if user is authenticated
    serializer_class = UserSerializer

    # If frontend wants to retrieve user's data
    def retrieve(self, request, *args, **kwargs):
        serializer = self.serializer_class(request.user)
        return Response(serializer.data, status=status.HTTP_200_OK) # Return data and code

    # If user wants to update his credentials
    def update(self, request, *args, **kwargs):
        serializer = self.serializer_class(request.user, data=request.data, partial=True)
        serializer.is_valid(raise_exception=True) # Catching errors using serializer
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)

class GetBusView(APIView):
    
    def get(self, request, bus_id): # Using GET method with bus_id as a parameter

        try:
            # Getting bus and its data with bus_id
            bus = Bus.objects.get(id=bus_id) 
            data = BusSerializer(bus).data
            return Response(data=data, status=status.HTTP_200_OK)
        except:
            # Error message if the bus_id is wrong
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"message": "No such bus id"})
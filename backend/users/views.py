from django.http import HttpResponse
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Bus, BusType, User, UserRegistration
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
    permission_classes = (
        permissions.IsAuthenticated,
    )  # Checking if user is authenticated
    serializer_class = UserSerializer

    # If frontend wants to retrieve user's data
    def retrieve(self, request, *args, **kwargs):
        serializer = self.serializer_class(request.user)
        return Response(
            serializer.data, status=status.HTTP_200_OK
        )  # Return data and code

    # If user wants to update his credentials
    def update(self, request, *args, **kwargs):
        serializer = self.serializer_class(
            request.user, data=request.data, partial=True
        )
        serializer.is_valid(raise_exception=True)  # Catching errors using serializer
        serializer.save()
        return Response(serializer.data, status=status.HTTP_200_OK)


class GetBusView(APIView):
    def get(self, request, bus_id):  # Using GET method with bus_id as a parameter
        try:
            # Getting bus and its data with bus_id
            bus = Bus.objects.get(id=bus_id)
            data = BusSerializer(bus).data
            return Response(data=data, status=status.HTTP_200_OK)
        except:
            # Error message if the bus_id is wrong
            return Response(
                status=status.HTTP_400_BAD_REQUEST, data={"message": "No such bus id"}
            )


class GetBusListView(APIView):
    def get(self, request):
        try:
            # Getting list of all buses
            buses = Bus.objects.all()
            data = []
            for bus in buses:
                bus_data = BusSerializer(bus).data
                data.append(bus_data)
            return Response(data=data, status=status.HTTP_200_OK)
        except:
            # Error message if there is no buses
            return Response(
                status=status.HTTP_400_BAD_REQUEST,
                data={"message": "No buses registered yet"},
            )


class BusRegistration(APIView):
    def post(self, request, bus_id):
        try:
            # Getting bus via id
            bus = Bus.objects.get(id=bus_id)
            # Getting user's info
            user = request.user
            is_disabled = False
            existing_registration = UserRegistration.objects.filter(
                user=user, bus=bus
            ).first()  # Checking if user is registered
            if not existing_registration:
                # Create new registration
                registration = UserRegistration(
                    user=user, bus=bus, is_disabled=is_disabled
                )
                registration.save()

                # Update passangers' number and special seats' number
                bus.number_of_people += 1
                if is_disabled:
                    bus.number_of_special_seats += 1
                bus.save()
            return Response(status=status.HTTP_200_OK)

        except:
            # Error message if the bus_id is wrong
            return Response(
                status=status.HTTP_400_BAD_REQUEST, data={"message": "No such bus id"}
            )


class BusExit(APIView):
    def post(self, request, bus_id):
        try:
            # Getting bus via bus_id
            bus = Bus.objects.get(id=bus_id)
            # Getting user's info
            user = request.user
            registration = UserRegistration.objects.filter(
                user=user, bus=bus
            ).first()  # Find the user's registration
            if registration:  # If exists
                # Delete registration
                registration.delete()

                # Update the number of passangers and special seats
                bus.number_of_people -= 1
                if registration.is_disabled:
                    bus.number_of_special_seats -= 1
                bus.save()
            return Response(status=status.HTTP_200_OK)

        except:
            # Error message if the bus_id is wrong
            return Response(
                status=status.HTTP_400_BAD_REQUEST, data={"message": "No such bus id"}
            )


class GetUsersBus(APIView):
    def get(self, request):
        try:
            # Getting user's info
            user = request.user
            # Getting bus via user's registration
            registration = UserRegistration.objects.filter(user=user.id).first()
            if registration:  # If exists
                # Get bus info
                bus = registration.bus
                data = BusSerializer(bus).data
                return Response(status=status.HTTP_200_OK, data=data)
            else:  # If doesn't we inform that user has no registration
                return Response(
                    status=status.HTTP_404_NOT_FOUND,
                    data={"message": "User haven't registered yet"},
                )
        except:
            # Error message if the bus_id is wrong
            return Response(
                status=status.HTTP_400_BAD_REQUEST, data={"message": "No such bus id"}
            )

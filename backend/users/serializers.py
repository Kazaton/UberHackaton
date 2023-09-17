from rest_framework import serializers
from .models import User
from django.utils.translation import gettext_lazy as _

class CustomTokenObtainPairSerializer(serializers.Serializer):
    phone = serializers.CharField()

    def validate(self, attrs):
        phone = attrs.get('phone')
        password = attrs.get('password')

        user = User.objects.filter(phone=phone).first()

        if user and user.check_password(password):
            refresh = self.set_token(user)
            return {
                'refresh': str(refresh),
                'access': str(refresh.access_token),
            }

        raise serializers.ValidationError('No active account found with the given credentials')

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(
        label=_("Password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )
    confirm_password = serializers.CharField(
        label=_("Confirm Password"),
        style={'input_type': 'password'},
        trim_whitespace=False,
        max_length=128,
        write_only=True
    )

    class Meta:
        model = User
        fields = ['id', 'phone', 'password', 'confirm_password', 'is_disabled', 'age', 'first_name', 'last_name']

    def validate(self, attrs):
        if attrs['password'] != attrs['confirm_password']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})
        
        # checking if phone exists
        phone_exists = User.objects.filter(phone=attrs['phone']).exists()

        # creating error messages
        if phone_exists:
            raise serializers.ValidationError({"phone": "Phone number has already been used"})

        return attrs
    

    def create(self, validated_data):
        validated_data.pop('confirm_password')
        user = User.objects.create_user(**validated_data)
        return user
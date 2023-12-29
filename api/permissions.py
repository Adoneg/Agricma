# permissions.py
from rest_framework.permissions import BasePermission
from rest_framework_api_key.models import APIKey

class HasAPIKey(BasePermission):
    def has_permission(self, request, view):
        # Add your logic to validate the API key from the request
        sent_api_key = request.META.get('HTTP_AUTHORIZATION')  # Example: Retrieve API key from request headers
        bearer = request.META.get('HTTP_BEARER')  # Example: Retrieve API key from request headers
        sent_api_key_prefix = sent_api_key.split('.')[0]
        # print(f"\n\n{sent_api_key_prefix}\n\n")
        # Perform validation of the API key here

        if APIKey.objects.filter(name=bearer).exists():
            api_key= APIKey.objects.get(name=bearer)
            if sent_api_key_prefix == api_key.prefix:  # Replace with your actual API key validation logic
                return True
            else:
                return False

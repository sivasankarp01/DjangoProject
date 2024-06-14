from rest_framework.response import Response
from rest_framework.views import APIView
from .models import Demo
from .serializer import DemoSerializer

class DemoApiCalls(APIView):

    def get(self, request,id=None):
        if id:
            items=Demo.objects.get(id=id)
            serializer = DemoSerializer(items)
        else:
            items = Demo.objects.all()
        
            serializer = DemoSerializer(items, many=True)
        return Response(serializer.data)
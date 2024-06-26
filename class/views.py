from rest_framework.response import Response
from rest_framework.views import APIView
from .serializer import ClassSerializer
from .models import Class
from rest_framework import status

class ClassApiCall(APIView):
    def get(self,request):
        item=Class.objects.all()
        serializer=ClassSerializer(item,many=True)
        return Response(serializer.data)
    def post(self,request):
        item=ClassSerializer(data=request.data)
        if item.is_valid():
            item.save()
            return Response({"message":"created"},status=status.HTTP_200_OK)
        else:
            return Response(item.errors,status=status.HTTP_400_BAD_REQUEST)
    def delete(self,request,id):
        item=Class.objects.get(id=id)
        item.delete()
        return Response({"message":f"deleted Sucessfully {id}"},status=status.HTTP_200_OK)
    def put(self,request,id):
        item=Class.objects.get(id=id)
        seri=ClassSerializer(instance=item,data=request.data,partial=True)
        if seri.is_valid():
            seri.save()
            return Response({"message":f"Upodate Sucessfully {seri.data}"},status=status.HTTP_200_OK)
        else:
            return Response(seri.errors,status=status.HTTP_400_BAD_REQUEST)
        


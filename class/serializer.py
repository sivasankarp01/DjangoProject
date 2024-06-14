from rest_framework import serializers
from .models import Class
from demo.serializer import DemoSerializer
class ClassSerializer(serializers.ModelSerializer):
    student_details=serializers.SerializerMethodField()
    def get_student_details(self,obj):
        return DemoSerializer(obj.student).data
    class Meta:
        model= Class
        fields="__all__"
from django.db import models
from demo.models import Demo

# Create your models here.
class Class(models.Model):
    student=models.ForeignKey(Demo,on_delete=models.CASCADE)
    dob=models.DateField()
    qualification=models.CharField(max_length=100)
    address=models.CharField(max_length=200)
    phone=models.IntegerField()
    def __str__(self) -> str:
        return self.student.name
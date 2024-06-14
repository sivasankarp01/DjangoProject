from django.db import models

Gender=(
    ("male","male"),
    ("female","female")

)
# Create your models here.
class Demo(models.Model):
    name=models.CharField(max_length=40,)
    age=models.IntegerField()
    gender=models.CharField(choices=Gender,max_length=20)
    active=models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.name
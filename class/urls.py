from django .urls import path
from .views import *

urlpatterns=[
    path("api/class",ClassApiCall.as_view(),name="classapi")
]

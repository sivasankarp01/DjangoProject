from django .urls import path
from .views import *
urlpatterns=[
    path("api/demo",DemoApiCalls.as_view(),name="getDemo"),
    path("api/demo/<int:id>",DemoApiCalls.as_view(),name="getDemo")
]
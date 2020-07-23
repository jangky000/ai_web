"""config URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from ais import views # ais 패키지의 views.py 등록

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index), # views 모듈(파일)의 index 함수 호출, index.html
    path('calc/add/<int:su1>/<int:su2>/', views.add), # 더하기, ais/views 안에 있는 add라는 메소드 호출
    path('calc/sub/<int:su1>/<int:su2>/', views.sub),
    path('calc/mul/<int:su1>/<int:su2>/', views.mul),
    path('calc/div/<int:su1>/<int:su2>/', views.div),
    path('country/form/', views.country_form),  # 귀농귀촌 적응 예측 시스템 예측폼
    path('country/proc/', views.country_proc),   # 귀농귀촌 적응 예측 시스템 처리
    path('country/to_django/', views.to_django),  # JSP에서 데이터를 받아옴, html 사용 안함
    path('country/to_jsp/<str:drink>/<str:life>/<str:cousin>/<str:trip>/<str:house>/<str:land>/<str:pct>/<str:res>/', views.to_jsp, name='country/to_jsp'),  # JSP로 처리 결과를 보냄, to_jsp.html
]

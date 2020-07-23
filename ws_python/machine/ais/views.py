from django.shortcuts import render
from ais.models import Calc # models.py 파일의 Calc class import 선언
from ais.models import Country # models.py 파일의 Country class import 선언

from django.http import HttpResponseRedirect  # templates html 사용 안함.
from django.urls import reverse  # parameter를 url의 형태로 조합


# Create your views here.
# http://127.0.0.1:8000 --> /ais/templates/index.html
def index(request):
    return render(request, 'index.html')

def add(request, su1, su2):
    calc = Calc() # 객체 생성
    res = calc.add(su1, su2) # add 메소드 호출

    # 출력 페이지로 보낼 값들을 {}블럭에 선언
    return render(request, 'calc/add.html', {'su1':su1, 'su2': su2, 'res':res})

def sub(request, su1, su2):
    calc = Calc()
    res = calc.sub(su1, su2)
    return render(request, 'calc/sub.html', {'su1':su1, 'su2': su2, 'res':res})

def mul(request, su1, su2):
    calc = Calc()
    res = calc.mul(su1, su2)
    return render(request, 'calc/mul.html', {'su1':su1, 'su2': su2, 'res':res})

def div(request, su1, su2):
    calc = Calc()
    res = calc.div(su1, su2)
    return render(request, 'calc/div.html', {'su1':su1, 'su2': su2, 'res':res})

def country_form(request):
    # 출력 페이지로 보낼 값을 {.....} 블럭에 선언
    return render(request, 'country/form.html', {})

def country_proc(request):
    country = Country()
    drink = request.GET['drink']  # form get, drink라는 키에 대한 값을 가져옴
    life = request.GET['life']
    cousin = request.GET['cousin']
    trip = request.GET['trip']
    house = request.GET['house']
    land = request.GET['land']

    data = drink + "," + life + "," + cousin + "," + trip + "," + house + "," + land
    # print('views.py', data)
    pct, res = country.country(data) # 모델 사용

    pct = round(pct, 1) # 소수 첫째자리까지 반올림

    return render(request, 'country/proc.html', {'data': data, 'pct':pct, 'res': res})

# JSP -> Django(데이터 수신, 모델 사용하여 결과 산출), html template 필요 없음.
def to_django(request):
    ai = Country()
    drink = request.GET['drink']  # form get
    life = request.GET['life']
    cousin = request.GET['cousin']
    trip = request.GET['trip']
    house = request.GET['house']
    land = request.GET['land']

    data = []
    data.append(str(drink))
    data.append(str(life))
    data.append(str(cousin))
    data.append(str(trip))
    data.append(str(house))
    data.append(str(land))

    # print(data)
    data2 = ",".join(data)
    # print(data2)

    pct_res = ai.country(data2)

    pct = round(pct_res[0], 1)  # 소수 첫째자리까지 반올림
    res = pct_res[1] # 결과
    # return HttpResponseRedirect(reverse(urls 파일의 path name, args = (보낼 데이터...)))
    return HttpResponseRedirect(reverse('country/to_jsp', args=(drink, life, cousin, trip, house, land, pct, res)))

# django -> jsp로 결과 전송
def to_jsp(request, drink, life, cousin, trip, house, land, pct, res):
    return render(request, 'country/to_jsp.html', {'drink': drink, 'life': life, 'cousin':cousin, 'trip':trip, 'house': house,'land':land, 'pct':pct, 'res':res }) # to_jsp 파일에서 리다이렉트해줌

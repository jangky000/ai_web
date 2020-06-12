# 2.Jupyter Notebook에서 Matplotlib package를 설치하는 스크립트를 제작하시오.
get_ipython().system('pip install matplotlib')

# 3.Matplotlib package의 한글 깨짐을 방지하는 스크립트를 제작하시오.
import os
import csv
# 한글 깨짐 방지
import numpy as np # 배열 기반 데이터 처리 패키지, 선형대수(행렬) 처리
import matplotlib  # 시각화 패키지
import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_name = font_manager.FontProperties(fname="C:/Windows/Fonts/malgun.ttf").get_name()
# windows 10
# font_name = font_manager.FontProperties(fname="C:/Windows/Fonts/malgunsl.ttf").get_name()
rc('font', family=font_name)           # 맑은 고딕 폰트 지정
plt.rcParams["font.size"] = 12         # 글자 크기
# plt.rcParams["figure.figsize"] = (10, 4) # 10:4의 그래프 비율
plt.rcParams['axes.unicode_minus'] = False  # minus 부호는 unicode 적용시 한글이 깨짐으로 설정
# Jupyter에게 matplotlib 그래프를 출력 영역에 표시할 것을 지시하는 명령
get_ipython().run_line_magic('matplotlib', 'inline')

# 4. Matplotlib package의 색상 값 을 출력하는 스크립트를 제작하시오.
matplotlib.colors.cnames

# 5. Tick 레이블 출력을 위해 0부터 100까지 생성하는 스크립트를 제작하시오.
yticks = [i for i in range(101)] # 0~100

# 지역별 데이터 추출
f = open('./illegal_parking.csv', 'r', encoding='utf-8')
data = csv.reader(f, delimiter=",")
header = next(data)
location = {}
for row in data:
    if row[1] in location:
        location[row[1]] += 1
    else:
        location[row[1]] = 1
print(location)
f.close()

# 6. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 선(plot) 그래프를 제작하시오.
xdata = list(location.keys())
ydata = list(location.values())
yticks = [i for i in range(0, 20000, 1000)] # 0~100
plt.xlabel('단속 지역')   # x축에 대한 label
plt.ylabel('건수')
plt.plot(xdata, ydata, label='단속 건수', c='lightseagreen')
plt.xticks(rotation=45) # x 눈금 label 값의 범위 내
plt.legend()
plt.grid(True)
plt.title('2019년도 은평구 지역별 불법 주차 단속 총 현황')
plt.savefig('./plot1.png')
plt.show()

# 7. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 막대(bar) 그래프를 제작하시오.
# xticks = [i for i in range(min(x), max(x)+1, 10)]
# yticks = [i for i in range(min(y), max(y)+1,50)]
plt.figure(figsize=(16,5))
plt.bar(xdata, ydata, color='lightseagreen', label='단속건수')
plt.ylim(min(ydata)-1, max(ydata)+1000)
plt.title('2019년도 은평구 지역별 불법 주차 단속 총 현황')
plt.xlabel('단속 지역')
plt.ylabel('건수')
# plt.xticks(xticks)
# plt.yticks(yticks)
plt.legend()
plt.grid(True)
plt.savefig('./bar.png')
plt.show()

# 8. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 원(pie) 그래프를 제작하시오.
plt.figure(figsize=(20, 10))
# autopct='%.1f%%': pie 챠트의 값 출력 형식
# 수평 분할
# plt.pie(area, colors=color, labels=label, autopct='%.1f%%')
# 수직 분할, startangle=90: 시작각이 오른쪽 기준 90도
plt.pie(ydata, labels=xdata, autopct='%.1f%%',
        startangle=90) # 90도부터 시작
plt.title('2019년도 은평구 지역별 불법 주차 단속 총 현황')
plt.legend()
plt.savefig('./pie.png')
plt.show()            

# 1월 2월 지역별 단속 데이터 추출
f = open('./illegal_parking.csv', 'r', encoding='utf-8')
data = csv.reader(f, delimiter=",")
header = next(data)
jan = {}
feb = {}
# 초기화
for loc in location:
    jan[loc] = 0
    feb[loc] = 0
for row in data:
    month = row[0].split('-')[1]
    if month == '01':
        jan[row[1]] += 1
    elif month == '02':
        feb[row[1]] += 1
print(jan)
print(feb)
f.close()

# 9. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 산점도(scatter) 그래프를 제작하시오.
plt.scatter(list(jan.values()), list(feb.values()), label='단속수') # x, y, label 
# 기울기를 통해서 어느 성별의 비율이 더 많은지 알 수 있다.
plt.title('은평구 지역별 1월 2월 불법 주차 단속 비교')
plt.xlabel('지역별 1월')
plt.ylabel('지역별 2월')
plt.legend()
plt.colorbar()
plt.grid(True)
plt.plot(range(max(list(jan.values()))), range(max(list(jan.values()))), 'g') # 남자 기준 추세선
# plt.ylim(0, 900)
plt.savefig('./scatter.png')
plt.show()            


# 6. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 선(plot) 그래프를 제작하시오.
janxdata = list(jan.keys())
janydata = list(jan.values())
febxdata = list(feb.keys())
febydata = list(feb.values())
yticks = [i for i in range(0, 20000, 1000)] # 0~100
plt.xlabel('단속 지역')   # x축에 대한 label
plt.ylabel('건수')
plt.plot(janxdata, janydata, label='1월 단속 건수', c='lightseagreen')
plt.plot(febxdata, febydata, label='2월 단속 건수', c='tomato')
plt.xticks(rotation=45) # x 눈금 label 값의 범위 내
plt.legend()
plt.grid(True)
plt.title('2019년도 1월,2월 은평구 지역별 불법 주차 단속 현황')
plt.savefig('./plot2.png')
plt.show()

# 10. 준비된 데이터에 대하여 임의의 조건을 만들어 분석된 데이터를 바탕으로 100자이상의 스토리텔링을 작성하시오(100자 넘어야 점수 부가).

'''
분석: 
  2019년도 은평구 내에서 불법 주차가 가장 많이 적발된 3지역은 응암동, 진관동, 갈현동이다.
이 세 지역은 2019년 1년간 은평구 내에서 차량이 가장 많이 모이는 지역이며, 주차공간이 가장 부족한 지역일 것으로 판단된다. 
  1월과 2월의 지역별 불법 주차 적발 횟수를 비교해보면, 1월의 적발 횟수가 전반적으로 더 많은 것을 볼 수 있다. 이는 연초 다양한 행사로 인한 것으로 보인다. 특히 응암동에서 2월과 비교해 가장 많은 단속이 이루어졌는데, 응암동이 은평구의 교통의 요지이며, 불광천을 따라 조성된 카페거리와 맛집이 있기 때문이라 판단된다.

결론: 
  은평구에서 약속이 있다면 응암동으로 가는 것이 좋다. 단속이 잦고 주차공간이 부족하므로 차는 두고 가는 것을 추천한다.
'''

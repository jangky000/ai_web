from django.db import models

# Deep learning packages
import os
# 일부 버전에서 에러가 표시되나 정상 처리됨.
from tensorflow.keras.models import load_model
import numpy as np

# Create your models here.

class Calc:
    def add(self, su1, su2):
        self.res = su1 + su2
        return self.res

    def sub(self, su1, su2):
        self.res = su1 - su2
        return self.res

    def mul(self, su1, su2):
        self.res = su1 * su2
        return self.res

    def div(self, su1, su2):
        self.res = 999
        if su2 !=0:
            self.res = su1 / su2
        return self.res


class Country:
    def country(self, data):  # self: 함수와 객체 연결
        print('data:', data)
        # self.res = data
        # data 형식: "0,0,0,5,1,0,0"
        data = np.array(data.split(','), dtype=float)
        # print('변환된 data:', data)

        # ★ 표준화하여 학습한 모델임으로 데이터도 표준화(z)해서 사용 ★
        # 0행  m: 0.8  std: 1.0295630140987002
        # 1행  m: 0.39 std: 0.4877499359302879
        # 2행  m: 0.66 std: 0.4737087712930805
        # 3행  m: 7.32 std: 2.842111890830479
        # 4행  m: 0.92 std: 0.2712931993250107
        # 5행  m: 1190.0 std: 1238.5071659057933
        data[0] = (data[0] - 0.8)/1.0295630140987002
        data[1] = (data[1] - 0.39) / 0.4877499359302879
        data[2] = (data[2] - 0.66) / 0.473708771293080
        data[3] = (data[3] - 7.32) / 2.842111890830479
        data[4] = (data[4] - 0.92) / 0.2712931993250107
        data[5] = (data[5] - 1190.0) / 1238.5071659057933

        # 2차원 배열로 변환
        x_data = np.array([
            data,
        ])

        # 절대 경로 사용
        path = os.path.dirname(os.path.abspath(__file__)) # 스크립트파일의 절대경로
        print('path', path)

        # model 이 있는 경로: C:/ai_202002/ws_python/notebook/machine/country/country3.h5
        # model = load_model("C:/ai_202002/ws_python/ai/ais/AI_models/country3.h5")
        model = load_model(os.path.join(path, 'AI_models/Country3.h5'))

        yp = model.predict(x_data[0:1])  # 모델 사용, 1건의 데이터
        # y_predict = model.predict(x_data)  # 1건의 데이터

        for i in range(len(x_data)):
            # print('적응 확률:', yp[i][0] * 100, ' %')
            pct = yp[i][0] # 예측 결과는 2차원 배열로 리턴됨
            print('적응 확률: {0:.3f}%'.format(pct * 100))

            if pct >= 0.8:
                print('귀농가능합니다.')
                self.res = '귀농가능합니다.'
            elif pct >= 0.5:
                print('귀촌을 권장합니다.')
                self.res ='귀촌을 권장합니다.'
            else:
                print('귀농／귀촌을 권장하지 않습니다.') # 전달 시 기호 '／'로 변환하여 전달
                self.res ='귀농／귀촌을 권장하지 않습니다.'

        return pct * 100, self.res  # pct, res
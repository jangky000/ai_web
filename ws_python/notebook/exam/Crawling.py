#!/usr/bin/env python
# coding: utf-8

# In[ ]:





# In[1]:


# 1.Jupyter Notebook에서 ai 가상환경에서 Beautifulsoup package를 설치하는 스크립트를 작성하시오.
get_ipython().system('pip install beautifulsoup4 ')


# In[2]:


# 2.Jupyter Notebook에서 ai 가상환경에서 Selenium package를 설치하는 스크립트를 작성하시오.
get_ipython().system('pip install selenium')


# In[4]:


# 3.자신의 관심 분야에 해당하는 웹사이틀를 선정하고 Chromedriver로 페이지를 open하는 스크립트를 작성하시오.
# https://www.siheung.go.kr/corona_policy.jsp
from bs4 import BeautifulSoup
from selenium import webdriver
import time

driver = webdriver.Chrome('C:/ai6/chromedriver.exe')

driver.get("https://www.siheung.go.kr/corona_policy.jsp")
time.sleep(2) # 2초 대기


# In[5]:


# 4.자신의 관심 분야에 해당하는 웹사이트를 선정하고 Chromedriver로 페이지를 open하여 Beautifulsoup 객체를 생성하는 스크립트를 작성하시오.
from bs4 import BeautifulSoup
from selenium import webdriver
import time

driver = webdriver.Chrome('C:/ai6/chromedriver.exe')

driver.get("https://www.siheung.go.kr/corona_policy.jsp")
time.sleep(2) # 2초 대기

driver.maximize_window() # 창 크기 최대화

bs = BeautifulSoup(driver.page_source, 'html.parser')


# In[ ]:


# 5. 4번의 스크립트를 함수로 작성하시오.
# - 함수명 getbs는 사용 할 수 없음
from bs4 import BeautifulSoup
from selenium import webdriver
import time

driver = webdriver.Chrome('C:/ai6/chromedriver.exe')

def openBS():
    try:
        driver = webdriver.Chrome('C:/ai6/chromedriver.exe')
        driver.get("https://www.siheung.go.kr/corona_policy.jsp")
        time.sleep(2) # 2초 대기
        driver.maximize_window() # 창 크기 최대화
        bs = BeautifulSoup(driver.page_source, 'html.parser')
    except Exception as e:
        # 페이지 url이 없는 경우
        print(e)
        return None # 처리 종료
    else:
        # 예외가 발생하지 않았다면
        return bs


# In[14]:


# 6. find 함수를 사용한 예를 작성하시오.
patient = bs.find('ul', {'class': 'info_s'})
print(patient)


# In[15]:


# 7. find_all 함수를 사용한 예를 작성하시오.
patients = bs.findAll('ul', {'class': 'info_s'})
print(patients)


# In[31]:


# 8. select 함수를 사용한 예를 작성하시오.
# corona-area > div:nth-child(1) > a > ul > li:nth-child(1) > span
patient_no = bs.select('#corona-area > div:nth-child(1) > a > ul > li:nth-child(1) > span')[0].text
print(patient_no)


# In[39]:


# 9. 이미지를 다운로드하는 스크립트를 작성하시오.
from bs4 import BeautifulSoup     
from selenium import webdriver
import os
import urllib

base_url = 'https://www.siheung.go.kr'
sub_url = bs.select('body > section > div.top_wrap > div.intro_tt > div > img')[0]['src']
url = base_url+sub_url
url

f_dir = 'C:/ai6/ws_python/notebook/exam/'
os.chdir(f_dir)

try:
    urllib.request.urlretrieve(url, '시흥시코로나비상대책배너.jpg') # 이미지 다운로드
    print('다운로드 완료')
except Exception as e:
    print(e)


# In[41]:


# 10. Spring으로 개발된 resort 웹사이트에서 파일을 다운로드하는 스크립트를 제작하시오.

# url
url = 'http://172.16.12.101:9090/ojt/contents/read.do?contentsno=47'

# 저장 경로
f_dir = "C:\\ai6\\ws_python\\notebook\\exam\\";

# 옵션 설정
options = webdriver.ChromeOptions()

path = "C:/ai6/chromedriver.exe"
driver = webdriver.Chrome(path,options=options)

# 브러우저 인식 파일(pdf. jpg...) 파일을 바로 열지말고 다운로드 받도록 지정
options.add_experimental_option("prefs", {
      "download.default_directory": f_dir,
      "download.prompt_for_download": False,
      "plugins.always_open_pdf_externally": True
})

# 다운로드 폴더 설정
driver.command_executor._commands["send_command"] = ("POST", '/session/$sessionId/chromium/send_command')
params = {'cmd': 'Page.setDownloadBehavior', 'params': {'behavior': 'allow', 'downloadPath': f_dir}}
command_result = driver.execute("send_command", params)

driver.get(url)
time.sleep(5)

# 링크 찾아서 클릭
# body > div > div.row > div.col-md-10.cont > div > form > fieldset > ul > li:nth-child(6) > div:nth-child(2) > a
driver.find_element_by_css_selector('body > div > div.row > div.col-md-10.cont > div > form > fieldset > ul > li:nth-child(6) > div:nth-child(2) > a').click()


# In[ ]:





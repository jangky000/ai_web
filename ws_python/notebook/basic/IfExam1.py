#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# console 에서의 입력처리
import sys

filename = sys.argv[0]
print('파일명: ' + filename)
# python IfExam1.ipynb  # ERROR
# python IfExam1.py 100


# In[ ]:


print(type(sys.argv[1]))
su = int(sys.argv[1])  # 문자열을 정수로 형변환
print('입력수:', su)


# In[ ]:


if su % 2 == 0 and su % 3 == 0 and su % 4 == 0:
    str1 = '2,3,4의 배수'
else:
    str1 = '2,3,4의 배수 아님'

print(str1)


# In[ ]:





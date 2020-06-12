#!/usr/bin/env python
# coding: utf-8

# In[3]:


def absolute(num):
    return num if num >= 0 else -num


# In[4]:


# import 시에는 실행이 안되고 자체 실행시에만 실행 가능하도록 설정
# print(__name__) # 자체 실행: __main__, import시는 Lib
# print(absolute(-100))
if __name__ == '__main__':
    print(absolute(-100))


# In[ ]:





# In[ ]:





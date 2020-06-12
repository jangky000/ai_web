#!/usr/bin/env python
# coding: utf-8

# In[1]:


def roundsu(su1):
    su1 = su1 + 0.5
    return str(int(su1))

def tot(*args): # 가변 인수, 전달받은 수의 합계
    tot = 0
    for su in args:
        tot = tot + su

    return tot


# In[2]:


if __name__ == '__main__': # import 시에는 실행되지 않음.
    print(roundsu(10.4))
    print(roundsu(10.5))
    print(tot(10, 20, 30))


# In[ ]:





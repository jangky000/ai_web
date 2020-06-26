#!/usr/bin/env python
# coding: utf-8

# In[14]:


# 1. Jupyter Notebook에서 ai 가상환경에서 pymongo package를 설치하는 스크립트를 작성하시오.
get_ipython().system('pip install pymongo')


# In[30]:


# 2. Mongodb 상에 임의의 database, collection에 접속하는 Python 스크립트를 작성하시오.
import pymongo
connection = pymongo.MongoClient("localhost", 27017)
db = connection.exam1 # 데이터베이스 선택, 없으면 자동으로 생성
collection = db.store # collection 테이블, 없으면 자동 생성


# In[31]:


# 3. 여러개의 document를 추가하는 Python 스크립트를 작성하시오.
collection.insert([{'name': '호반정', 'taste': 10, 'service': 9},
                   {'name': '시스스시', 'taste': 8, 'service': 8},
                   {'name': '자금성', 'taste': 7, 'service': 10},
                   {'name': '유진식당', 'taste': 8, 'service': 6},
                   {'name': '피맛골', 'taste': 7, 'service': 10}])


# In[32]:


# 4. document 전체 목록을 출력하는 Python 스크립트를 작성하시오.
docs = collection.find()
for doc in docs:
    print(doc)


# In[33]:


# 5. 검색 조건은 임의로 지정하고 document를 검색하는 Python 스크립트를 작성하시오.
docs = collection.find({'taste':{'$gte':8}, 'service': {'$gte':8}})
for doc in docs:
    print(doc)


# In[34]:


# 6. document를 조회하는 Python 스크립트를 작성하시오.
docs = collection.find({'name':{'$eq':'호반정'}})
for doc in docs:
    print(doc)


# In[35]:


# 7. document를 수정하는 Python 스크립트를 작성하시오.
collection.update({'name':'호반정'}, {'name':'호반정', 'taste':10, 'service':10})


# In[36]:


docs = collection.find()
for doc in docs:
    print(doc)


# In[37]:


# 8. document를 삭제하는 Python 스크립트를 작성하시오.
collection.remove({'name':'호반정'})

docs = collection.find()
for doc in docs:
    print(doc)


# In[38]:


# 9. 저장된 collection을 Pandas DataFrame으로 변환하는 Python 스크립트를 작성하시오.
import pandas as pd
# mongodb에서 읽어온 데이터를 DataFrame으로 변경
docs = collection.find()
df = pd.DataFrame(list(docs), columns=['name', 'taste', 'service'])
df


# In[39]:


df['mean'] = (df['taste'] + df['service'])/2
df['rank'] = df['mean'].rank(method='min')
df


# In[40]:


# 10. 저장된 collection을 Pandas DataFrame으로 변환 후 임의의 계산 결과를 만들어 Dataframe에 컬럼을 추가하고 다시 새로운 Collection에 저장하는 Python 스크립트를 작성하시오. 
import json
# pandas -> mongodb:data1 database, dev_out collection insert
records = json.loads(df.T.to_json()).values()
db.store_out.insert(records) # ObjectId 리턴


# In[ ]:





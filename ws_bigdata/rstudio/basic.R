
# 경고 메시지 숨기기
old <- getOption('warn') # default: 0, <-: 할당, =보다 <-를 더 많이 사용
print(old)
options(warn = -1)

var1 <- 0
print(var1)
var1 = 1
print(var1)

name <- "아로미" # 데이터 타입이 없음
print(name)

bol <- TRUE # 대문자만 가능, 대소문자 구분
print(bol)
# bol <- false 
# Error in eval(expr, envir, enclos): 객체 'false'를 찾을 수 없습니다
bol <- FALSE
print(bol)

sum(10, 20, 30) # 60
sum(10, 20, 30, NA) # NA: not available: 사용할 수 없다.(null)
#결과: <NA>
sum(10, 20, 30, NA, na.rm=T) # NA 제거 TRUE 
# 결과: 60

ls() # 메모리에 올라간 변수의 목록

print(type(bol))
# Error in type(bol): 함수 "type"를 찾을 수 없습니다

# 데이터 타입의 확인, type은 쓸 수 없다.
is.character(name) # 문자냐, TRUE
is.numeric(var1) # 숫자냐, TRUE
is.logical(bol) #boolean이냐 TRUE
is.na(var1) #NA냐 FALSE
mode(var1) # 데이터의 형태: 'numeric'
class(var1) # R자료구조 타입: 'numeric'

# vector의 생성: 특정한 속성에 속한 값들의 배열, DBMS의 칼럼들
x <- c(1, 2, 3)
print(x)
x <- c(1,2,"3") # 요소 중에 문자열이 있으면 전부 문자열로 변경되어 출력
print(x)

mat <- c(60, 70, 80, 90, 60)
print(mat) # 60 70 80 90 60

table(mat) # 빈도 분석
# mat
# 60 70 80 90 
#  2  1  1  1 
mode(mat) # 'numeric'
class(mat) # 'numeric'

grade = c("A", "B", "C", "A", "B")
grade
table(grade)
# grade
# A B C 
# 2 2 1
mode(grade) # 'character'
class(grade) # 'character'

library(repr) #repr 라이브러리 사용
options(repr.plot.width=3, repr.plot.height=3) # plot 크기 inch 지정

# plot(grade) # grade는 vector(데이터의 나열) 타입이기 때문에 에러
# Error in plot.window(...): 유한한 값들만이 'ylim'에 사용될 수 있습니다
plot(table(grade))

is.factor(grade) # FALSE
# factor: 그룹화가 가능한 데이터의 나열

fgrade <- as.factor(grade) # vector ->factor로 변환
mode(fgrade) # 'numeric'
class(fgrade) # 'factor'

plot(fgrade)

area = c('서울', '경기', '강원', '서울', '경기')
farea = as.factor(area)
table(farea)
plot(farea)
# farea
# 강원 경기 서울 
#    1    2    2 

#y: 년도가 2자리인경우 소문자 y
date <- as.Date("19/05/29", "%y/%m/%d")  
print(date) # "2019-05-29"
print(mode(date)) # "numeric"
print(class(date)) # "Date"
date <- as.Date("19/05/29", "%Y/%m/%d")  
print(date) # "0019-05-29"
print(mode(date)) # ""numeric"
print(class(date)) # "Date"

date <- as.Date("2019/05/29", "%y/%m/%d") 
print(date) #  NA: 4 자리의 년도에 소문자 y를 쓰면 안됨
print(mode(date)) # "numeric"
print(class(date)) # "Date"
date <- as.Date("2019/05/29", "%Y/%m/%d") 
print(date) # "2019-05-29"
print(mode(date)) # "numeric"
print(class(date)) # "Date"

#y: 년도가 4자리인경우 대문자 Y
# 존재하지 않는 날짜: NA 출력
dates <- c('2019/02/28', '2019/02/29', '2019/03/01') 
dates <- as.Date(dates, "%Y/%m/%d")
dates # 2019-02-28 <NA> 2019-03-01, 없는 날짜 -> NA
dates <- c('2020/02/28', '2020/02/29', '2020/03/01') 
dates <- as.Date(dates, "%Y/%m/%d")
dates # 2020-02-28 2020-02-29 2020-03-01

# Sys.date()  # ERROR
time <- Sys.time()
print(time) # "2020-05-26 16:41:15 KST" : 한국 시간: korean standard time
print(mode(time)) # "numeric"
print(class(time)) # "POSIXct" "POSIXt" 
  

today <- strptime(time, format="%Y-%m-%d")
today # "2020-05-26 KST"
today <- strptime(time, format="%Y-%m-%d %H:%M:%S")
today # "2020-05-26 16:41:15 KST"

# 도움말
# help(sum)
# ?sum
# args(sum)
# example(sum)

# 마지막 숫자가 포함됨: 
# 보통의 프로그래밍 언어는 마지막 값(last max value)을 포함하지 않음
sum(1:5) # 15
sum(1, 2, 3, 4, 5) # 15
sum(1:2, 3:5) # 15
sum(1:5, NA) # <NA>
sum(1:5, NA, na.rm = TRUE) # 15, NA remove

getwd()
# 'C:/ai6/ws_bigdata/notebook/core'

# 파일 읽기, 한글 깨지지 않게 utf-8 설정
pay <- read.csv('./files/pay.csv', 
                fileEncoding='utf-8', encoding='utf-8')
pay
# 성명	급여	경력
# 왕눈이	1800000	1
# 아로미	2000000	2
# 홍길동	2500000	3
# 가길순	3000000	5
# 나길순	3800000	9


# 기본 입출력 폴더 설정
setwd('C:/ai6/ws_bigdata/notebook/core/files')
pay <- read.csv('pay.csv', 
                fileEncoding='utf-8', encoding='utf-8')
pay
# 성명	급여	경력
# 왕눈이	1800000	1
# 아로미	2000000	2
# 홍길동	2500000	3
# 가길순	3000000	5
# 나길순	3800000	9

























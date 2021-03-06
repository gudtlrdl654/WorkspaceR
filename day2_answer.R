#
# day2_answer.R
#
# 2일차 Vertor 실습
#
#문1) 
d1 <- 1:50
d2 <- 51:100

#1. d1, d2값 출력 - print(d1) 으로 해도 결과는 나온다 
d1
d2

#2. d2 길이 출력 
length( d2 )

#3. d1 + d2, d2 - d1, d1 * d2, d2 / d1의 결과 출력
d1 + d2
d2 - d1
d1 * d2
d2 / d1 

#4. d1, d2 각각의 합 출력
sum( d1 )
sum( d2 )

#5. d1, d2의 모든 값들의 합 출력 - 유지 보수성 생각해 볼 것 
sum( c( d1, d2 ) )                # 방법 1
sum( d1 ) + sum( d2 )             # 방법 2

#6. d2 최대값, 최소값 출력
max( d2 )
min( d2 )

#7. d2, d1의 각각의 평균값을 구한 후 평균과의 차이 출력
abs( mean( d2 ) - mean( d1 ) )

#8. d1 내림차순으로 정렬해서 출력
sort( d1, decreasing = TRUE )

#9. d1, d2  오름차순으로 정렬 후 각 10개씩을 추출하여 d3에 저장
d3 <- c( sort( d1 )[ 1:10 ], sort( d2 )[ 1:10 ] )
d3 


s1 <- sort( d1 )
s2 <- sort( d2 )
result <- c( s1[ 1:10 ], s2[ 1:10 ] )
result

#문2)
v1 <- 51:90

#1. 60보다 작은 수 모두 출력
v1[ v1 < 60 ]

#2. 70보다 작은 수가 몇 개인지 출력 - 벡터에서 길이는 갯수 
length( v1[ v1 < 70 ] )

#3. 65보다 큰 수들의 합 출력
sum( v1[ v1 > 65 ] )

#4. 60보다 크고 73보다 작은 수를 출력 - 모두 만족하는 경우 
v1[ v1 > 60 & v1 < 73 ]

#5. 65보다 작거나 80보다 큰 수를 모두 출력 - 또는 
v1[ v1 > 65 | v1 > 80 ]

#6. 7로 나누었을때 나머지가 3인 수를 모두 출력 - %% 나머지, == 각각 
v1[ v1 %% 7 == 3 ]

#7. 7의 배수들의 값을 0으로 변경 - 7로 나누었을 때 나머지가 0
v1[ v1 %% 7 == 0 ] <- 0
v1

v1 <- 51:90
#8. 짝수를 모두 합한 값을 출력 - 2로 나누었을 때 나머지가 0
sum( v1[ v1 %% 2 == 0 ] )

#9. 홀수이거나 80보다 큰 수를 모두 출력
v1[ v1 %% 2 == 1 | v1 > 80 ]

#10. 3과 5의 공배수 출력
v1[ v1 %% 3 == 0 & v1 %% 5 == 0 ]

#11. 짝수에 대해서만 2를 곱해서 저장
v1[ v1 %% 2 == 0 ] <- v1[ v1 %% 2 == 0 ] * 2
v1

#12. 7의 배수들을 제거한 후 v1 내용 출력 
v1 <- 51:90
v1 <- v1[ v1 %% 7 != 0 ]
v1

# & 와 &&, | 와 || 차이

vt <- c( TRUE, FALSE )
vt2 <- c( TRUE, TRUE )

vt & vt2      # 벡터 요소 각각에 대하여 AND 연산 수행
vt && vt2     # 벡터 첫번째 요소에 대하여 AND 연산 수행 - 나머지에 상관없이 첫번째 걸로 계산 , 많이 사용  

#
# ()와 []의 차이
#
# () : 1. 연산식에서 우선순위 변경 목적 2. 함수에서 인수 전달 - 모든 함수는 ()가 있어야 함 
# [] : 벡터, 리스트, 메트릭스, 데이터프레임에서 요소를 지정하는 목적 










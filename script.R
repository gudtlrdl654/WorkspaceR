#
# vector
#
v <- 1:10

v > 5
all( v > 5 )    # 벡터의 모든 요소가 조건에 만족하는가?
any( v > 5 )    # 벡터의 요소중 조건에 만족하는게 있는가? 

head( v )       # 처음부터 일정 개수( default : 6개 )
tail( v )       # 끝에서부터 일정 개수( default : 6개 )
head( v, 3 )
tail( v, 3 )

#
# 집합( set ) : 중복 데이터가 없는 벡터 
#
x <-  c( 1, 2, 3 )
y <-  c( 3, 4, 5 )
z <-  c( 3, 1, 2 )

union( x, y )          # 합집합
intersect( x, y )      # 교집합
setdiff( x, y )        # 차집합
setequal( x, y )       # 동일한 요소가 있는가 확인 


#
# 2.1 List p. 75~76
#
# List : 동일 자료형, 다른 자료형을 저장할 수 있는 벡터 - 벡터와 다른 점 : 각 파일마다 이름을 지정  / 값만 쓰고 싶으면 [] 2개 쓰기 
# 벡터는 동일 자료형 
#
# Key(이름) = Value(값)  / $name = key , [1] = 값
#
# List() : List 생성 함수 
#          요소는 key( 이름 ) = Value( 값 ) 형식이다. 
#
v <-  c( 90, 85, 70, 84 )
l <-  list( name = 'hong', age = 30, status = TRUE, score = v )
l

l[ 1 ]
l[ 4 ]

l[[ 1 ]]
l[[ 4 ]]
l[[ 4 ]][ 1 ]

l$name         # $는 이름으로 접근할 때 사용 
l$score


#
# 2.2 factor( 범주형, categorical ) p.60
#
# factor 형 : 문자 형태로 저장되며 범위를 갖는 값을 저장하는 data type / 값 하나하나를 구할 땐 불편 
#
# factor() : 팩터형 벡터 생성 함수 
bt <-  c( 'A', 'B', 'B', 'O', 'AB', 'A' )     # 문자형 벡터
bt.factor <- factor( bt )                     # 팩터형 벡터 Levels = 나올 수 있는 값의 범위 / 범위가 있는 값 = 팩터 ---> 해당 팩터 타입이 갖을 수 있는 값의 종류 / 나중에 변할 때 순서가 된다 

bt
bt.factor

gender <-  c( '남', '여', '여', '남', '남', '여', '여', '남' )
gender.factor <- factor( gender )

gender
gender.factor


bt[ 3 ]
bt.factor[ 3 ]

gender[ 5 ]
gender.factor[ 5 ]

levels( bt.factor )
levels( gender.factor )

as.integer( bt.factor )
as.integer( gender.factor )

gender.factor[ 5 ]
gender.factor[ 5 ] <- '중'
gender.factor


#
# 2.3 matrix( 행렬, 2차원 배열 ) : 동일 자료형의 데이터를 저장하는 집합
#
# row( 행 ), observation( 관측값 ), data( 값 )
# column( 열 ), variable( 변수 )
#
#matrix() : matrix 생성 함수 
#
z <- matrix( 1:20, nrow = 4 )     # 열우선  / 디폴트 기본 동작 / dim() : 몇 행 몇 열 인지 알고 싶을 때 
z
class( z )
str( z )
dim( z )

z <- matrix( 1:20, nrow = 4, ncol = 5 )
z

z <- matrix( 1:20, nrow = 4, ncol = 5, byrow = T )    # 행우선 byrow 안하면 디폴트는 열우선 
z

x<- 1:4
y<- 5:8
z <- matrix( 1:20, nrow = 4, ncol = 5 )

m1 <- cbind( x, y )    # 열우선  bind = 연결 cbind = 변수로
m1
m2 <- rbind( x, y )    # 행우선              rbind = 관측치로 
m2
m3 <- rbind( m2, x )
m3
m4 <- cbind( z, x )
m4

#
# matrix에서 cell의 값 읽기
z[ 2, 3 ]
z[ 1, 4 ]
z[ 2, ]           # 생략하면 전체 / 2행의 전체 
z[ ,4 ]           #                 4열의 전체 

z[ 2, 1:3 ]
z[ 1, c( 1, 2, 4 ) ]
z[ 1:2, ]
z[ , c( 1,4 ) ]


#
# matrix 행/열에 이름 지정 
#
score <- matrix( c( 90, 85, 69, 78,
                    85, 96, 49, 95,
                    90, 80, 70, 70 ),
                 nrow = 4, ncol = 3)
score

rownames( score ) <- c( 'hong', 'kim', 'lee', 'yoo' )   # 행이름
colnames( score ) <- c( 'english', 'math', 'science' )  # 열이름 
score

score[ 'hong', 'math' ]
score[ 'kim', c( 'math', 'science' ) ]
score[ 'lee', ]
score[ , 'english' ]

rownames( score )
colnames( score )
colnames( score )[ 2 ]

c <- colnames( score )   # 다양한 표현을 보는 습관이 중요 / 한번에 이해가 안되면 나눠서 보기 
c[ 2 ]




#
# 2.4 data frame
#
# data frame : matrix와 동일한 구조를 갖으며 자료형에 구애받지 않고 저장하는 matrix
#
# data,frame() : data frame을 생성하는 함수
#
city <- c( 'soul', 'busan', 'daejeon' )      # 변수의 data type이 다르면 data frame / 같으면 matrix
rank <- c( 1, 2, 3 )
city.info <- data.frame( city, rank )
city.info

class( city.info )
str( city.info )
dim( city.info )

name <- c( 'hong', 'kim', 'lee' )                 # 앞으로 자주 사용할 데이터 프레임 
age <- c( 22, 20, 25 )
gender <- factor( c( 'm', 'f', 'm' ) )
blood.type <- factor( c( 'a', 'o', 'b' ) )

person.info <- data.frame( name, age, gender, blood.type )
person.info

str( person.info )


#
# data frame 요소 읽기 
#
city.info[ 1, 1 ]
city.info[ 1, ]
city.info[ ,1 ] 
city.info[ city.info$city == 'seoul' ]
city.info[ , 'rank' ]

person2.info <- data.frame( name = c( 'hong',  'kim', 'lee'),
                            age = c( 22, 20, 25 ),
                            gender = factor( c( 'm', 'f', 'm' ) ),
                            blood = factor( c( 'a', 'o', 'b' ) ) )
person2.info

person.info$name
person.info[ person.info$name == 'hong', ]
person.info[ person.info$name == 'hong', c( 'name', 'age' ) ]

data()

iris
head( iris )
tail( iris )

class( iris )   # data의 모양과 변수를 확인 / 습관적으로 반복적으로 할것 
str( iris )     # 각 변수들이 어떤 타입을 갖고 있는 지 확인 - 가장 중요 
dim( iris )


iris[ , c( 1:2 ) ]
iris[ , c( 1, 3, 5 ) ]
iris[ ,  c( 'Sepal.Length', 'Species' )]
iris[ 1:5, ]
iris[ 1:5, c( 1, 3 ) ]


#
# matrix / dataframe 에서 사용하는 함수 
#
class( state.x77 )
class( iris )

dim( state.x77 )
dim( iris )

str( state.x77 )
str( iris )

nrow( state.x77 )
nrow( iris )

ncol( state.x77 )
ncol( iris )

head( state.x77 )
head( iris )

tail( state.x77 )
tail( iris )

unique( iris[ , 5 ] )   # 중복된 데이터를 배제하고 하나의 데이터 값만 볼때 사용하는 함수 : unique() / 숫자타입에선 사용x

table( iris[ , 5 ] )    # table() : 그룹별로 개수가 몇개인지 카운트 해주는 함수 = 도수분포표 
table( person.info[ , 'blood.type' ] )
table( person.info[ , 'gender' ] )

#
# matrix/data frame 산술 연산 함수 p. 94
#
colSums( iris[ , -5 ] ); apply( iris[ , 1:4 ], sum )        # 열별 합
colMeans( iris[ , -5 ] ); apply( iris[ , 1:4 ], 2, mean )   # 열별 평균
rowSums( iris[ , -5 ] ); apply( iris[ , -5 ], 1, sum )      # 열별 합 
rowMeans( iris[ , -5 ] ); apply( iris[ , -5 ], 1, sum )    # 열별 평균
apply( iris[ , -5 ], 2, median )                            # 열별 중앙값 apply()가 유연성이 높다 

sx <- state.x77
head( sx )
sx.t <- t( sx )      # 행과 열의 방향 전환, 전치 = t 
head( sx.t )

# 조건에 맞는 행과 열 추출( data frame만 가능 )
subset( iris, Species == 'setosa' )
subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 )

subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 )[ , c( 2,4 ) ]


#
# matrix/data frame 산술연산  
#
m1 <- matrix( 1:20, 4, 5 )
m1
m2 <- matrix( 21:40, 4, 5 )
m2

2 * m1
m2 - 5
2 * m1 + 3 - m2

m1 + m2    # 행열연산 
m2 - m1
m2 / m1
m1 * m2

#
# matrix를 data frame으로, data frame을 matrix로 변환 
#
st <- data.frame( state.x77 )
class( st )
str( st )
dim( st )

iris.m <- as.matrix( iris )    # as. 변환함수 
class( iris.m )
str( iris.m )
dim( iris.m )

# data type 확인 함수 : is
is.matrix( state.x77 )
is.matrix( iris.m )
is.data.frame( st )
is.data.frame( iris )

# p.60~76
# R 데이터 타입 : 숫자, 문자, 논리, factor, NULL, NA
#
# R에서 data 저장에 사용되는 요소 
#       -변수
#   # 1차원 배열 
#      - vector
#      - list 
#   # 2차원 배열 
#      - matrix
#      - data frame 

#
# 2.5 파일 읽기/쓰기
#
#
# csv file 내용 읽어서 data frame 생성 
#
air <- read.csv( 'C:\\workspace\\workspaceR\\airquality.csv', header = T )  # 변수 명 / 데이터로 안씀 
air2 <- read.csv( 'C:\\workspace\\workspaceR\\airquality.csv', header = F ) # 데이터로 쓰겠다 

class( air )
class( air2 )

str( air )
str( air2 )

dim( air )
dim( air2 )

air
air2 

# csv = Comma Seperator Velue  콤마로 구분했다 






#
# 변수명 / 표준 입력 / 표준 출력 
# 
# 변수명 부여 방식 - 변수명 시작은 항상 소문자로 / 파이썬에서도 통용 
numberValue <- 1                     # camel 표기법 - 낙타처럼 처음엔 소문자지만 중간 시작하는 문자부터 대문자 
str_value <- "R Language"            # snake 표기법 - 변수명엔 _ 많이 사용, 안정적 / 단어와 단어 사이를 _로 연결 
booleanvalue <- TRUE                # 일반 표기법  - 다 소문자, 단어 구분이 명확하지 않다는 단점, 의미 전달이 바로 안될 가능성O

# 표준 출력 장치에 출력 
# 
# print() : 자동 줄바꿈( \n, 자동 개행)
numberValue; print( numberValue )
str_value; print( str_value )
booleanvalue; print( booleanavalue )


# cat() : 여러 내용을 출력할 수 있고, 자동 줄바꿈이 일어나지 않는 표준출력 장치에 출력하는 함수 
#
# 제어 문자 : 화면에 출력되지 않고 기능을 수행하는 문자 
# \n : 개행 문자 (줄바꿈)
# \t : tab 문자 
cat( 'Numeric number : ', numberValue, '\n' )
cat( 'String : ', str_value, '\n' )
cat( 'Boolean value : ', booleanvalue, '\n' )
print( '----------------------------------------' )
cat( 'Numeric number : ', numberValue, '\t',
     'string: ', str_value, '\t',
     'Boolean value : ', booleanvalue, '\n')
cat( 'test' )


#
# 표준 입력 장치로 부터 입력 
#
# scan() : 표준 입력 장치로 부터 입력받는 함수              ----- 여러개를 입력할 수 있다 
# readLine() : 표준 입력 장치로 부터 입력 받는 함수         ----- 캐릭터로 받기 때문에 전환함수 as 사용 해야 함 
# edit() : 표준 입력 장치로 부터 표형식으로 입력 받는 함수 
# 
# 출력(output, print) : memory 내용울 output device에 전송 
# 입력(input) : input device에서 memory로 전송하여 기억 
# 표준입력 : stdin   -- 키보드 
# 표준출력 : stdout  -- 모니터 
# 표준 erroe 표시 : stderr
inputData <- scan() # 빈줄이 입력될 때 까지 숫자를 입력 받는다. / 기본적으로 list 형식으로 받음 
class( inputData )
inputData

inputData <- scan( what=character() )   # 문자 입력시 사용 
class( inputData )
inputData

inputData <- readline( 'inout data ->' )
class( inputData )
inputData

number1 <- readline( 'input number1 : ' )
number2 <- readline( 'input number2 : ' )
result <- as.numeric(number1) + as.numeric(number2)
result


# 
# 실습 문제 : 두 수를 받아서 다음과 같이 출력 
#      입력
#           Input number1 : [10]
#           Input number2 : [5]
#      출력 결과 
#           10 + 5 = 15
#           10 - 5 = 5
#           10 * 5 = 50
#           10 / 5 = 2 
#           10 %% 5 = 0 

number1 <- readline( 'Input number1 : ' )
number2 <- readline( 'Input number2 : ' )
result <- as.numeric(number1) + as.numeric(number2)
result <- as.numeric(number1) - as.numeric(number2)
result <- as.numeric(number1) * as.numeric(number2)
result <- as.numeric(number1) / as.numeric(number2)
result <- as.numeric(number1) %% as.numeric(number2)
result


number1 <- as.numeric( readline( 'Input number1 : ' ) ) 
number2 <- as.numeric( readline( 'Input number2 : ' ) ) 

resultAdd <- number1 + number2 
resultSub <- number1 - number2
resultMul <- number1 * number2
resultDiv <- number1 / number2
resultRem <- number1 %% number2

cat( number1, ' + ', number2 , ' = ', resultAdd, '\n',
     number1, ' - ', number2 , ' = ', resultSub, '\n',
     number1, ' * ', number2 , ' = ', resultMul, '\n',
     number1, ' / ', number2 , ' = ', resultDiv, '\n',
     number1, ' %% ', number2 , ' = ', resultRem, '\n')


#
# 2.1 Algoritm 이해 
#
# Algoritm( Logic ) : 문제를 해결하기 위한 일처리 순서 
#
# Algoritm 요건 
# 1. 입력 : 반드시 0개 이상의 입력이 있어야 한다. 
# 2. 출력 : 반드시 1개 이상의 출력이 있어야 한다.
# 3. 유한성 : 반드시 끝낼 수 있어야 한다. 
# 4. 효과성 : 효과적인 방법으로 정의되어야 한다. 
# 5. 명확성 : 명확한 방법으로 정의되어야 한다. 
#
# 컴퓨터 프로그램의 구조 
# 
# - 순차구조 : 시작부터 끝날때 까지 차례대로 수행 
# - 선택구조 : 조건에 따라 처리 방향을 바꾸어서 수행 
# - 반복구조 : 조건이 만족하는 동안 동일한 내용을 반복 수행 
# 
# 컴퓨터 프로그램은 알고리즘에 기반으로 기억장소 원리(mrmory의 읽기/쓰기)와 순차/선택/반복구조를 조합하여 작성한다. 
#
# 투박하더라도 나의 생각을 프로그래밍으로 만들 수 있을 정도는 되어야 한다. 
#
# 2.2 선택 구조 종류                 많이 사용한는 타입 = if
#   1. 단순 선택 구조 
#   2. 양자 택일 구조 
#   3. 다중 선택 구조 
#   4. 중첩 선택 구조 
#
# 1. 단순 선택 구조 
job.type <- 'A'
bonus <- 0
if ( job.type == 'A' ) {   # code block( code 집합 ) - 조건이 참이면 수행 
    bonus <- 200
}
cat( 'job.type : ', job.type, '\t\tbonus : ', bonus )

# 2. 양자 택일 구조 

job.type <- 'B'
bonus <- 0
if ( job.type == 'A' ) {   # code block( code 집합 ) 
    bonus <- 200
} else{      # else 조건이 거짓일 때 수행 / 줄 바꾸고 쓰지 말고 중괄호 끝나는 데 부터 한칸 띄고 바로 쓰기 
    bonus <- 100
}
cat( 'job.type : ', job.type, '\t\tbonus : ', bonus )

# 3. 다중 선택 구조 
score <- 50
if (score >= 90) {
    grade <- 'A'
} else if ( score >= 80 ) {
    grade <- 'B'
} else if ( score >= 70 ) {
    grade <- 'c'
} else if ( score >= 60 ) {
    grade <- 'D'
} else {
    grade <- 'F'
}
cat( 'score : ', score, '\t\tgrade : ', grade )

# 4. 중첩 선택 구조 - 알고리즘이 복잡하다 / 가능하면 중첩 구조가 안나오게 끔 알고리즘 짜는게 좋다 
a <- 2
b <- 1
c <- 3
if ( a > b ) {
    if ( a > c ) {
        max <- a
        if ( b > c ) {
            mid <-  b; min <-  c 
        } else {
            mid <-  c; min <-  b
        }
    } else if ( c > b ) {
        max <- c; mid <- a; min <- b
    }
} else if ( B > c ) {
    max <- b
    if ( a > c ) {
        mid <- a; min <- c
    } else { 
       mid <- c; min <- a
       }
}
cat( 'max : ', max, '\tmid : ', mid, '\tmin : ', min)

number <- 10
remainder <- number %% 2

if ( remainder == 0 ) {
    oddeven <- '짝수'
} else {
    oddeven <- '홀수'
}
cat( 'number : ', number, '는 ', oddeven, ' 이다.')


a <- 5
b <- 20

if ( a > 5 & b > 5 ) {
    cat( a, ' > 5 and ', b, ' > 5' )
} else {
    cat ( a, ' <= 5 or ', b, ' <= 5' )
}

a <- 8; b <- 5; c <- 10; max <- a
if ( b > max ) {
    max <- b
}
if ( c > max ) {
    max <- c
}
cat( 'a = ', a, ' b = ', b, ' c = ', c, ' max = ', max)

a <- 8; b <- 5; c <- 10; min <- a
if ( c < min ) {
    min <- c
}
if ( b < min ) {
    min <- b
}
cat( 'a = ', a, ' b = ', b, ' c = ', c, ' min = ', min)


#
# 실습문제 : 하나의 숫자를 입력 받아 짝수인지 홀수인지 출력 
#
#   Algoritm : 1. 하나의 숫자 입력 
#              2. 짝수이면 짝수, 홀수이면 홀수 출력 
#              3, 종료 

number <- 8
remainder <- number %% 2

if ( remainder == 0 ) {
    oddeven <- '짝수'
} else {
    oddeven <- '홀수'
}
cat( 'number : ', number, '는 ', oddeven, ' 이다.')

number <- as.numeric( readline( "Input number : " ) )
if ( number && 2 == 0 ) {
    cat( number, ' 는 짝수입니다.')
} else {
    cat( number, '는 홀수입니다.')
}


# 실습문제 : 하나의 숫자를 입력 받아 3의 배수이면 "3의 배수" 5의 배수이면 "5의 배수"  
#            3, 5의 배수가 아니면 "3.5의 배수가 아닙니다" 출력 


number <- as.numeric( readline( "Input number : " ) )

if ( number %% 3 == 0 ) {
    cat( number, " 는 3의 배수")
}  else if ( number %% 5 == 0 ) {
    cat( number, " 는 5의 배수" ) 
} else {
     cat (number, " 3, 5의 배수가 아닙니다.")
}



#
# 2.3 반복구조 
# 
# 반복구조 : 조건이 만족하는 동안 동일한 내용을 반복 수행   / 반복제어 변수로 i,j,k 를 많이 쓴다 
#
#   1. 반복 횟수가 정해진 경우 : for
#   2. 반복 횟수가 정해지지 않은 경우 : while
#
#   for문 : for(  [반복제어변수] in [반복범위] ) { }
#
for ( i in 1:10 ) {
    print( '*' )
}

for ( i in 1:10 ) {
    cat( i, ' ' )
}

multiple = 2 
for ( i in 2:9 ) {
    cat( multiple, ' * ', i, ' = ', multiple * i, '\n' )
}

for ( i in 2:9 ) {
    for ( j in 1:9) {
        multiple = i * j
        cat( multiple, '\t' )
    }
}

#
# 반복 제어 변수 초기화
# while ( 반복 제어 변수 조건 검사 ) {
#    반복 제어 변수 값 변경 
# }
#
i <- 1 # 반복 제어 변수 초기화  
while (i <= 10) { # 반복 제어 변수 조건 검사, 참인동안 반복
    print( '*' )
    i <-  i + 2   # 반복 제어 변수 값 변경, 누적   엘벨류 읽기 / 알벨류 쓰기
}

i <- 2
while( i <= 9 ) {
    j <- 1
    while( j <= 9 ) {
        multiple = i * j
        cat( multiple, '\t' )
        j <- j + 1
    }
    cat('\n')
    i <- i + 1
}


#
# 2.4 함수 
# 
# 함수( function ) : 단위 기능을 수행하는 코드 집합 
#
# 함수 종류 
#   1. 내장 함수 : R에 미리 내장된 함수( 기본 함수 )
#   2. 3rd party 함수 : 제 3 자가 작성하여 배포한 함수 
#   3. 사용자 정의 함수 : 사용자가 직접 정의한 함수 
#
# 함수 형식   ()있으면 함수 , 없으면 변수 
#
# 함수 정의 
#   함수이름(명) <- function( 인수 목록 ) {
#       함수 내용에 해당하는 코드 집합 
#       return ( return 값 )
#  }
#
# 함수 정의가 함수 호출보다 먼저 나와야 한다 
#
# 함수 호출 
#   함수명( 인수 목록 )
#

# 함수 정의 
multiple <- function( x ) {
    for ( i in 1:9 ) {
        multiple <- x * 1 
        cat( x, ' * ', i, ' = ', multiple, '\n')
    }
}


# 함수 호출 
multiple( 2 )


# return값이 있는 함수 
mymax <- function( x, y ) {
    num.max <- x
    if ( y > num.max ) {
        num.max <- y
    }
    return ( num.max )
}

mymax( 5, 6 )

a <- 10; b <- 5; c <- 8
max <- mymax( a, b ); max <- mymax( max, c )
max


# return값이 여러개인 함수 
myCalc <- function( x, y ) {
    add <- x + y
    sub <- x - y
    mul <- x * y
    div <- x / y
    rem <- x %% y
    
    return ( list( ret.add = add, ret.sub = sub, ret.mul = mul, ret.div = div, ret.rem = rem ) )
}
result <- myCalc( 10, 5 )
cat( '10 + 5 = ', result$ret.add, '\n' )
cat( '10 - 5 = ', result$ret.sub, '\n' )
cat( '10 * 5 = ', result$ret.mul, '\n' )
cat( '10 / 5 = ', result$ret.div, '\n' )
cat( '10 %% 5 = ', result$ret.rem, '\n' )


myCalc2 <- function( x, y ) {
    result <- c( x+y, x-y, x*y, x/y, x%%y )
    return( result )
}

myCalc2( 10, 5 )






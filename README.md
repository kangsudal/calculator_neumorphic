# 계산기&환율계산기  
**목표**: https://dribbble.com/shots/14734566-Calculator-App 를 flutter로 구현하기

**데이터**: [한국수출입은행 환율 OpenAPI](https://www.koreaexim.go.kr/ir/HPHKIR020M01?apino=2&viewtype=C&searchselect=&searchword=)

**프레임워크**: Flutter
<br/>
<br/>

## 구현영상
https://blog.naver.com/kangsudal-dev/223006711870
<br/>
<br/>

## 사용 라이브러리
  **계산기**
    `flutter_neumorphic`,`math_expressions`
    
  **환율계산기**
   `currency_picker`,`currency_icons`,`provider`,`flutter_dotenv`,`http`

   `flutter_neumorphic`: Neumorphic UI 키트
   
   `math_expressions`: 수식을 parsing하고 계산하기
   
   `currency_picker`: 통화를 변화시킬때 선택할 목록을 bottom sheet로 보여줌
   
   `currency_icons`: currency_picker에서 선택한 통화에 따라 이미지를 circleAvatar에 나타냄
   
   `provider`: 
   
    1. PureCalculator: 키패드 버튼이 눌리면 String 수식 -> math_expressions라이브러리-> double 계산 결과값
    
    2. PageData: 일반 Calculator와 환율 Calculator 화면 전환 상태
    
    3. CurrencyExchange: 환전버튼(↓)이 눌릴때 필요한 입력값(inputString)과 환전통화 종류(resultCurrency), 그 결과값 상태를 관리하여 화면에 보여줌
   
   `flutter_dotenv`: api key를 숨깁니다
   
   `http`: 한국수출입은행 api를 통해 환율 데이터를 json 형태로를 받아옴
   
  ### 코드 실행방법
  1. https://www.koreaexim.go.kr/ir/HPHKIR020M01?apino=2&viewtype=C&searchselect=&searchword=에서 생성한 api key가 필요합니다.

  2. 프로젝트 루트에 .env 파일을 생성합니다. 파일에 `APIKEY="발급받은 키"`를 입력합니다.
  
  3. 실행
<br/>

## Web app
http://calculator-neumorphic-aa62d.firebaseapp.com/

  ### 이슈
  **XMLHttpError**
  
  **OpenAPI 이용시 제약사항**:
  비영업일의 데이터, 혹은 영업당일 11시 이전에 해당일의 데이터를 요청할 경우 null 값이 반환

<br/>
<br/>

## 프로젝트 구조
코드 흐름도: https://docs.google.com/presentation/d/1tv-UOyDCG1kM_482ij5yfkAJOa8QlwH5toJGFGwm83w/edit#slide=id.g144de996576_0_0


##제일 많이 도움받은 영상
https://www.youtube.com/watch?v=l4bLPfS1uik&list=PL4nLX9pdXUwTK-w_PM5UGbftKxNn1ffYR&index=26

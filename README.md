# 계산기&환율계산기  
**목표**: https://dribbble.com/shots/14734566-Calculator-App 를 flutter로 구현하기

**데이터**: [한국수출입은행 환율 OpenAPI](https://www.koreaexim.go.kr/ir/HPHKIR020M01?apino=2&viewtype=C&searchselect=&searchword=)

**프레임워크**: Flutter


## 구현영상
![Android Emulator - calculator 2022-08-11 16-55-41 mp4_20220811_171839](https://user-images.githubusercontent.com/32862869/184093161-08b29940-fb2f-43b6-8cba-19bd74accf7a.gif) 

  ### 사용 라이브러리
  **계산기**
    `flutter_neumorphic`,`math_expressions`,
    
  **환율계산기**
   `currency_picker`,`currency_icons`,`provider`,`flutter_dotenv`,`http`

   `flutter_neumorphic`:
   
   `math_expressions`:
   
   `currency_picker`:
   
   `currency_icons`:
   
   `provider`:
   
   `flutter_dotenv`:
   
   `http`:
   

  ### Web app
  http://calculator-neumorphic-aa62d.firebaseapp.com/

  #### 이슈
  **XMLHttpError**:
  
  **OpenAPI 이용시 제약사항**:
  비영업일의 데이터, 혹은 영업당일 11시 이전에 해당일의 데이터를 요청할 경우 null 값이 반환

  ### 코드 실행방법
  1. https://www.koreaexim.go.kr/ir/HPHKIR020M01?apino=2&viewtype=C&searchselect=&searchword=에서 생성한 api key가 필요합니다.

  2. 프로젝트 루트에 .env 파일을 생성합니다. 파일에 `APIKEY="발급받은 키"`를 입력합니다.
  
  3. 실행


  ### 프로젝트 구조
코드 흐름도: https://docs.google.com/presentation/d/1tv-UOyDCG1kM_482ij5yfkAJOa8QlwH5toJGFGwm83w/edit#slide=id.g144de996576_0_0

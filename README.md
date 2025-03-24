# 🛍 Menswear-Shop Project
  - 프로젝트명 : NONMAJOR5
  - http://52.79.60.7:8080/

## 📌 프로젝트 설명
  남성 전문 쇼핑몰
 
  - 남성 전문 쇼핑몰로 의류 뿐만 아니라 악세사리 등의 패션 아이템을 판매하는 서비스입니다.
  - 회원들은 커뮤니티를 활용하여 소통하고 상품을 구매할 수 있습니다.
  - 관리자는 상품과 커뮤니티를 관리하여 건전하고 신뢰할 수 있는 쇼핑몰 환경을 제공합니다.
     
 ## ⚙ 개발 환경
   - `Java 17`
   - `JDK 17`
   - Framework : Spring Boot (3.x)
   - DataBase : MySQL
   - ORM : MyBatis
   - 버전 관리 : Git (GitHub 활용)
   - API 설계 및 구현 : REST API 방식 적용
    
 ## 🏗 시스템 아키텍처
 ![image](https://github.com/user-attachments/assets/8a643f5d-ae09-48dc-ad1d-361e5d8b394e)

 ## 📊 ERD 설계
 ![dd](https://github.com/user-attachments/assets/4165da71-7975-49e2-a6ea-d7aa595664ff)

 ## 📋 담당 주요 기능
  ### ✅ 회원 관리 기능
 <img src="https://github.com/user-attachments/assets/ca3a0061-5838-4d21-a87f-206258335afb" width="390" height="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://github.com/user-attachments/assets/e3046976-5a4f-44d0-a911-b052fb22c416" width="390"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary><br> 
    
  ![코드 구조 drawio](https://github.com/user-attachments/assets/423367a4-19f5-47b2-a5e3-b1bf11a9879c)


  - [MemberController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/MemberController.java)
  - [MemberRestController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/MemberRestController.java)
  - MemberService<br>
    : [MemberService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/MemberService.java) implements [IMemberService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/IMemberService.java)
  - [IMemberDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/IMemberDAO.java)
  - [MemberMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/MemberMapper.xml)
  </details>

  #### 🛠 기능 상세
  <details>
  <summary>로그인</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  <details>
  <summary>회원가입</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  ### ✅ 상품 구매 기능
 <img src="https://github.com/user-attachments/assets/af39d7a2-2535-420b-9d87-2c1cf1959653" width="410" height="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://github.com/user-attachments/assets/802c4ea8-a454-47ce-9596-34f7e19acbd1" width="370"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary><br> 
    
  ![코드 구조 drawio (3)](https://github.com/user-attachments/assets/4e4a6224-5311-431f-b583-352ec23061e8)

  - [CartController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CartController.java)
  - [CartRestController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CartRestController.java)
  - CartService<br>
    : [CartService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/CartService.java) implements [ICartService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/ICartService.java)
  - [ICartDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/ICartDAO.java)
  - [CartMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/CartMapper.xml)
  </details>

  #### 🛠 기능 상세
  <details>
  <summary>장바구니</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  <details>
  <summary>결제</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  ### ✅ 커뮤니티
 <img src="https://github.com/user-attachments/assets/661e7cdb-ff9c-43a2-91b6-71d7a24ccb16" width="390" height="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://github.com/user-attachments/assets/ed71bde0-4b14-4ce6-a7de-ac20bb8f8bae" width="390"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary><br> 
    
  ![코드 구조 drawio (2)](https://github.com/user-attachments/assets/e74bba2a-b44a-48ef-9ae0-9419ebc3c683)  
  ![코드 구조 drawio (1)](https://github.com/user-attachments/assets/be36b601-01ad-4ff9-a3ef-14c85af20fa8)


  - [CommunityController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CommunityController.java)
  - [CommunityRestController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CommunityRestController.java)
  - CommunityService<br>
    : [CommunityService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/CommunityService.java) implements [ICommunityService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/ICommunityService.java)
  - [ICommunityDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/ICommunityDAO.java)
  - [CommunityMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/CommunityMapper.xml)

  - [CommentController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CommentController.java)
  - [CommentRestController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/CommentRestController.java)
  - CommentService<br>
    : [CommentService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/CommentService.java) implements [ICommentService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/ICommentService.java)
  - [ICommentDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/ICommentDAO.java)
  - [CommentMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/CommentMapper.xml)
  </details>

  #### 🛠 기능 상세
  <details>
  <summary>댓글</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  ### ✅ 이벤트
 <img src="https://github.com/user-attachments/assets/75f20f9d-6c11-4d38-9300-72d5f802b086" width="390" height="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://github.com/user-attachments/assets/75d78851-4dc4-48d8-a541-224941cd5f9b" width="390"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary><br> 
    
  ![코드 구조 drawio (4)](https://github.com/user-attachments/assets/8da73944-2ffc-4979-91cb-67f37e22b807)

  - [EventController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/EventController.java)
  - EventService<br>
    : [EventService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/EventService.java) implements [IEventService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/IEventService.java)
  - [IEventDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/IEventDAO.java)
  - [EventMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/EventMapper.xml)
  </details>

  ### ✅ 관리자 기능
 <img src="https://github.com/user-attachments/assets/0d120c9b-afad-48f3-b9e5-2c6650148cf1" width="450"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary><br> 
    
  ![코드 구조 drawio (5)](https://github.com/user-attachments/assets/9db404c2-3849-4178-8606-0d479437968f)

  - [AdminController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/AdminController.java)
  - [AdminRestController](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/controller/AdminRestController.java)
  - ProductService<br>
    : [ProductService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/ProductService.java) implements [IProductService](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/service/IProductService.java)
  - [IProductDAO](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/java/com/shop_final/project/dao/IProductDAO.java)
  - [ProductMapper](https://github.com/sumiinn/shop_project/blob/main/shop_project/src/main/resources/mappers/ProductMapper.xml)
  </details>

  #### 🛠 기능 상세
  <details>
  <summary>상품 관리</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

  <details>
  <summary>커뮤니티 관리</summary><br> 

  [기능 설명]
  

  [주요 코드]
  ```java
  
  ```
  </details>

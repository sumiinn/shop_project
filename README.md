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
 <img src="https://github.com/user-attachments/assets/ca3a0061-5838-4d21-a87f-206258335afb" width="400" height="250">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <img src="https://github.com/user-attachments/assets/e3046976-5a4f-44d0-a911-b052fb22c416" width="380"  height="250">

  #### 🗂 구조 다이어그램
  <details>
  <summary>📌 구조 살펴보기</summary> 
    
  ![코드 구조 drawio (1)](https://github.com/user-attachments/assets/b588400c-05ce-4308-b216-178d498e6e8f)

  - [CartController](https://github.com/fullstack-final-project/project-final-metasumer/blob/develop/spring_boot_project_final/src/main/java/com/spring_boot_final/metasumer/controller/CartController.java)
  - CartService<br>
    : [CartService](https://github.com/fullstack-final-project/project-final-metasumer/blob/develop/spring_boot_project_final/src/main/java/com/spring_boot_final/metasumer/service/CartService.java) implements [ICartService](https://github.com/fullstack-final-project/project-final-metasumer/blob/develop/spring_boot_project_final/src/main/java/com/spring_boot_final/metasumer/service/ICartService.java)
  - [ICartDAO](https://github.com/fullstack-final-project/project-final-metasumer/blob/develop/spring_boot_project_final/src/main/java/com/spring_boot_final/metasumer/dao/ICartDAO.java)
  - [CartMapper](https://github.com/fullstack-final-project/project-final-metasumer/blob/develop/spring_boot_project_final/src/main/resources/mappers/CartMapper.xml)
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

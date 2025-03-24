# 🛍 Menswear-Shop Project
  - 프로젝트명 : NONMAJOR5
  - http://52.79.60.7:8080/
  ### 🔑 관리자 테스트 계정
  - ID : abcd
  - PW : 1234

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
  - Spring Security의 BCrypt 암호화를 적용하여 회원정보를 안전하게 저장합니다.
  - 로그인 성공 시 세션에 사용자 ID와 관리자 여부를 저장하여 권한을 부여합니다.

  [주요 코드]
  ```java
  // 로그인
	@PostMapping("/login")
	public ResponseEntity<String> loginCheck(@RequestBody HashMap<String, Object> param,
							                 HttpSession session) {
		String mangerC = memberService.managerCheck((String)param.get("id"));
		String result = memberService.loginCheck(param);	
		
		if(result.equals("success")) {
			session.setAttribute("sid", param.get("id"));
			if (mangerC.equals("1")) {
				session.setAttribute("mid", mangerC);				
			}
		}
		
		return ResponseEntity.ok(result);
	}
  ```
  </details>

  <details>
  <summary>회원가입</summary><br> 

  [기능 설명]
  - Spring Security의 BCrypt 암호화를 적용하여 회원정보를 안전하게 저장합니다.
  - 사용자는 정보를 입력하여 회원가입을 할 수 있습니다.

  [주요 코드]
  ```java
  @Override
	public void insertMember(MemberVO vo) {
		String encodedPwd = pwdEncoder.encode(vo.getMemPw());
		vo.setMemPw(encodedPwd);
		dao.insertMember(vo);
	}
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

  - 로그인 시 장바구니에 상품을 담을 수 있고 동일 상품을 담을 경우 수량이 증가됩니다.
  - Ajax 비동기 처리를 적용하여 새로고침 없이 변경사항을 확인할 수 있습니다.

  [주요 코드]
  ```java
  // 장바구니에 상품 추가
	@PostMapping("/cart")
	public ResponseEntity<String> insertCart(@RequestBody CartVO vo, HttpSession session) {
		// 로그인 성공 시
		String memId = (String) session.getAttribute("sid");
		
		if(memId == null) {
			return ResponseEntity.badRequest().body("로그인 후 이용해주세요");
		}
		vo.setMemId(memId);		

		boolean isSuccess;
		// count 변수를 통한 동일 상품 확인
		int count = cartService.checkPrdInCart(vo.getPrdNo(), memId);

		if (count == 0) {
			isSuccess = cartService.insertCart(vo); // 장바구니에 추가
		} else {
			isSuccess = cartService.updateQtyInCart(vo); // 수량 변경
		}
		
		if(!isSuccess) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("장바구니 처리 실패");
		}

		return ResponseEntity.ok("장바구니 추가 성공");
	}
  ```
  </details>

  <details>
  <summary>결제</summary><br> 

  [기능 설명]

  - 장바구니에서 넘어온 상품 정보로 주문서를 작성하고 결제를 진행합니다.
  - 주문 번호는 현재 시간 + 랜덤 숫자로 생성해 중복을 방지하며, 주문 완료 후 주문 정보와 날짜가 화면에 출력됩니다.

  [주요 코드]
  ```java
  @RequestMapping("/orderComplete")
  public String orderComplete(OrderInfoVO ordInfoVo, 
                            @RequestParam String hp1, @RequestParam String hp2, @RequestParam String hp3, 
                            Model model) {
    String hp = hp1 + "-" + hp2 + "-" + hp3;
    ordInfoVo.setOrdRcvPhone(hp);

    String ordNo = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) 
                   + "_" + (int)(Math.random() * 10000);
    ordInfoVo.setOrdNo(ordNo);
    cartService.insertOrderInfo(ordInfoVo);

    String ordDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    model.addAttribute("ordNo", ordNo);
    model.addAttribute("ordDate", ordDate);

    return "shop/orderCompleteView";
}
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

  - 회원일 경우 게시글 상세 페이지에서 댓글을 작성, 수정, 삭제할 수 있습니다.
  - Ajax 비동기 처리로 새로고침 없이 댓글 목록이 실시간으로 반영됩니다.

  [주요 코드]
  ```java
  @PostMapping
	public Map<String, Object> insertComment(@RequestBody CommentVO vo){				
		boolean insertSuccess = commentService.insertComment(vo);
		
		Map<String, Object> response = new HashMap<>();
		response.put("status", insertSuccess ? "success" : "fail");		
				
		return response;
	}
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

  - 관리자는 상품 정보를 관리(등록, 수정, 삭제) 합니다.
  - Ajax 비동기 처리로 상품 번호 입력 시 상품 정보를 실시간으로 불러옵니다.
  - 상품 정보 관리 시 이미지 업로드 및 수정 기능을 제공합니다.

  [주요 코드]
  ```java
  // 상품 등록
	@PostMapping("/product")
	public ResponseEntity<String> insertPrd(@RequestParam("prdNo") String prdNo,
	                                        @RequestParam("prdName") String prdName,
	                                        @RequestParam("prdPrice") int prdPrice,
	                                        @RequestParam("prdSale") int prdSale,
	                                        @RequestParam("mcId") String mcId,
	                                        @RequestParam("scId") String scId,
	                                        @RequestParam(value = "prdSize", required = false) String prdSize,
	                                        @RequestParam(value = "prdImg", required = false) List<MultipartFile> prdImgFiles,
	                                        @RequestParam(value = "prdInfoImg", required = false) List<MultipartFile> prdInfoImgFiles,
	                                        @RequestParam(value = "prdColor", required = false) List<MultipartFile> prdColorFiles) {
	    ProductVO vo = new ProductVO();
	    
	    vo.setPrdNo(prdNo);
	    vo.setPrdName(prdName);
	    vo.setPrdPrice(prdPrice);
	    vo.setPrdSale(prdSale);
	    vo.setMcId(mcId);
	    vo.setScId(scId);
	    vo.setPrdSize(prdSize);

	    try {
	        List<String> prdImgList = saveFile(prdImgFiles, "product/" + mcId + "/");
	        vo.setPrdImg(prdImgList.isEmpty() ? null : String.join(",", prdImgList));

	        List<String> prdInfoImgList = saveFile(prdInfoImgFiles, "prd_info/");
	        vo.setPrdInfoImg(prdInfoImgList.isEmpty() ? null : String.join(",", prdInfoImgList));

	        List<String> prdColorList = saveFile(prdColorFiles, "prd_colors/");
	        vo.setPrdColor(prdColorList.isEmpty() ? null : String.join(",", prdColorList));

	        prdService.insertProduct(vo);
	      
	        return ResponseEntity.ok("상품 등록 성공!");
	    } catch (IOException e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
	    }
	}
  ```
  </details>

  <details>
  <summary>커뮤니티 관리</summary><br> 

  [기능 설명]

  - 관리자는 회원의 부적절한 글과 댓글을 관리(삭제)하여 올바른 커뮤니티 환경을 유지합니다.
  - 관리자는 커뮤니티의 공지글을 관리(등록, 수정, 삭제) 합니다.
  - 게시글 작성 및 수정 시 이미지 업로드 및 수정 기능을 제공합니다.

  [주요 코드]
  ```java
  // 글 작성
	@PostMapping("/insertPost")
	public ResponseEntity<String> insertPost(CommunityVO vo,
			                                 @RequestParam(value = "postImgFiles", required = false) List<MultipartFile> files) {
		try {
			List<String> savedFileNames = saveFile(files);
			// 빈 값 저장 방지
			if (savedFileNames.isEmpty()) {
				vo.setPostImg(null);
			} else {
				vo.setPostImg(String.join(",", savedFileNames));
			}

			communityService.insertPost(vo);
			
			return ResponseEntity.ok("글 작성 성공!");
		} catch (IOException e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
		}

	}
  ```
  </details>

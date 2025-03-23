package com.shop_final.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.shop_final.project.model.ProductVO;
import com.shop_final.project.service.ProductService;

@RestController
@RequestMapping("/admin")
public class AdminRestController {
	@Autowired
	ProductService prdService;
	
	// 상품 번호 중복 체크
	@GetMapping("/product/check")
	public ResponseEntity<String> prdNoCheck(@RequestParam String prdNo) {
		String prdNo_result=prdService.prdNoCheck(prdNo);
		String result = "available";
		
		if(prdNo_result != null) {
			result = "not_available";
		}	
		
		return ResponseEntity.ok(result);
	}
	
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

	
	// 상품 정보 가져오기(상품 수정용)
	@GetMapping("/product/{prdNo}")
    public ResponseEntity<ProductVO> loadPrd(@PathVariable String prdNo) {
        return ResponseEntity.ok(prdService.prdInfoView(prdNo));
    }
	
	// 상품 수정
	@PutMapping("/product/{prdNo}")
    public ResponseEntity<String> updateProduct(@PathVariable String prdNo, @RequestBody ProductVO vo) {
        vo.setPrdNo(prdNo);
        prdService.changeProduct(vo);
        return ResponseEntity.ok("상품 수정 성공");
    }
	
	// 상품 삭제
	@DeleteMapping("/product/{prdNo}")
	public ResponseEntity<String> deletePrd(@PathVariable String prdNo) {
	    String mcId = prdService.prdInfoView(prdNo).getMcId();
	    prdService.productDelete(prdNo);
	    return ResponseEntity.ok(mcId);  
	}
	
	// 파일 저장
	private List<String> saveFile(List<MultipartFile> files, String subFolder) throws IOException {
		// 파일 저장 경로 생성
		//String uploadPath = "D:/springWorkspace/semi_project_images/upload/" + subFolder;
		String uploadPath = "/home/ubuntu/semi_project_images/upload/" + subFolder;

		// 폴더 없으면 생성
		File dir = new File(uploadPath);
	    if (!dir.exists()) dir.mkdirs();
	    
		// 여러 개의 파일명 저장할 리스트 생성
		List<String> savedFileNameList = new ArrayList<String>();

		for (MultipartFile file : files) {
			// 원본 파일명 저장
			String originalFileName = file.getOriginalFilename();

			// 파일 선택하지 않았을 때 UUID값 리스트에 추가되지 않도록 조건 추가
			if (originalFileName == null || originalFileName.isEmpty()) {
				continue;
			}

			// 파일명 변경(중복 피하기)
			UUID uuid = UUID.randomUUID();
			String shortUUID = uuid.toString().substring(0, 8);
			String savedFileName = shortUUID.toString() + "_" + originalFileName;

			// 저장된 파일명 리스트
			savedFileNameList.add(savedFileName);

			// 파일(객체) 생성
			File sendFile = new File(uploadPath + savedFileName);

			// 서버로 전송
			file.transferTo(sendFile);
		}

		return savedFileNameList;
	}

}

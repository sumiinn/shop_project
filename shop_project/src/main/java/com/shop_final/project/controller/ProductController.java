package com.shop_final.project.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop_final.project.model.CommunityVO;
import com.shop_final.project.model.ProductVO;
import com.shop_final.project.model.SubCategoryVO;
import com.shop_final.project.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	ProductService prdService;
	
	/* 메인화면 컨트롤러 */
	@RequestMapping("/")
	public String index(HttpSession session, Model model) {
		// 세션에서 필요한 값을 가져오기
        String sid = (String) session.getAttribute("sid");
        String mid = (String) session.getAttribute("mid");

        // 모델에 세션 정보를 추가
        model.addAttribute("sid", sid);
        model.addAttribute("mid", mid);
        
		ArrayList<ProductVO> bestPrdList = prdService.bestPrdList();
		ArrayList<ProductVO> newPrdList = prdService.newPrdList();
		model.addAttribute("bestPrdList", bestPrdList);
		model.addAttribute("newPrdList", newPrdList);
		
		return "index";
	} 
	
	/* 카테고리별 상품 보기 */
	@RequestMapping("/product/productCtgList/{mcId}")
	public String productCtgList(@PathVariable String mcId, Model model) {
		ArrayList<ProductVO> prdList = prdService.ctgListProduct(mcId);
		ArrayList<SubCategoryVO> subList = prdService.subList(mcId);
		model.addAttribute("prdList", prdList);
		model.addAttribute("subList", subList);
		
		return "shop/productCategoryView";
	}
	
	/* 상품 추가 화면(관리자용) */
	@RequestMapping("/product/insertPrdForm")
	public String insertPrdForm(Model model) {
		return "shop/insertPrdFormView";
	}
	/* 상품 변경 화면(관리자용) */
	@RequestMapping("/product/changePrdForm")
	public String changePrdForm() {
		return "shop/changePrdFormView";
	}
	
	/* 상품 추가(관리자용) */
	@RequestMapping("/product/insertPrd")
	public String insertPrd(ProductVO vo){
		prdService.insertProduct(vo);
		return "redirect:/";
	}
	
	/* 상품 변경(관리자용) */
	@RequestMapping("/product/changePrd")
	public String changetPrd(ProductVO vo){
		prdService.changeProduct(vo);
		return "redirect:/";
	}
	
	/* 상품 삭제 */
	@RequestMapping("/product/deleteProduct/{prdNo}")
	public String deletePrd(@PathVariable String prdNo) {
		String mcId = prdService.prdInfoView(prdNo).getMcId();
		prdService.productDelete(prdNo);
		return "redirect:/product/productCtgList/"+mcId;
	}
	
	/* 상품번호 중복체크 */
	@ResponseBody
	@RequestMapping("/product/prdNoCheck")
	public String prdNoCheck(@RequestParam("prdNo") String prdNo) {
		String prdNo_result=prdService.prdNoCheck(prdNo);
		String result = "available";
		if(prdNo_result != null) {
			result = "not_available";
		}	
		return result;
	}
	/* 상품 정보 변경 */
	@ResponseBody
	@RequestMapping("/product/prdDataLoad")
	public ProductVO prdDataLoad(@RequestParam("prdNo") String prdNo) {
		ProductVO prdVO=prdService.prdInfoView(prdNo);
	
		return prdVO;
	}
	
	/* 상품페이지 이동 */
	@RequestMapping("/product/productDetailView/{prdNo}")
	public String prdViewPage(@PathVariable("prdNo") String prdNo,Model model) {
		ProductVO prd = prdService.prdInfoView(prdNo);
		ArrayList<CommunityVO> reviewList = prdService.prdReviewList(prdNo);
		ArrayList<ProductVO> prdRList = prdService.randomPrdList(prdNo);
		String[] colorList = prd.getPrdColor().split(",");
		String[] sizeList = prd.getPrdSize().split(",");
		String[] prdImgList = prd.getPrdImg().split(",");
		String[] prdInfoImg = prd.getPrdInfoImg().split(",");
		model.addAttribute("prd", prd);
		model.addAttribute("colorList", Arrays.asList(colorList));
		model.addAttribute("sizeList", Arrays.asList(sizeList));
		model.addAttribute("prdImgList", Arrays.asList(prdImgList));
		model.addAttribute("prdInfoImg", Arrays.asList(prdInfoImg));
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("prdRList", prdRList);
		
		return "shop/detailProductView";
	}
	
	/* 모달창 활성화 */
	@RequestMapping("/product/modalPrd")
	public String modalView(@RequestParam("prdno") String prdno, Model model) {
		ProductVO prdInfo = prdService.prdInfoView(prdno);
		model.addAttribute("prdInfo",prdInfo);
		return "shop/detailModal";
	}
	
	
	
	/* 상품 이미지 업로드 */
	/*@RequestMapping("/product/insertPrd")
	public String insertPrd(@RequestParam("prdImg") ArrayList<MultipartFile> prdImgs,
							@RequestParam("prdInfoImg") ArrayList<MultipartFile> prdInfoImgs,
							@RequestParam("prdColor") ArrayList<MultipartFile> colorImgs,ProductVO vo) throws IOException{
		System.out.println("prdinsert Mappin");
		String prdImgPath = "C:/springWorkspace/semi_project_images/product/"+vo.getMcId()+"/";
		String colorImgsPath = "C:/springWorkspace/semi_project_images/prd_colors/";
		System.out.println(prdImgPath);
		for(MultipartFile prdImg : prdImgs) {
			String imgName = prdImg.getOriginalFilename();
			
			File sendFile = new File(prdImgPath+imgName);
			prdImg.transferTo(sendFile);
		}
		for(MultipartFile prdInfoImg : prdInfoImgs) {
			String imgName = prdInfoImg.getOriginalFilename();
			
			File sendFile = new File(prdImgPath+imgName);
			prdInfoImg.transferTo(sendFile);
		}
		for(MultipartFile colorImg : colorImgs) {
			String imgName = colorImg.getOriginalFilename();
			
			File sendFile = new File(colorImgsPath+imgName);
			colorImg.transferTo(sendFile);
		}
		
		return "redirect:/";
	}*/
	
	
	
	
	
}

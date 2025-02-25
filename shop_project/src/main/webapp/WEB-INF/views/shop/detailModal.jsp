<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
	<script src="<c:url value='/js/prdModal.js'/>"></script>
	<form class="modal_popup" action="<c:url value='/shop/insertCart' />">
        <div class="moreInfoF"> <!--  구매및 사진 -->
			<div id="modalimg"> 
				<img src="<c:url value='/project_images/product/${prdInfo.mcId}/${prdInfo.prdImg.split(",")[0]}'/>">
			</div>
			<div id="infoArea" class="modalInfo"> <!--  정보 영역 -->
				<span id="modalPrdName"></span><br>
				<br><hr><br>
					<input type="hidden" name="prdNo" value="${prdInfo.prdNo}"> 	
				    <input type="hidden" id="selectedColor" name="cartColor" value="">
                    <input type="hidden" id="selectedSize" name="cartSize" value="">
				<table>
					<tr>
						<th>판매가</th>
						<td><span id="modalPrice" data-Price="${prdInfo.prdPrice }"></span></td>
					</tr>
					<tr>
						<th>포인트</th>
						<td><span id="modalPoint" ></span></td>
					</tr>
				</table>
				<br><hr><br>
					<table>
					<tr>
						<th>color</th>
						<td >
							<c:if test="${not empty prdInfo.prdColor }"> 
								<c:forEach items="${prdInfo.prdColor.split(',')}" var="col">
									<img class="colorEx" data-color="${col }"  name="${col} " alt="" src="<c:url value='/project_images/prd_colors/${col}'/>">
								</c:forEach>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>size</th>
						<td>
							<select id="size" name="size">
								<c:choose>
									<c:when test="${empty prdInfo.prdSize }">
										<option value="F">프리 사이즈 입니다.</option>
									</c:when>
									<c:when test="${not empty prdInfo.prdSize }">
										<option value="none">[필수]사이즈 선택</option>
										<c:forEach items="${prdInfo.prdSize.split(',')}" var = "size">
											<option class="sizeC" data-size="${size }"value="${size }">${size }</option>
										</c:forEach>
									</c:when>
								</c:choose>
							</select>
						</td>
					</tr>
				</table>
				<br><hr><br>
				<div id="modalfinalCheck">
					<div>
					<table>
						<tr  id= "modalCountNo" class="visibility">
							<th>수량</th>
							<td>
								<input type='number' name="cartQty" id="modalnumberCheck" value="1">
							</td>
						</tr>
					</table>
					</div>
					<div id="modaltotalPrice">
						TOTAL :&nbsp;<span id="mdalSumCost"></span>
					</div>
				</div>
				<div id="modalbuttonBar">
					<button class='modalshopBtn'>장바구니 넣기</button>
				</div>
			</div>
		</div>
    </form>
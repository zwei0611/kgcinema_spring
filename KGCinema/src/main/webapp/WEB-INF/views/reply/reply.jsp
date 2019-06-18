<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventList</title>
<link rel="stylesheet" type="text/css" href="./resources/css/reply3.css">
</head>
<script type="text/javascript">
</script>
  
<body>
<div class="popup_box row5">
	<h3>한줄평 <span id="movieCommentTotalCount">(${replycnt})</span></h3>

	<!-- 한줄평 쓰기// -->
	<div class="write_wrap">
		<div class="photo_profile">
		    <c:choose>
            <c:when test="${bean.j_file1 eq '' || empty bean.j_file1}">
             <img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt="">
            </c:when>
            <c:otherwise>
             <img src="${pageContext.request.contextPath}/resources/storage/${bean.j_file1}" alt="">
            </c:otherwise>
           </c:choose>
		</div>
		<div class="write">
			<div class="name">

				<span>${bean.j_name}</span>
				<span id="wordCheckCount"></span>
			</div>
		  <c:choose>
 		   <c:when test="${myreply.dr_id eq '' || empty myreply.dr_id}">
				<div class="input rate_insert">
					<div class="rate rate_insert">
						<div class="star-wrap-critic" id="myStarScore" style="cursor: pointer; width: 125px;">
				          <c:choose>
				 	       <c:when test="${myreply.dr_point eq '' || empty myreply.dr_point}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>          
				 	       <c:when test="${myreply.dr_point eq 1}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 2}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 3}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 4}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>	
				 	       <c:otherwise>
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score" value="">
					       </c:otherwise>              	       	       
					       </c:choose> 
						</div>
						<p class="text-center">평점을 입력해주세요</p>

					</div>
					<div class="textarea">
					    <c:choose>
					     <c:when test="${bean.j_id eq null}">
					       <textarea id="txt" title="댓글쓰기" name="comment" cols="30" rows="10" maxlength="100" placeholder="로그인후 입력해주세요"></textarea>
					     </c:when>
					     <c:otherwise>
					       <textarea id="txt" title="댓글쓰기" name="comment" cols="30" rows="10" maxlength="100" placeholder="댓글을 입력해주세요"></textarea>
					     </c:otherwise>
					    </c:choose>
					</div>
					<div class="btn_wrap">
						<button type="submit" class="img_btn movie nowfocus">등록</button>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="input rate_edit">
					<div class="rate rate_edit">
						<div class="star-wrap-critic" id="myStarScore" style="cursor: pointer; width: 125px;">
				          <c:choose>
				 	       <c:when test="${myreply.dr_point eq '' || empty myreply.dr_point}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>          
				 	       <c:when test="${myreply.dr_point eq 1}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 2}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 3}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>
				 	       <c:when test="${myreply.dr_point eq 4}">
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_off.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:when>	
				 	       <c:otherwise>
					          <input id="aa" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점1 괜히봤어요" value="1">
					          <input id="bb" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점2 기대하진 말아요" value="2">
					          <input id="cc" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점3 무난했어요" value="3">
					          <input id="dd" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점4 기대해도 좋아요!" value="4">
					          <input id="ee" type="image" src="http://image2.megabox.co.kr/mop/home/star_mid_on.png" alt="별점5 너무 멋진 영화였어요!" value="5">
					          <input type="hidden" name="score">
					       </c:otherwise>              	       	       
					       </c:choose> 
						</div>
						<p class="text-center">평점을 입력해주세요</p>

					</div>
					<div class="textarea">
						<textarea id="txt" title="댓글쓰기" name="comment" cols="30" rows="10" maxlength="100" onkeyup="checkWordLenth(this, 100, 'wordCheckCount');"></textarea>
					</div>
					<div class="btn_wrap">
						<button type="submit" class="img_btn movie nowfocus" onclick="MovieComment.regist()">등록</button>
					</div>
				</div>		
			</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- //한줄평 쓰기 -->

	<!-- 한줄평 목록// -->
	<div id="movieCommentList" class="list">












<ul class="sort pull-right mb15" style="overflow:visible">
	<li><a href="javascript:void(0)" class="c_mint" onclick="MovieComment.list('createDate')" title="최신순 정렬하기">최신순</a></li>
</ul>
<div class="item_2block">
<c:forEach var="reply" items="${reply}">
<c:choose>
 <c:when test="${reply.dr_content ne null || not empty ''}">
 
	<div class="row">
	 
	 	<div class="cell">

		<div class="photo_profile">
			<img src="http://image2.megabox.co.kr/mop/home/user/profile_m.png" alt="rkdekd** 프로필사진 없음">
		</div>
		<div class="text" style="border-bottom:none;">
			<div class="name">
				<strong>${reply.dr_id}</strong>
			</div>
			<div class="dateStarReal">
				<span><fmt:formatDate value="${reply.dr_date}" pattern="yyyy/MM/dd" /></span>
				
				<div>

					<span class="small_star2">
					<c:choose>
			         <c:when test="${reply.dr_point eq null || not empty ''}">
			          <span class="fill2" style="width: 0%;"></span>
			         </c:when>
			         <c:when test="${reply.dr_point == 1}">
			          <span class="fill2" style="width: 20%;"></span>
			         </c:when>
			         <c:when test="${reply.dr_point == 2}">
			          <span class="fill2" style="width: 40%;"></span>
			         </c:when>
			         <c:when test="${reply.dr_point == 3}">
			          <span class="fill2" style="width: 60%;"></span>
			         </c:when>			         			         
			         <c:when test="${reply.dr_point == 4}">
			          <span class="fill2" style="width: 80%;"></span>
			         </c:when>
			         <c:otherwise>
			          <span class="fill2" style="width: 100%;"></span>
			         </c:otherwise>           
			        </c:choose>
					</span>

				</div>

				
				<span class="realView">실관람</span>

			</div>
			<p>
				<span class="comment">
				${reply.dr_content}
				</span>
			</p>
			<!-- 한줄평 쓰기// -->
		</div>
		
		<div class="btn_wrap">
		    <c:choose>
		     <c:when test="${bean.j_id eq 'admin' || bean.j_id eq reply.dr_id}">
		      <button type="button" class="btn_delete" onclick="MovieComment.remove()" value="${reply.dr_no}">삭제</button>		     
		     </c:when>
		     <c:otherwise>
		      
		     </c:otherwise>
		    </c:choose>
		</div>			
	</div>

   </div>    
 </c:when>
 <c:otherwise>
 
 </c:otherwise>
</c:choose>
</c:forEach>
</div>

<!-- //코멘트 편집 -->

       <ul class="custom-pagination" style="margin-top:25px;">
       <c:if test="${startpage>10}">
        <li> 
         <a href="replylist.do?idx=${data}&pageNum=${pagecount-pagecount+1}" class="img_btn customer first" title="처음 페이지 보기">
          <span class="blind">처음 페이지</span>
         </a>         
        </li>
       </c:if>
        
       <c:if test="${startpage>10}">
        <li>
         <a href="replylist.do?idx=${data}&pageNum=${startpage-10}" class="img_btn customer prev" title="이전 10페이지 보기">
          <span class="blind">이전 10페이지</span>
         </a>         
        </li>
       </c:if> 

       
       <c:forEach var="i" begin="${startpage}" end="${endpage}">
        <c:choose>
    	  <c:when test="${i==pageNUM}"> 
    	    <li><a class="active" href="replylist.do?idx=${data}&pageNum=${i}${returnpage}">${i}</a></li>
    	  </c:when>
    	  <c:otherwise>
    	    <li><a href="replylist.do?idx=${data}&pageNum=${i}${returnpage}">${i}</a></li>
    	  </c:otherwise>
    	</c:choose>
       </c:forEach>
        
        
    
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="replylist.do?idx=${data}&pageNum=${startpage+10}" class="img_btn customer next" title="다음 10페이지 보기">
          <span class="blind">다음 10페이지</span>
         </a>         
        </li>
       </c:if> 
         
       <c:if test="${endpage<pagecount}">  
        <li>
         <a href="replylist.do?idx=${data}&pageNum=${pagecount}" class="img_btn customer last" title="마지막 페이지 보기">
          <span class="blind">마지막 페이지</span>
         </a>         
        </li>
        </c:if>    
       </ul>

</div>
</div>
</body>
</html>
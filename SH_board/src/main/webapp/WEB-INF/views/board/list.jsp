<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
    a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  

   .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;} 
   .active{
      background-color: #cdd5ec;
  }
 
  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input{
      height: 30px;
    width: 250px;
  }
  .search_area button{
     width: 100px;
    height: 36px;
  }
   
   .search_area select{
   	  height: 35px;
   }
   
  </style>
</head>
<body>
<h1>목록페이지입니다.</h1>

<div class="table_wrap">
		<a href="/board/enroll" class="top_btn">게시판 등록</a>
		<table>
				<thead>
								<tr>
										<th class="bno_width">번호</th>
										<th class="title_width">제목</th>
										<th class="writer_width">작성자</th>
										<th class="regdate_width">작성일</th>
										<th class="updatedate_width">수정일</th>
								</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
							<td><c:out value="${list.bno}"/></td>
							<td>
									<a class="move" href='<c:out value="${list.bno}"/>'>
										<c:out value="${list.title}"/>
									</a>
							</td>
							<td><c:out value="${list.writer}"/></td>
              				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
               				<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
					</tr>
				</c:forEach>
		</table>
		
	    <div class="search_wrap">
	        <div class="search_area">
				<select name="type">
               	 <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
               	 <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
               	 <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
              	  <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
              	  <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
              	  <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
              	  <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
            </select>  	           
	            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
	            <button>Search</button>
	        </div>
	    </div>   		
		
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
	                <!-- 이전페이지 버튼 -->
	                <c:if test="${pageMaker.prev}">
	                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
	                </c:if>			
					
					<!--  각 번호 페이지 이동 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? " active":"" }"><a href="${num}">${num}</a></li>
					</c:forEach>
			
				    <!-- 다음페이지 버튼 -->
	                <c:if test="${pageMaker.next}">
	                    <li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
	                </c:if>  
			
				</ul>
			</div>
		</div>
		
		
		<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">		
				<input type="hidden" name="type" value="${pageMaker.cri.type}">
		</form>
</div>

<script>
		$(document).ready(function(){
		    
			let result = '<c:out value="${result}"/>';
			 
			checkAlert(result);
			
			function checkAlert(result){
				
				if(result === ''){
					return;
				}
				
				if(result === "enroll success"){
					alert("등록이 완료되었습니다.");
				}
				
			    if(result === "modify success"){
			          alert("수정이 완료되었습니다.");
			    }
			 	
			    if(result === "delete success"){
			    		alert("삭제가 완료되었습니다.");
			    }
			}
			
		});

		
		
	    let moveForm = $("#moveForm");
	    
	    $(".move").on("click", function(e){
	        e.preventDefault();       // board/bno 로 가는것 방지하고 밑에 코드 실행하도록 함
	        
	        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");   //moveForm 변수에 저장된 jQuery객체에 input태그를 추가.input태그의 타입은 hidden,이름은 bno, 값은 클릭한 요소의 href 속성값
	        moveForm.attr("action", "/board/get");     //moveForm 변수에 저장된 jQuery객체의 action 속성을 /board/get으로 설정
	        moveForm.submit();
	    });    
	 //class가 move인 HTML 요소를 클릭하면, id가 moveForm인 HTML 요소에 input 태그를 추가하고, /board/get으로 요청을 보내는 기능을 수행.
	// 예) board/get?bno=1
			
	
		
	     $(".pageInfo a").on("click", function(e) {   //class가 pageInfo인 요소 안에 있는 모든 a태그 선택하고, 선택한 a태그에 클릭 이벤트 연결
	    	 
	    	 e.preventDefault();    //a태그의 href속성 링크로 이동하는 것 멈춤
	    	 moveForm.find("input[name='pageNum']").val($(this).attr("href"));  // name이 pageNum인 input 요소의 값으로 ,클릭한 <a> 태그의 href속성 값 설정
	    	 moveForm.attr("action", "/board/list");   //<form>태그 action 속성을 '/board/list'로 설정
	    	 moveForm.submit();  //<form>태그 서버 전송
	    	 
	     });
			
		
	     $(".search_area button").on("click", function(e){
	         e.preventDefault();
	         
	         let type = $(".search_area select").val();
	         let keyword = $(".search_area input[name='keyword']").val();
	         
	         if(!type){                         //옵션을 선택안할때
	        	 	alert("검색 종류를 선택하세요.");       
	        	 	return false;
	         }
	         		
	         if(!keyword){					// 키워드를 입력안할때
	        	 	alert("키워드를 입력하세요.");
	        	 	return false;
	         }
	         
	         moveForm.find("input[name='type']").val(type);
	         moveForm.find("input[name='keyword']").val(keyword); //사용자가 작성한 'keyword'데이터를<form> 태그 내부에 있는 name 속성이 'keyword'인 <input>태그에 저장
	         moveForm.find("input[name='pageNum']").val(1);  //'목록 페이지'를 이동했을 때 1페이지로 이동을 지정해주기
	         moveForm.submit();
	     });
	     
</script>
</body>
</html>
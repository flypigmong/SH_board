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
  
  //버튼 css
  
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
		
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
					<!--  각 번호 페이지 이동 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="pageInfo_btn">	
								 <a href="${num}">
								 		${num}
								 </a>
							</li>
					</c:forEach>
			
				</ul>
			</div>
		</div>
		
		
		
		<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
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
			
			
</script>
</body>
</html>
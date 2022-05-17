<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<style>
* {
	border: 1px solid black;
	box-sizing: border-box;
	text-align: center;
}
</style>
</head>
<body>
	<div id="container">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-1">logo</div>
					<div class="col-3"></div>
					<div class="col-2">지출의 참견</div>
					<div class="col-2">선택의 참견</div>
					<div class="col-2">고객센터</div>
					<div class="col-2">마이페이지</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">선택의 참견</div>
			<div class="col-12">최저가를 찾는 자린괴비들의 지침</div>
		</div>
		<div class="row">
			<div class="col-6"></div>
			<div class="col-4">
				<input type="text" id="serch" name="serch"
					placeholder="검색하실 내용을 입력하세요">
			</div>
			<div class="col-2">
				<button type="submit" id="submit">검색</button>
			</div>
		</div>
		<div class="row">
			<div class="col-2">left</div>
			<div class="col-8">
				<div class="row">
					<div class="col-2">글번호</div>
					<div class="col-2">제목</div>
					<div class="col-2">작성자</div>
					<div class="col-2">제한시간</div>
					<div class="col-2">작성시간</div>
				</div>
				<div class="row">
					<c:forEach var="i" items="${dto}">
						<div class="col-2">${i.seq}</div>
						<div class="col-2"><a href="/read.board?seq=${i.seq}&count=${i.count}">${i.title}</a></div>
						<div class="col-2">${i.writer}</div>
						<div class="col-2 limit" id="${i.seq}">${i.limit}</div>
						<div class="col-2 time" id="${i.wrier_date}"></div>
					</c:forEach>
                    
				</div>
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">list</div>
					<div class="col-1"></div>
				</div>
			</div>
			<div class="col-2">right</div>
		</div>
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">< 1 2 3 4 5 6 7 8 9 10 ></div>
			<div class="col-2">
				<a href="/index.jsp"><button id="tomain">main으로</button></a>
				<a href="/write.brd2"><button id="write">작성하기</button></a>
			</div>
		</div>
		<div class="row">
			<div class="col-12">footer</div>
		</div>
	</div>
	<script>
		const countDownTimer = function(id, date) {
			let _vDate = new Date(date);
			// 전달 받은 일자 
			let _second = 1000;
			let _minute = _second * 60;
			let _hour = _minute * 60;
			let _day = _hour * 24;
			let timer;
			function showRemaining() {	
				let now = new Date();
				var distDt = _vDate - now;
				if (distDt < 0) {
					clearInterval(timer);
					document.getElementById(id).textContent="종료";
					return;
				}
				let days = Math.floor(distDt / _day);
				let hours = Math.floor((distDt % _day) / _hour);
				let minutes = Math.floor((distDt % _hour) / _minute);
				let seconds = Math.floor((distDt % _minute) / _second);
				//document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";
 				//document.getElementById(id).textContent = days + '일 ';
				//document.getElementById(id).textContent += hours + '시간 ';
				document.getElementById(id).textContent = minutes + '분 ';
				document.getElementById(id).textContent += seconds + '초';
			}
			timer = setInterval(showRemaining, 1000);
		}
 		
		
		for(let i=0;i<10;i++){
	        let id = $(document.querySelectorAll(".limit")[i]).attr('id');
	        let time = $(document.querySelectorAll(".time")[i]).attr('id');
	        let dateObj = new Date(time);
			let wtime = dateObj.getFullYear()+"-"+dateObj.getMonth()+"-"+dateObj.getDate()+" "+dateObj.getHours()+":"+dateObj.getMinutes()+":"+dateObj.getSeconds();
	        $(document.querySelectorAll(".time")[i]).text(wtime);
	        dateObj.setMinutes(dateObj.getMinutes() +10);
			countDownTimer(id, dateObj);
	        }
		// 내일까지 countDownTimer('sample02', '04/01/2024 00:00 AM'); 
		// 2024년 4월 1일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 
// 		countDownTimer('sample03', '04/01/2024');
		// 2024년 4월 1일까지 countDownTimer('sample04', '04/01/2019');
		// 2024년 4월 1일까지
	</script>
</body>
</html>
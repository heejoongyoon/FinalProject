<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
	#body {background-color: #EEF1F6;}
	.row {padding: 30px;}
	.row .divProfile, .divWork, .divNewList, .divNotice, .divSimpleCalendar, .divSimpleSurvet {
			background-color: white; border-radius: 10px; padding: 20px 20px 20px 20px; margin-bottom: 20px;
		}
	.row .title {font-weight: bold; font-size: 0.9rem;}
	.row .table a {color: black;}
		
	.row .divProfile img {width: 50%;  max-width: 80px; min-height: 70px; margin: 0px 0px 10px 0px; border-radius: 50%;}
	.row .divProfile p {margin-bottom: 0px;}
	.row .divProfile p > span {font-weight: bold; font-size: 0.9rem; padding-left: 5px; color: black;}
	.row .divProfile span {font-size: 0.8rem; color: #919191;}
	
	
	.row .divWork p {margin: 0px; padding-top: 10px;}
	.row .divWork .currentTime {font-size: 0.8rem; color: #888;}
	.row .divWork h2 {display: inline;}
	.row .divWork span {padding-right: 10px;}
	.row .divWork .divWorkTime {padding-top: 5px;}
	.row .divWork .divTotalWorkGraph {width: 100%; background-color: #EEF1F6; margin-top: 7px; height: 10px;}
	.row .divWork .divTotalWorkGraph {width: 100%; background-color: #EEF1F6; margin-top: 7px; height: 10px;}
	.row .divWork .divRunWorkGraph {background-color: #55beff; width: 0; height: 10px;}
	.row .divWork .divStartWorkTime {margin-top: 30px;}
	.row .divWork .divEndWorkTime {padding-bottom: 20px; border-bottom: 1px dashed #dddddd;}
	.row .divWork .spWorkTimeName {font-size: 0.8rem; font-weight: bold;}
	.row .divWork .spWorkTime, .spWorkTimestart, .spWorkTimeend {float: right;}
	.row .divWork .divWorkBtn {margin-top: 20px;}
	.row .divWork .divWorkBtn #btnStartWork {float: left; width: 49%; height: 43px; margin-bottom: 7px;}
	.row .divWork .divWorkBtn #btnEndWork {float:right; width: 49%; height: 43px; margin-bottom: 7px;}
	.row .divWork .divWorkBtn #btnStatusWork {clear: both; width: 100%;}
	.row .divWork .dropdown-menu {width: 210px; text-align: center; padding: 0px; border: 2px solid #55beff;}
	.row .divWork .dropdown-menu ul {margin: 0px; padding: 0px; list-style: none;}
	.row .divWork .dropdown-menu li {margin-top: 5px; cursor: pointer; font-size: 0.9rem; height: 30px; padding-top: 5px;}
	.row .divWork .dropdown-menu li:hover {background-color: #EEF1F6}
	.row .divWork .btn {border: 2px solid #55beff; font-size: 0.8rem; color: black; border-radius: 20px;}
	.row .divWork .btn:hover {background-color: #55beff; color: white; font-weight: bold;}
	.row .divShortcuts .btn {background-color: white; font-size: 0.9rem; width: 100%; height: 50px; margin-bottom: 7px; border: 1px solid white; border-radius: 10px;}
	
	.row .nav .nav-item .nav-link {font-size: 0.8rem; padding: 10px 15px 10px 15px; font-weight: bold; color: #b1afaf;}
	.row .nav .nav-item .nav-link:hover {border-color: white; color: black;}
	.row .nav .nav-item .nav-link.active {border-color: white; border-bottom: 4px solid #55beff; color: black;}
	
	.row .table tr {border-top: none; border-bottom: 1px solid #dee2e6;}
	.row .divNewList .newList {margin-top: 15px; height: 300px; overflow-y: scroll;}
	.row .divNewList .newList::-webkit-scrollbar {width: 5px;}
	.row .divNewList .newList::-webkit-scrollbar-thumb {background-color: #888;}
	.row .divNewList .newList::-webkit-scrollbar-track {background-color: #dddddd;}
	.row .divNewList .table td {border: none; overflow: hidden;}
	.row .divNewList .table td:hover {background-color: #f5f5f5;}
	.row .divNewList .table td a {color: black; font-size: 0.9rem;}
	.row .divNewList .table td span {color: #888; font-size: 0.8rem; margin-right: 5px;}
	.row .divNewList .table td .community-boardWriter {font-size: 0.7rem;}
	.row .divNewList .table .profile {float: left;}
	.row .divNewList .table .photo {width: 40px; height: 40px; border-radius: 50%;}
	.row .divNewList .table .newInfo {margin-left: 55px;}
	.row .divNewList .table .newInfo p {margin: 0px; font-size: 0.8rem;}
	
	.row .noticeDiv {margin-top: 15px;}
	.row .noticeDiv .table td {font-size: 0.8rem;}
	.row .noticeDiv .table thead td {border: none;}
	.row .noticeDiv .table thead td span {color: black; font-weight: bold;}
	.row .noticeDiv .table span {color: #888;}
	.row .noticeDiv ul {margin-top: 10px; border-bottom: 0px;} 
	
	
	.row .divSimpleSurvet {padding-bottom: 40px;}
	.row .divSimpleSurvet .surveyList {display: flex; margin-top: 15px;}
	.row .divSimpleSurvet .emptySurevyList {padding: 100px; font-size: 0.9rem; color: #888; text-align: center;}
	.row .divSimpleSurvet .divSurvey {border: 1px solid #ddd; border-radius: 8px; padding: 20px; width: 50%; margin-left: 5px; margin-right: 5px;}
	.row .divSimpleSurvet .divSurvey header {padding-bottom: 15px;}
	.row .divSimpleSurvet .divSurvey header .surveyCheckStatus {border: 1px solid #ff616b; background-color: #ff616b; color: white; font-size: 0.7rem; padding: 3px; font-weight: bold; border-radius: 3px;}
	.row .divSimpleSurvet .divSurvey .surveyTitle {margin: 0px; text-overflow: ellipsis; max-width: 250px; white-space: nowrap; overflow: hidden;}
	.row .divSimpleSurvet .divSurvey .surveySubject {padding-bottom: 5px;}
	.row .divSimpleSurvet .divSurvey .surveySubject span {font-size: 0.9rem; color: #888; padding-left: 3px;}
	.row .divSimpleSurvet .divSurvey .surveyContent .table tr {border-color: white;}
	.row .divSimpleSurvet .divSurvey .surveyContent .table td {border-color: white; font-size: 0.8rem; padding: 3px;}
	.row .divSimpleSurvet .divSurvey .surveyContent .table td > span {color: #888;}
	.row .divSimpleSurvet .divSurvey .divGoSurvey {text-align: center; border-top: 1px dashed #dddddd;}
	.row .divSimpleSurvet .divSurvey .divGoSurvey #btnGoSurvey {border: 2px solid #55beff; font-size: 0.8rem; color: black; border-radius: 20px; width: 100%; margin-top: 20px; height: 50px;}
	.row .divSimpleSurvet .divSurvey .divGoSurvey #btnGoSurvey:hover {background-color: #55beff; color: white; font-weight: bold;}
	
	/* ????????? css*/
	#calendar a {color: black;}
	#calendar .fc-header-toolbar {font-size: 0.9rem; display: block; text-align: center;}
	#calendar .fc-header-toolbar .fc-toolbar-chunk:first-child {display: none;}
	#calendar .fc-header-toolbar .fc-toolbar-chunk:last-child {display: none;}
	#calendar .fc-daygrid-day:hover {cursor: pointer;}
	#calendar .fc-header-toolbar .fc-toolbar-title	{display: inline; font-size: 1.5rem;}
	#calendar .fc-header-toolbar .fc-prev-button {margin-bottom: 5px; margin-right: 25px; background-color: white; border-color: white; color: #888; box-shadow: none;}
	#calendar .fc-header-toolbar .fc-prev-button:hover {border-color: #dddddd;}
	#calendar .fc-header-toolbar .fc-next-button {margin-bottom: 5px; margin-left: 25px; background-color: white; border-color: white; color: #888; box-shadow: none;}
	#calendar .fc-header-toolbar .fc-next-button:hover {border-color: #dddddd;}
	#calendar .fc-button-group .fc-button-active {background-color: #009dff; border-color: #009dff; color: white;}
	#calendar .fc-button-group button {background: white; border: 1px solid #dddddd; color: black; box-shadow: none;}
	
	.todaySchedule table tbody {border-left: 4px solid  #55beff;}
	.todaySchedule table p {margin: 0px; font-size: 0.9rem;}
	.todaySchedule table tr:last-child {border-bottom: none;}
	.todaySchedule table th {text-align: center; vertical-align: middle; border-top: none;}
	.todaySchedule table th .day {font-size: 1.2rem;}
	.todaySchedule table td {vertical-align: middle;}
	.todaySchedule table td .dt {color: #888;} 
	
</style>
<script type="text/javascript">
	$(function(){
		fn_getFullTime();	 
		fn_getTime();		
		setInterval(fn_getFullTime, 1000);
		setInterval(fn_getTime, 1000);
		
		// ?????? ????????? ???????????? ajax
		$.ajax({
			url: '/allSchedule',
			type: 'GET',
			success: function(data){
				var allScheduleList = data;
				console.log(allScheduleList);
				
	 			var calendarEl = document.getElementById('calendar');
	 			
	 			// ajax??? ????????? ???????????? map ???????????? ??????
				var schedule = allScheduleList.map(function(item) {
					return {
						title : item.sj
						, start : item.beginDt + "T" + item.beginTm
						, end : item.endDt + "T" + item.endTm
						, color : item.color
						, extendedProps : {
							schdulNo : item.schdulNo
							, empno : item.empno
							, beginDt : item.beginDt
							, endDt : item.endDt
							, beginTm : item.beginTm
							, endTm : item.endTm
							, cn : item.cn
							, sj : item.sj
							, color : item.color
							, category : item.category
							, othbcAt : item.othbcAt
						}
					}
				});
			    
	 			// ????????? ??????
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		          initialView: 'dayGridMonth'	// ??? ????????? ??? ????????? ???????????? ????????????
		          , slotMinTime: '00:00' // Day ??????????????? ?????? ??????
		          , slotMaxTime: '24:00' // Day ??????????????? ?????? ??????
		          , locale : 'ko'				// ?????? ?????????
		          , expandRows: true			// ????????? ?????? ?????? ?????????
		          , selectable: true			// ????????? ????????? ??? ??? ??????
		          , headerToolbar: {			// ?????? ??????(???, ??????, ???)
		        	  left: 'today',
		        	  center: 'prev,title,next',
		        	  right: 'dayGridMonth,timeGridWeek,timeGridDay'
		        	}
		          , dayMaxEvents: true			// ???????????? ???????????? ?????? ??????(+ ??? ???????????? ??????)
		          , events : schedule			// ?????????
				  , eventTimeFormat: { // like '14:30:00'	// ?????? ??????
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false,
					    
				   }
		          // '???' ?????? ???, ?????? ?????? ?????? ?????? ?????? ??????
		      	 ,  dateClick: function(info) {
		      		 console.log(info);
		      	    $.ajax({
		      	    	url: '/todaySchedule'
		    			, type: 'post'
		    			, data : {"beginDt" : info.dateStr}
		    			, success: function(schedule){
		    				if(schedule.length > 0){
		    					var str = '<tr>'
									+		'<th rowspan="'+ (schedule.length + 1) +'">'
									+			'<p class="day">'+ info.date.getDate() +'</p>';
									
									if(getDay(info.date.getDay()) == '???'){
										str +=		'<p class="date" style="color: #ff3535;">'+ getDay(info.date.getDay()) +'??????</p>'
									}else if(getDay(info.date.getDay()) == '???'){
										str +=		'<p class="date" style="color: #4c4cff">'+ getDay(info.date.getDay()) +'??????</p>'
									}else {
										str +=		'<p class="date">'+ getDay(info.date.getDay()) +'??????</p>'
									}
									
									str += 		'</th>'
									+	'</tr>';
									
									
								for(var i=0; i<schedule.length; i++){
									str +=	'<tr>'
											+		'<td>'
											+			'<p class="sj">'+ schedule[i].sj +'</p>';
									
									// ????????? ????????? ?????? ??????, ??????????????? ?????? ???
									if(info.dateStr == schedule[i].beginDt && info.dateStr == schedule[i].endDt){
										str += 	'<p class="dt">'+ schedule[i].beginTm +' ~ '+ schedule[i].endTm +'</p>'
										+		'</td>'
										+	'</tr>';
									}
											
									// ????????? ????????? ?????? ?????? ????????? ?????? ???
									if(info.dateStr == schedule[i].beginDt){
										str += 	'<p class="dt">'+ schedule[i].beginTm +' ~</p>'
										+		'</td>'
										+	'</tr>';
									}		
											
									// ????????? ????????? ?????? ?????? ????????? ?????? ???
									if(info.dateStr == schedule[i].endDt){
										str += 	'<p class="dt">~ '+ schedule[i].endTm +'</p>'
											+		'</td>'
											+	'</tr>';
									}else {
										// ????????? ????????? ?????? ?????? ????????? ?????? ???
										str += 	'<p class="dt">~ ??????('+ schedule[i].endDt +')</p>'
										+		'</td>'
										+	'</tr>';
									}
									
									
								}
								
								$(".todaySchedule table tbody").empty();
								
								$(".todaySchedule table tbody").append(str);
		    					
		    				}else {
		    					var str = '<tr>'
									+		'<th rowspan="2">'
									+			'<p class="day">'+ info.date.getDate() +'</p>'
									
									if(getDay(info.date.getDay()) == '???'){
										str +=		'<p class="date" style="color: #ff3535;">'+ getDay(info.date.getDay()) +'??????</p>'
									}else if(getDay(info.date.getDay()) == '???'){
										str +=		'<p class="date" style="color: #4c4cff">'+ getDay(info.date.getDay()) +'??????</p>'
									}else {
										str +=		'<p class="date">'+ getDay(info.date.getDay()) +'??????</p>'
									}
									
									str +=		'</th>'
									+	'</tr>'
									+ 	'<tr style="border-bottom: 1px solid #dddddd;">'
									+		'<td>'
									+			'<p>????????? ????????? ????????????.</p>'
									+		'</td>'
									+	'</tr>';
									
		    					
		    					
		    					$(".todaySchedule table tbody").empty();
								$(".todaySchedule table tbody").append(str);
		    				}
		    		
		    			}
		    			
		    			
		      	    });
		      	  }	
		          
			   });
		        
		        calendar.render();
			        
			}
		});
		
		
	});
	
	// ???/???/???/??????/???/???/??? ?????????
	function fn_getFullTime(){
		// ?????? ??????
		var now = new Date();
		
		// ???/???/???/??????
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		var date = now.getDate();
		var dayInt = now.getDay();
		
		// ??????(??????)??? ??????(??????)??? ?????????
		var week = new Array("?????????", "?????????", "?????????", "?????????", "?????????", "?????????", "?????????");
		var dayStr = week[dayInt]; // ?????????
		var day = dayStr.substring(0, 1); // ???
		
		// ???/???/???
		var hour = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();
		
		if(month < 10){
			month = "0" + month;
		}
		if(date < 10){
			date = "0" + date;
		}
		if(hour < 10){
			hour = "0" + hour;
		}
		if(min < 10){
			min = "0" + min;	
		}
		if(sec < 10){
			sec = "0" + sec;
		}
		
		var currentTime = year + "??? " + month + "??? " + date + "??? " + "(" + day + ") " + hour + ":" + min + ":" + sec;
		
		$(".currentTime").text(currentTime);
	}
	
	// ???/???/?????? ?????????
	function fn_getTime(){
		var now = new Date();
		
		
		// ???/???/???
		var hour = now.getHours();
		var min = now.getMinutes();
		var sec = now.getSeconds();
		
		if(hour < 10){
			hour = "0" + hour;
		}
		if(min < 10){
			min = "0" + min;	
		}
		if(sec < 10){
			sec = "0" + sec;
		}
		
		var currentTime = hour + ":" + min + ":" + sec;
		
		$(".spWorkTime").text(currentTime);
	}
	
	// getDay()??? ????????? ?????????
	function getDay(intDay){ 
		var week = ['???', '???', '???', '???', '???', '???', '???']; 
		var day = week[intDay]; 
		return day; 
	}

	
</script>
<div id="body">
	<div class="row">
		<div class="col-sm-2">
			<div class="divProfile" style="width: 100%; text-align: center;">
				<img src="/reload?fileNo=${getProfile.fileNo}">
				<p><span>${getProfile.nm}</span><span>${getProfile.ofcpsNm}</span></p>
				<span>${getProfile.deptNm}</span>
			</div>
			<div class="divWork" style="min-height: 330px;">
				<div class="divWork-title">
					<span class="title">????????????</span>
				</div>
					<p><span class="currentTime"></span></p>
				<div class="divWorkTime">
					<h2>${list4[0].tmh}h ${list4[0].tmm}m</h2>
					<span><fmt:formatNumber var="weekWorkTm" value="${list4[0].tmh / 52}" type="percent"/></span>
					<div class="divTotalWorkGraph">
						<div class="divRunWorkGraph" style="width: ${weekWorkTm};"></div>
					</div>
				</div>
				<div class="divStartWorkTime"><span class="spWorkTimeName">????????????</span><span class="spWorkTimestart"> <c:if test="${timeList[0].rcordCode eq 'D101'}">${timeList[0].tm2}</c:if></span></div>
				<div class="divEndWorkTime"><span class="spWorkTimeName">????????????</span><span class="spWorkTimeend"> <c:if test="${timeList[1].rcordCode eq 'D102'}">${timeList[1].tm2}</c:if></span></div>
				<div class="divWorkBtn">
					<button id="btnStartWork" type="button" class="btn">??????</button>
					<button id="btnEndWork" type="button" class="btn">??????</button>
					
				</div>
			</div>
			<div class="divShortcuts">
				<button type="button" class="btn" onclick="javascript:location.href='/mail/mailSend'"><i class="fas fa-envelope fa-lg mr-2" style="color: #55beff"></i>????????????</button>
				<button type="button" class="btn" onclick="javascript:location.href='/calendar/home'"><i class="fas fa-calendar-check fa-lg mr-2" style="color: lightcoral"></i>????????????</button>
				<button type="button" class="btn" onclick="javascript:location.href='/messenger'"><i class="fas fa-sms fa-lg mr-2" style="color: darkorange"></i>?????????</button>
			</div>
		</div>
		<div class="col-sm-5">
			<div class="divNewList">
					<span class="title">?????? ??????</span>
					<div class="newList">
						<table class="table">
						
							<c:if test="${not empty selectNewList}">
							<c:forEach var="newList" items="${selectNewList}">
							<c:if test="${newList.type == 'NOTICE'}">
							<tr>
								<td>
									<div class="profile">
										<img class="photo" src="/reloadByEmpno?empno=${newList.wrterEmpno}">
									</div>
									<div class="newInfo">
										<p class="sj"><a href="/notice/detail?noticeNo=${newList.no}">[??????]&nbsp;&nbsp;'${newList.sj}'&nbsp;&nbsp;??????????????? ?????????????????????.</a></p>
										<span class="wrtingTm">${newList.wrtingTm}</span><span class="nm">${newList.nm}&nbsp;${newList.ofcpsNm}</span>
									</div>
								</td>
							</tr>
							</c:if>
							<c:if test="${newList.type == 'DRFT'}">
							<tr>
								<td>
									<div class="profile">
										<img class="photo" src="/reloadByEmpno?empno=${newList.wrterEmpno}">
									</div>
									<div class="newInfo">
										<p class="sj"><a href="/EA/documentWait/detail?drftNo=${newList.no}">[??????]&nbsp;&nbsp;'${newList.sj}'&nbsp;&nbsp;??????????????? ?????????????????????.</a></p>
										<span class="wrtingTm">${newList.wrtingTm}</span><span class="nm">${newList.nm}&nbsp;${newList.ofcpsNm}</span>
									</div>
								</td>
							</tr>
							</c:if>
							<c:if test="${newList.type == 'QUSTNR'}">
							<tr>
								<td>
									<div class="profile">
										<img class="photo" src="/reloadByEmpno?empno=${newList.wrterEmpno}">
									</div>
									<div class="newInfo">
										<p class="sj"><a href="/survey/detail/${newList.no}">[??????]&nbsp;&nbsp;'${newList.sj}'&nbsp;&nbsp;????????? ?????????????????????.</a></p>
										<span class="wrtingTm">${newList.wrtingTm}</span><span class="nm">${newList.nm}&nbsp;${newList.ofcpsNm}</span>
									</div>
								</td>
							</tr>
							</c:if>
							<c:if test="${newList.type == 'TODO'}">
							<tr>
								<td>
									<div class="profile">
										<img class="photo" src="/reloadByEmpno?empno=${newList.wrterEmpno}">
									</div>
									<div class="newInfo">
										<p class="sj"><a href="/todo/board/${newList.no}">[??????]&nbsp;&nbsp;'${newList.sj}'&nbsp;&nbsp;?????? ???????????? ?????????????????????.</a></p>
										<span class="wrtingTm">${newList.wrtingTm}</span><span class="nm">${newList.nm}&nbsp;${newList.ofcpsNm}</span>
									</div>
								</td>
							</tr>
							</c:if>
							</c:forEach>
							</c:if>
							
							<c:if test="${empty selectNewList}">
							<tr style="border: none;">
								<td style="padding: 100px; text-align: center;">
									<span>?????? ????????? ????????????.</span>
								</td>
							</tr>
							</c:if>
						</table>
					</div>
				</div>
			<div class="divSimpleSurvet">
				<span class="title">???????????? ??????</span>
				
				<div class="surveyList">
				<c:if test="${not empty getSurveyList}">
				<c:forEach var="survey" items="${getSurveyList}">
				<div class="divSurvey">
					<header><span class="surveyCheckStatus">?????????</span></header>
					<div class="surveySubject">
						<h4 class="surveyTitle">${survey.qustnrSj}</h4>
						<span class="surveyDate">${survey.beginDe} ~ ${survey.endDe}</span>
					</div>
					<div class="surveyContent">
						<table class="table">
							<colgroup>
								<col width="80px">
								<col width="auto">
							</colgroup>
							<tr>
								<td><span>?????????</span></td>
								<td>${survey.wrterNm}</td>
							</tr>
							<tr>
								<td><span>????????????</span></td>
								<c:if test="${survey.othbcAt == 'Y'}">
								<td>??????</td>
								</c:if>
								<c:if test="${survey.othbcAt == 'N'}">
								<td>?????????</td>
								</c:if>
							</tr>
						</table>
						<div class="divGoSurvey">
							<button id="btnGoSurvey" type="button" class="btn" onclick="javascript:location.href='/survey/detail/${survey.qustnrNo}'">?????? ??????</button>
						</div>
					</div>
				</div>
				</c:forEach>
				</c:if>
				</div>
				
				<c:if test="${empty getSurveyList}">
					<div class="emptySurevyList">???????????? ????????? ????????????.</div>
				</c:if>
				
			</div>
		</div>
		<div class="col-sm-5">
			<div class="divSimpleCalendar">
				<div id='calendar'></div>
				<div class="todaySchedule">
					<table class="table">
						<colgroup>
							<col width="100px">
							<col width="auto">
						</colgroup>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="divNotice">
				<span class="title">????????????</span>
				<div class="noticeDiv">
					<table class="table">
						<colgroup>
							<col width="100px">
							<col width="auto">
							<col width="100px">
						</colgroup>
						<thead>
						<tr style="text-align: center;">
							<td><span>?????????</span></td>
							<td><span>??????</span></td>
							<td><span>?????????</span></td>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="notice" items="${selectNoticeList}">
						<tr>
							<td style="text-align: center;"><span>${notice.nm}</span></td>
							<td><a href="/notice/detail?noticeNo=${notice.noticeNo}">${notice.sj}</a></td>
							<td style="text-align: center;"><span><fmt:formatDate pattern="yyyy-MM-dd" value='${notice.writngTm}' /></span></td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
			<form action="/timemain" method="post" id="fm">
				<input type="hidden" id="empNo" class="fadeIn first" name="empNo">
				<input type="hidden" id="spWorkTime" class="fadeIn first" name="spWorkTime">
				<input type="hidden" id="spWorkTimeEnd" class="fadeIn second" name="spWorkTimeEnd">
				<input type="hidden" id="rcordCode" class="fadeIn third" name="rcordCode">
				<input type="hidden" id="workAccmltTm2" class="fadeIn first" name="workAccmltTm">
			</form>
<script>
$("#btnStartWork").click(function() {
	var now = new Date();
	
	// ???/???/???
	var hour = now.getHours();
	var min = now.getMinutes();
	var sec = now.getSeconds();

	if (hour < 10) {
		hour = "0" + hour;
	}
	if (min < 10) {
		min = "0" + min;
	}
	if (sec < 10) {
		sec = "0" + sec;
	}

	var currentTime = hour + ":" + min + ":" + sec;
	
	var id = "${empVo.empno}";
	$.ajax({
		url : "/ehr/insert",
		type : 'POST',
		data : {
			"empNo" : "${empVo.empno}",
			"tm3" : currentTime,
			"rcordCode" : "D101"
		},
		success : function(data) {
			$("#spWorkTime").text(currentTime);
			//console.log(rcordCode);
			$("#empNo").val(id);
			document.getElementById('fm').submit();
		}

	});

});

$("#btnEndWork").click(function() {
	var now = new Date();

	// ???/???/???
	var hour = now.getHours();
	var min = now.getMinutes();
	var sec = now.getSeconds();

	if (hour < 10) {
		hour = "0" + hour;
	}
	if (min < 10) {
		min = "0" + min;
	}
	if (sec < 10) {
		sec = "0" + sec;
	}

	var currentTime = hour + ":" + min + ":" + sec;
	var id = "${empVo.empno}";
	$.ajax({
		url : "/ehr/insert",
		type : 'POST',
		data : {
			"empNo" : "${empVo.empno}",
			"tm3" : currentTime,
			"rcordCode" : "D102"
		},
		success : function(data) {
			$("#spWorkTimeEnd").text(currentTime);
			$("#empNo").val(id);
			document.getElementById('fm').submit();
		}
	});

});
	
	if($(".spWorkTimestart").text() == " "){
		$("#btnEndWork").attr("disabled", true);
	}
	
	if($(".spWorkTimestart").text() != " "){
		$("#btnEndWork").attr("disabled", false);
		$("#btnStartWork").attr("disabled", true);
	}

	if($(".spWorkTimeend").text() != " "){
		$("#btnEndWork").attr("disabled", true);
		$("#btnStartWork").attr("disabled", true);
	}
	
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#organizationOpen:hover {cursor: pointer;}
	#organizationModal {top: 327px; left: -540px;}
	#organizationModal .modal-content {box-shadow: none; border: 8px solid #494e53;}
	#organizationModal .modal-header {background-color: #494e53; padding: 4px 10px 10px 0px; border-top-left-radius: initial; border-top-right-radius: initial;}
	#organizationModal .modal-header input {height: 30px; font-size: 0.9rem;}
	#organizationModal .modal-header button {padding-top: 18px; color: white; opacity: inherit;}
	#organizationModal .modal-body ul {font-size: 0.9rem;}
	#organizationModal .jstree-default .jstree-search {font-style: normal; color: #007bff;}
	#organizationModal .jstree-default .jstree-clicked {background: #eef1f6;}
	#organizationDetailModal {top: 327px; left: -230px;}
	#organizationDetailModal .modal-content {border: 3px solid #494e53; border-radius: 10px;} 
	#organizationDetailModal .modal-header {padding: 8px; border-bottom: 3px solid #494e53}
	#organizationDetailModal .modal-body {text-align: center;}
	#organizationDetailModal .modal-body .photo img {width: 110px; height: 100px; border-radius: 50%; margin-top: 16px;}
	#organizationDetailModal .modal-body .info {margin-top: 20px;}
	#organizationDetailModal .modal-body .info ul {padding: 0px; list-style: none; font-size: 0.9rem; color: #888;}
	#organizationDetailModal .modal-body .info ul li:first-child {font-size: 1.1rem; font-weight: bold; color: black;}
	
	#aside aside {background-color: #20aaff;}
	[class*=sidebar-dark-] .nav-sidebar>.nav-item.menu-open>.nav-link, [class*=sidebar-dark-] .nav-sidebar>.nav-item:hover>.nav-link, [class*=sidebar-dark-] .nav-sidebar>.nav-item>.nav-link:focus {background-color: rgba(255,255,255, 20%);}
	[class*=sidebar-dark] .brand-link {border-bottom: 1px solid rgba(255,255,255, 20%);}
	
	.alarm {
		font-size: 0.8rem;
	    display: inline-block;
	    float: right;
	    background: #0094ef;
	    border-radius: 50%;
	    width: 20px;
	    text-align: center;
	    margin-top: 3px;
	}
	
</style>
<div id="aside">
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/index" class="brand-link" style="text-align:center;">
      <!-- <img src="/resources/adminlte/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> -->
      <img style="width:150px;" src="/resources/img/aside_logo.png" id="icon" alt="User Icon" />
      <!-- <span class="brand-text font-weight-light">MS office</span> -->
    </a>
    
    <!-- ??????  -->
	<script>
		$(function(){
			$.ajax({
				url : "/survey/getRspnsAtIsNCount"
				, type : "post"
				, data : {"empno" : "${sessionScope.empVo.empno}"}
				, success : function(count){
					if(count == 0){
						return;
					}
					console.log(count);
					var str = '<span class="alarm">'+ count +'</span>'
					$(".aside-survey").append(str);
				}
			});
		});
		
		$(function(){
			$.ajax({
				url : "/EA/getEACount"
				, type : "post"
				, data : {"empno" : "${sessionScope.empVo.empno}"}
				, success : function(count){
					if(count == 0){
						return;
					}
					console.log(count);
					var str = '<span class="alarm">'+ count +'</span>'
					$(".EA-link").append(str);
				}
			});
		});
		
		$(function(){
			$.ajax({
				url : "/getMessageCount"
				, type : "post"
				, data : {"empno" : "${sessionScope.empVo.empno}"}
				, success : function(count){
					if(count == 0){
						return;
					}
					console.log(count);
					var str = '<span class="alarm">'+ count +'</span>'
					$(".message-link").append(str);
				}
			});
		});
		
		$(function(){
			$.ajax({
				url : "/mail/getCnfirmAtIsNCount"
				, type : "post"
				, data : {"empno" : "${sessionScope.empVo.empno}"}
				, success : function(count){
					if(count == 0){
						return;
					}
					console.log(count);
					var str = '<span class="alarm">'+ count +'</span>'
					$(".aside-mail").append(str);
				}
			});
		});
	</script>
	
    <!-- Sidebar -->
    <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition"><div class="os-resize-observer-host observed"><div class="os-resize-observer" style="left: 0px; right: auto;"></div></div><div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;"><div class="os-resize-observer"></div></div><div class="os-content-glue" style="margin: 0px -8px; width: 249px; height: 448px;"></div><div class="os-padding"><div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;"><div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item menu-open">
            <a href="/index" class="nav-link">
              <i class="nav-icon fas fa-home"></i>
              <p>
              	???
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/ehr/content" class="nav-link">
              <i class="nav-icon fas fa-briefcase"></i>
              <p>
              	????????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/EA/home" class="nav-link EA-link">
              <i class="nav-icon fab fa-accusoft"></i>
              <p>
              	????????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/mail/home" class="nav-link aside-mail">
              <i class="nav-icon far fa-envelope"></i>
              <p>
              	??????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/messenger" class="nav-link message-link">
              <i class="nav-icon fas fa-sms"></i>
              <p>
              	?????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/bogo/home" class="nav-link">
              <i class="nav-icon far fa-clipboard"></i>
              <p>
              	??????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/calendar/home" class="nav-link">
              <i class="nav-icon far fa-calendar-alt"></i>
              <p>
              	?????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/todo/home" class="nav-link">
              <i class="nav-icon fas fa-bars"></i>
              <p>
              	ToDO+
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/survey/home" class="nav-link aside-survey">
              <i class="nav-icon fas fa-chart-pie"></i>
              <p>
              	??????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/notice/list" class="nav-link">
              <i class="nav-icon fas fa-list-ul"></i>
              <p>
              	????????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/com/list" class="nav-link">
              <i class="nav-icon far fa-comment-dots"></i>
              <p>
              	????????????
              </p>
            </a>
          </li>
<!--           <li class="nav-item menu-open">
            <a href="/asset/home" class="nav-link">
              <i class="nav-icon far fa-clock"></i>
              <p>
              	??????
              </p>
            </a>
          </li> -->
          <li class="nav-item menu-open">
            <a href="/address/alladdress" class="nav-link">
              <i class="nav-icon fas fa-address-book"></i>
              <p>
              	?????????
              </p>
            </a>
          </li>
          <!-- <li class="nav-item menu-open">
            <a href="/refer/list" class="nav-link">
              <i class="nav-icon far fa-folder"></i>
              <p>
              	?????????
              </p>
            </a>
          </li>
          <li class="nav-item menu-open">
            <a href="/content" class="nav-link">
              <i class="nav-icon fas fas fa-headset"></i>
              <p>
              	????????????
              </p>
            </a>
          </li> -->
          
          <li class="nav-item menu-open" style="position: fixed; bottom: 0; margin-bottom: 5px;">
<!--             <a href="#organizationModal" class="nav-link" data-toggle="modal" > -->
			<a id="organizationOpen" class="nav-link">
              <i class="nav-icon fas fa-user-friends"></i>
              <p>
              	?????????
              </p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div></div></div><div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden"><div class="os-scrollbar-track"><div class="os-scrollbar-handle" style="height: 33.0877%; transform: translate(0px, 0px);"></div></div></div><div class="os-scrollbar-corner"></div></div>
    <!-- /.sidebar -->
  </aside>
  
  <script type="text/javascript">
  	var vo1 = "cocnrEmpnoArr";
    var bogoYn = false;
    var flag = 0;
  	$(function(){
  		// ????????? modal??? ???????????? ???????????? ?????? ????????????
  		flag = 0;
		
  		// ????????? ?????? ???
  		$("#organizationOpen").on("click", function(){
  			$("#organizationModal").css("top", "327px").css("left", "-540px");
  			flag = 1;
  			$("#organizationModal").modal("show");
  		});
  		
  		// ToDO+ - [?????? ?????????] - ????????? ?????? ?????? ???
  		$(".sharedEmpAdd").on("click", function(){
			flag = 2;
			$("#organizationModal").css("z-index", 1051).css("top", "165px").css("left", "10px");
			$("#organizationModal").modal("show");
		});
  		
  		// ?????? - [?????? ??????] - ??????????????? - ???????????? - [+??????]
  		$("#btnSurveyMemberAdd").on("click", function(){
			flag = 3;
			$("#organizationModal").css("z-index", 1051).css("top", "0px").css("left", "210px");
			$("#organizationModal").modal("show");
		});
  		
  		$.ajax({
  			url : "/organization/empList"
  			, type : "get"
  			, success : function(data){
  				// deptArr : ?????? ????????? ?????? ??????(??????)
  				var deptArr = new Array();
  				// ajax??? ?????? ???????????? jstree??? ????????? ?????? ???????????? ??????(?????? ?????? O)
  				$.each(data, function(idx, item){
//   					console.log(item);
  					if(item.suprrDeptCode == null){
  						item.suprrDeptCode = "#";
  					}
  					deptArr[idx] = {id: item.deptCode , parent:item.suprrDeptCode, text:item.deptNm, icon: "far fa-building"};
   		            
  		        });
  				
  				// dept : ?????? ????????? ?????? ????????? ?????? ??????(??????)
  				var dept = new Array();
  				// ?????? ?????? ?????? ???????????? dept??? ??????
  				dept = deptArr.filter((item1, idx1)=>{
  				    return deptArr.findIndex((item2, idx2)=>{
  				        return item1.id == item2.id;
  				    }) == idx1;
  				});
  				
  				// emp : ?????? ???????????? ?????? ??????(??????)
  				var emp = new Array();
  				// ajax??? ?????? ???????????? jstree??? ????????? ?????? ???????????? ??????(?????? ?????? X)
  				$.each(data, function(idx, item){
  					emp[idx] = {
  								id: item.empno , parent:item.deptCode, text:(item.nm + " " + item.ofcpsNm), icon : "fas fa-user-tie"
  								, data : {
  										empno : item.empno
  										, deptCode : item.deptCode
		  								, rspofcCode : item.rspofcCode       
		  								, ofcpsCode : item.ofcpsCode
		  								, suprrEmpno : item.suprrEmpno
		  								, nm : item.nm             
		  								, email : item.email         
		  								, telno : item.telno            
		  								, zip : item.zip             
		  								, adres : item.adres            
		  								, adresDetail : item.adresDetail     
		  								, ecnyDe : item.ecnyDe          
		  								, retireDe : item.retireDe         
		  								, resveConfmAuthor : item.resveConfmAuthor 
		  								, fileNo : item.fileNo
		  								, fileNm : item.fileNm           
		  								, fileCours : item.fileCours       
		  								, fileOrginlNm : item.fileOrginlNm     
		  								, deptNm : item.deptNm          
		  								, rspofcNm : item.rspofcNm         
		  								, ofcpsNm : item.ofcpsNm
		  								, groupNm : "MS??????"
  									}
  								};
  		        });
  				
  				// result : detp??? emp??? ?????? ??????(??????)
				var result = new Array();
  				// emp ????????? result??? ??????
				$.each(emp, function(idx, itme){
					result.push(emp[idx]);
				});
				// dept ????????? result??? ??????
				$.each(dept, function(idx, itme){
					result.push(dept[idx]);
				});
				console.log(result);
  				
  				// ?????????(jstree) ????????????
   				$("#treeView").jstree({
   					"plugins" : ["search"]
   					, "core" : {data: result}
   				});
  				
  				// ????????? ????????? ????????????..
   				$('#treeView').bind("loaded.jstree", function(e) {
   					
   					// ?????? ?????? ????????? ?????? ????????? ?????? ???????????? ??????
   					var allMemberData = $('#treeView').jstree(true).get_json('#', {flat:true});
   					if($("#surveyMemberAllSelect").prop("checked") == true){
	   					for(var i=0; i<allMemberData.length; i++){
	   						if(allMemberData[i].data.empno != null){
		   						var str = '<div class="col-sm-2 surveyMember">'
			   	 					+	'<input type="hidden" name="trgterEmpnoArr" value="'+ allMemberData[i].data.empno +'">'
			   	 					+	'<span class="trgterNm">'+ allMemberData[i].data.nm + " " + allMemberData[i].data.ofcpsNm +'</span><a class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
			   	 					+ '</div>';	
			   	 					
		   						$("#addMemberList").append(str);
	   						}	
	   					}
   					}
   					
   					// ????????? ?????? ??????
	   				$('#treeView').jstree().open_node($("#A100_anchor"));
   					// ?????? ??????
   	   			  	$("#organizationModal input[name='keyword']").keyup(function () {
 		   			      var keyword = $("#organizationModal input[name='keyword']").val();
 		   			      $('#treeView').jstree(true).search(keyword);
   	   			  	});
   					
   				}.bind(this));
   				
				
   				// ????????? ?????? ?????? ??? ?????? ???????????? ??????
  				$("#treeView").bind("select_node.jstree", function(e){
	   	   			var nodeInfo = $(this).jstree('get_selected', true);// ?????? ????????? ?????? ??????
	   	   			if(flag == 11){
	   	   				if(nodeInfo[0].data == null){ //??? ????????? ???????????? ???
	   	   					console.log(nodeInfo[0].id);
	   	   					console.log(nodeInfo[0].text);
	   	   					$("#coDept").text(nodeInfo[0].text);
	   	   					$("#coDept").append("<input type='hidden' name='coDeptCode' value='"+ nodeInfo[0].id +"'>");
	   	   				}
	   	   				return;
	   	   			}
	   	   			var nodeData = nodeInfo[0].data; 	// ?????? ?????? data ????????? ????????? ??????
 		   	   			//console.log(nodeInfo);
	   	   			console.log(nodeData);
	   	   			// data?????? ????????? ?????? ?????? ??? 
	   	   			if(nodeData != null){
	   	   				if(flag == 12){ //????????? ????????? ?????????
		   	   				var cocnrNm = nodeData.nm;
		   	   				var cocnrEmpno = nodeData.empno;
		   	   				var cocnrOfcpsNm = nodeData.ofcpsNm;
			   	   			var repeatYn = true;
   	   				 		if($("#memberList .empno").length > 0){
   	   				 			if($("#memberList .empno").length > 3){ //????????? ?????? 4?????????
   	   				 				repeatYn = false; 
  				 					return;
   	   				 			}
   	   				 			
   	   				 			$("#memberList .empno").each(function(idx, item){
   	   				 				console.log($(item).val());
   	   				 				if($(item).val() == cocnrEmpno){
   	   				 					repeatYn = false;
   	   				 					return;
   	   				 				} 
	   	   				 		})
   	   				 		}
		   	   				if(repeatYn){
				   	   			var idx = $("#memberList .empno").length;
		   	   					var vo1 = 'empVoList['+idx+'].empno';
				   	   			var str = '<div class="col-sm-4 emp">'
			   	 					+	'<input type="hidden" class="empno" name="'+vo1+'" value="'+ cocnrEmpno +'">'
			   	 					+	'<span class="cocnrNm">'+ cocnrNm + '</span> <span class="cocnrOfcpsNm">' + cocnrOfcpsNm +'</span><a href="#" class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
			   	 					+ '</div>';
			   	 				$("#memberList").append(str);
		   	   				}
	   	   				}
	   	   				if(flag == 1){
	   	   					var fileCours = nodeData.fileCours;
	   	   					var fileNm = nodeData.fileNm;
	   	   					var imgSrc = "/reload?fileNo=" + nodeData.fileNo;
	   	   					console.log(imgSrc);
	   	   					
		   	   				$("#organizationDetailModal .photo img").attr("src", imgSrc);
  		   	   				//$("#organizationDetailModal .photo img").attr("src", nodeData.fileCours);
		   	   				$("#organizationDetailModal .name").text(nodeData.nm);
		   	   				$("#organizationDetailModal .ofcpsNm").text(nodeData.ofcpsNm);
		   	   				$("#organizationDetailModal .email").text(nodeData.email);
		   	   				$("#organizationDetailModal .group").text(nodeData.groupNm);
		   	   				$("#organizationDetailModal .deptNm").text(nodeData.deptNm);
		   	   				$("#organizationDetailModal .rspofcNm").text(nodeData.rspofcNm);
		   	   				$("#organizationDetailModal .tel").text(nodeData.telno);
		   	   				
		   	   				
			   	   			$("#organizationDetailModal").modal("show");	
	   	   				}
	   	   				
	   	   				// ToDO+ - [?????? ?????????] - ????????? ?????? - ?????? ?????? ???
	   	   				if(flag == 2){
	   	   					if(bogoYn){
	   	   					var cocnrNm = nodeData.nm;
		   	   				var cocnrEmpno = nodeData.empno;
		   	   				var cocnrOfcpsNm = nodeData.ofcpsNm;
		   	   				var repeatYn = true;
	   	   					//
	   	   				 		if($("#memberList .empno").length > 0){
	   	   				 			$("#memberList .empno").each(function(idx, item){
	   	   				 				console.log($(item).val());
	   	   				 				if($(item).val() == cocnrEmpno){
	   	   				 					repeatYn = false;
	   	   				 					return;
	   	   				 				} 
		   	   				 		})
	   	   				 		}
	   	   				 		
	   	   					//
	   	   					if(repeatYn){
	   	   						if(chk2 == 1){//?????????
		   	   						idx = $("#memberList .empno").length;
			   	   					vo1 = 'empVoList['+idx+'].empno';
	   	   						}if(chk2 == 2){//?????????
	   	   							console.log("??????????");
		   	   						idx = $("#memberList .empno").length;
			   	   					vo1 = 'empVoList2['+idx+'].empno';
	   	   						}
			   	   				var str = '<div class="col-sm-4 emp" style="float:left; width:140px;">'
				   	 					+	'<input type="hidden" class="empno" name="'+vo1+'" value="'+ cocnrEmpno +'">'
				   	 					+	'<span class="cocnrNm">'+ cocnrNm + " " + cocnrOfcpsNm +'</span><a href="#" class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
				   	 					+ '</div>';
		   	   					
			   	   			if(chk2 == 1){	
			   	 				$("#memberList").append(str);
			   	   			}
			   	 			if(chk2 == 2){
			   	 				$("#memberList1").append(str);
			   	 			}
	   	   					}
	   	   					
	   	   					}else{
	   	   					var cocnrNm = nodeData.nm;
		   	   				var cocnrEmpno = nodeData.empno;
		   	   				var cocnrOfcpsNm = nodeData.ofcpsNm;
		   	   				var cocnrEmpnoArr = $("#memberList input[name='cocnrEmpnoArr']");
		   	   				var cocnrEmpnoArr1 = $("#memberList1 input[name='cocnrEmpnoArr']");
		   	   				
		   	   				for(var i=0; i<cocnrEmpnoArr.length; i++){
			   	   				if(cocnrEmpno == cocnrEmpnoArr[i].value){
			   	   					alert("?????? ????????? ???????????????.");
			   	   					return false;
			   	   				}else {
				   	   				var str = '<div class="col-sm-4">'
				   	 					+	'<input type="hidden" name="cocnrEmpnoArr" value="'+ cocnrEmpno +'">'
				   	 					+	'<span class="cocnrNm">'+ cocnrNm + " " + cocnrOfcpsNm +'</span><a href="#" class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
				   	 					+ '</div>';	
			   	   				}	
		   	   				}
		   	   				for(var i=0; i<cocnrEmpnoArr1.length; i++){
			   	   				if(cocnrEmpno == cocnrEmpnoArr1[i].value){
			   	   					alert("?????? ????????? ???????????????.");
			   	   					return false;
			   	   				}else {
				   	   				var str = '<div class="col-sm-4">'
				   	 					+	'<input type="hidden" name="cocnrEmpnoArr1" value="'+ cocnrEmpno +'">'
				   	 					+	'<span class="cocnrNm">'+ cocnrNm + " " + cocnrOfcpsNm +'</span><a href="#" class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
				   	 					+ '</div>';	
			   	   				}	
		   	   				}
		   	   			if(chk2 == 1){	
		   	 				$("#memberList").append(str);
		   	   			}
		   	 			if(chk2 == 2){
		   	 				$("#memberList1").append(str);
		   	 			}
	   	   					}
	   	   				}
	   	   				
	   	   				// ?????? ????????? ??????
	   	   				if(flag == 3){
		   	   				var trgterNm = nodeData.nm;
		   	   				var trgterEmpno = nodeData.empno;
		   	   				var trgterOfcpsNm = nodeData.ofcpsNm;
		   	   				var trgterEmpnoArr = $("#addMemberList input[name='trgterEmpnoArr']");
		   	   				console.log(trgterEmpnoArr);
		   	   				
			   	   			var str = '<div class="col-sm-2 surveyMember">'
		   	 					+	'<input type="hidden" name="trgterEmpnoArr" value="'+ trgterEmpno +'">'
		   	 					+	'<span class="trgterNm">'+ trgterNm + " " + trgterOfcpsNm +'</span><a class="deleteMember" onclick="fn_deleteMember(this)"><i class="fas fa-times-circle"></i></a>'
		   	 					+ '</div>';	
			   	   			
		   	 					
		   	 				if(trgterEmpnoArr.length == 0){
		   	 					$("#addMemberList").append(str);	
		   	 				}else {
			   	 				for(var i=0; i<trgterEmpnoArr.length; i++){
				   	   				if(trgterEmpno == trgterEmpnoArr[i].value){
				   	   					alert("?????? ????????? ???????????????.");
				   	   					return false;
				   	   				}
			   	 				}
			   	 				
			   	 				$("#addMemberList").append(str);
		   	 				}
	   	   				}
	   	   				
	   	   			} // end first if
		   	   			
  				});

  			} // end ajax success
  		
  		}); // end aja
  	});
  </script>
  <!-- ????????? modal -->
  <div class="modal" id="organizationModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <input type="text" class=form-control name="keyword" placeholder="??????/??????/??????">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" id="treeView">

        </div>
        
      </div>
    </div>
  </div>
  
  <!-- ????????? ?????? modal -->
  <div class="modal" id="organizationDetailModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
			<div class="photo">
				<img src="">
			</div>
			<div class="info">
				<ul>
					<li><span class="name"></span>&nbsp;<span class="ofcpsNm"></span></li>
					<li><span class="email"></span></li>
					<li><span class="group"></span></li>
					<li><span class="deptNm"></span>&nbsp;&nbsp;<span class="rspofcNm"></span></li>
					<li><span class="tit">Tel.</span>&nbsp;<span class="tel"></span></li>
				</ul>
			</div>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
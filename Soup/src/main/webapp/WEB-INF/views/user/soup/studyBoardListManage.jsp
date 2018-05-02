<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/studyManage.css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css">
<link rel="stylesheet" href="resources/css/ui.jqgrid.css">
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/grid.locale-kr.js"></script>
<script src="resources/js/jquery.jqGrid.js"></script>
<script type="text/javascript">

	function memostart() {
		
		$.ajax({
			type:"post",
			url:"startmemo.do",
			data:"soup_no=${soupNo }",
			success:function(msg) {
				$(".memo textarea").attr("readonly", false);
				$(".memo_start_btn").css("display", "none");
				$(".memo").append("<div class='memo_update_btn'><button class='btn btn-default' onclick='memoupdate()'>저장</button></div>");
				
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
	
	function memoupdate() {
		
		var data = $(".memo_area").val();
		
		$.ajax({
			type:"post",
			url:"updatememo.do",
			data:"soup_no=${soupNo }&memo_content=" + data,
			success:function(msg) {
				alert("저장되었습니다.");
			},error:function(statusCode) {
				alert("error : " + statusCode.status);
			}
		});
	}
		
	$( document ).ready(function() {
		
		var delay = (function() {
			
			var timer = 0;
			
			return function(callback, ms) {
				
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
			
			};
			
		})();
		
		$(".memo_area").keyup(function() {
			
			delay(function(){
				
				var data = $(".memo_area").val();
				
				$.ajax({
					type:"post",
					url:"updatememo.do",
					data:"soup_no=${soupNo }&memo_content=" + data,
					success:function(msg) {
					},error:function(statusCode) {
						alert("error : " + statusCode.status);
					}
				});
				
			}, 2000 );
			
		});
		
		

	});

</script>
<section class="container">
	<div class="clearfix">
		<ul class="nav navbar-nav navbar-light">
			<li class="navMenu"><a href="myStudy.do?soupNo=${soupNo }">나의 스터디</a></li>
			<li class="navMenu"><a href="studyschedule.do?soup_no=${soupNo }">일정관리</a></li>
			<li class="navMenu"><a href="studyCurriculum.do?soup_no=${soupNo }">커리큘럼</a></li>
			<li class="navMenu"><a href="evaluateChart.do?soup_no=${soupNo }">커리큘럼 차트</a></li>
			<li class="navMenu"><a href="studyBoardList.do?soup_no=${soupNo }">게시판</a></li>
		</ul>				
	</div>
	<div class="inner_container">
		<div class="memo">
			<c:choose>
				<c:when test="${empty memo }">
					<div>				
						<div><textarea class="memo_area form-control" readonly="readonly"></textarea></div>				
					</div>
					<div class="memo_start_btn">
						<div class="memo_start_btn_img"><span class="glyphicon glyphicon-edit"></span></div>
						<p>메모기능을 사용하시려면<br>활성화 시켜셔야 합니다.<br>활성화 버튼을 누르시고<br>메모기능을 사용하시기<br>바랍니다.</p>
						<button class="btn btn-default" onclick="memostart()">메모 활성화</button>
					</div>
				</c:when>
				<c:otherwise>
					<div>				
						<div><textarea class="memo_area form-control">${memo.memoContent }</textarea></div>				
					</div>
					<div class="memo_update_btn">
						<button class="btn btn-default" onclick="memoupdate()">저장</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="content">
			<table id="jqGrid"></table>
			<div id="jqGridPager"></div>
			<a class="btn btn-default" href="studyBoardWriteForm.do?soup_no=${soupNo }">글쓰기</a>
		</div>
	</div>   
</section>
<script type="text/javascript">

        $(function(){

            var grid = $("#jqGrid");

            grid.jqGrid({
				url: "jqGridList.do?soup_no=" + ${soupNo },
				mtype: 'GET',
                datatype: "json",
                width: 916,
                height: 'auto',
                colNames:['No.','제목', '작성자', '작성일','조회수'],
                colModel:[

                    {name:'boardNo',index:'No.', width:20, align:"center"},
                    {name:'title',index:'제목', width:90, formatter:custom_link},
                    {name:'name',index:'작성자', width:30, align:"center"},
                    {name:'dateCreated',index:'작성일', width:60, align:"center"},
                    {name:'hits',index:'조회수', width:20, align:"center"}   

                ],
                loadonce : true,
                sortname : 'CategoryName',
                rowNum: 20,
                pager: "#jqGridPager",
                caption: "게시판",
                jsonReader : { 
                	root:"jsonObjAll",
			    	repeatitems : false,

			    }

            });
            
           /*  $('#jqGrid').navGrid('#jqGridPager',
                    { edit: false, add: false, del: false, search: true, refresh: true, view: false, position: "left", cloneToTop: true });
    			$("#jqGrid").jqGrid('menubarAdd',  [
    				{
    					id : 'das',
    					//cloasoncall : true,
    					title : 'Sort by Category',
    					click : function ( event) {
    						$("#jqGrid").jqGrid('sortGrid','CategoryName');
    					}
    				},
    				{
    					divider : true,
    				},
    				{
    					id : 'was',
    					//cloasoncall : true,
    					title : 'Toggle Visibility',
    					click : function ( event) {
    						var state = (this.p.gridstate === 'visible') ? 'hidden' : 'visible';
    						$("#jqGrid").jqGrid('setGridState',state);
    					}
    				}
    			]); */

            
            function custom_link(cellValue, options, rowdata, action) {
            	          	
            	var result = "<a href='studyBoardDetail.do?board_no=" + rowdata.boardNo + "&soup_no=" + ${soupNo } + "'>" + cellValue + "</a>";
            	
            	return result;
            }
			
            

        });
        
       
    </script>
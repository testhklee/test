<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/css/ui.jqgrid.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/plugins/css/ui.multiselect.css">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/i18n/grid.locale-kr.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.2/jquery.jqgrid.src.js"></script>

<table id="list4"></table>
<div id="pager4"></div>
<script type="text/javascript">
	jQuery("#list4").jqGrid({
		datatype: "local",
		height: 250,
	   	colNames:['#','이메일', '이름', '전화번호','등급','가입일','탈퇴일'],
	   	colModel:[
	   		{name:'id',index:'id', width:60, sorttype:"int"},
	   		{name:'invdate',index:'invdate', width:90, sorttype:"date"},
	   		{name:'name',index:'name', width:100},
	   		{name:'amount',index:'amount', width:80, align:"right",sorttype:"float"},
	   		{name:'tax',index:'tax', width:80, align:"right",sorttype:"float"},		
	   		{name:'total',index:'total', width:80,align:"right",sorttype:"float"},		
	   		{name:'note',index:'note', width:150, sortable:false}		
	   	],
	   	multiselect: true,
	   	caption: "회원 관리",
	   	pager : "#pager4",
	   	rowNum : 10,
	   	rowList : [10,20,30]
	});
	var mydata = [
			{id:"1",invdate:"2007-10-01",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"2",invdate:"2007-10-02",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"3",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
			{id:"4",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"5",invdate:"2007-10-05",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"6",invdate:"2007-09-06",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"},
			{id:"7",invdate:"2007-10-04",name:"test",note:"note",amount:"200.00",tax:"10.00",total:"210.00"},
			{id:"8",invdate:"2007-10-03",name:"test2",note:"note2",amount:"300.00",tax:"20.00",total:"320.00"},
			{id:"9",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"}
			];
	for(var i=0;i<=mydata.length;i++)
		jQuery("#list4").jqGrid('addRowData',i+1,mydata[i]);
</script>
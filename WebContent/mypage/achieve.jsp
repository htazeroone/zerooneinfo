<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/form.css" />

<style type="text/css">

#barchart_values{
/*	background-color: pink;
   /*  margin: 0 auto; */

  	 position: absolute;
	 left: 28%;
	 top: 20%;
 	 margin-left: -250px;
	 margin-top: -250px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="../../js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="../../js/jquery-ui.min.js"></script>
  <script type="text/javascript">

  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  var arrName = new Array();
  var arrO = new Array();
  var arrX = new Array();
  /* var arrSum = new Array(); */
  var arrTotal = new Array();
  var arrQNum = new Array();
  var subject = '${subject}';

 	window.onload=function(){

	function console(ddd){
		$("#conn").append(ddd+"<br>");
	}

	   /* alert("들어오는가"); */

	  <c:forEach var="n" items="${chName}" varStatus="no">
	  	arrName.push("${n}");
	  </c:forEach>

	  <c:forEach var="o" items="${resultONum}" varStatus="no">
	  	arrO.push("${o}");
	  </c:forEach>

	  <c:forEach var="x" items="${resultXNum}" varStatus="no">
	  	arrX.push("${x}");
	  </c:forEach>

	  <c:forEach var="tn" items="${ resultTotalNum}" varStatus="no">
	  	arrTotal.push("${tn}");
	  </c:forEach>

	  <c:forEach var="qn" items="${eachQNum}" varStatus="no">
	  	arrQNum.push("${qn}");
	  </c:forEach>

  };
  function drawChart() {

	 var data = new google.visualization.DataTable();

	 data.addColumn('string', 'AA');
	 data.addColumn('number', '맞은 개수');
	 data.addColumn('number', '틀린 개수');
	 data.addColumn('string', { role: 'annotation' });

	 for(var i = 0; i< ${totalChNum}; i++){
 		 if(Number(arrO[i])==0 && Number(arrX[i])==0){
			data.addRow([arrName[i]+'('+arrTotal[i]+'/'+arrQNum[i]+')', null,  null, '']);
		 }else if(Number(arrO[i])==0){
			data.addRow([arrName[i]+'('+arrTotal[i]+'/'+arrQNum[i]+')', null,  Number(arrX[i]), '']);

		 } else if(Number(arrX[i])==0){
			data.addRow([arrName[i]+'('+arrTotal[i]+'/'+arrQNum[i]+')', Number(arrO[i]),  null, '']);

		 } else{
		 	data.addRow([arrName[i]+'('+arrTotal[i]+'/'+arrQNum[i]+')', Number(arrO[i]),  Number(arrX[i]), '']);
		 }
	 }
      var view = new google.visualization.DataView(data);

      view.setColumns([0,
          { calc: "stringify",
            sourceColumn: 1,
            type: "string",
            role: "annotation" },
          1,
          2,
          { calc: "stringify",
            sourceColumn: 2,
            type: "string",
            role: "annotation" }

          ]);

      var options = {
    	  title: ''+subject+' 문제 정오답 결과',
    	  fontSize: 15,
    	  backgroundColor: '#d9e1e8',
    	  series: {
              0: { color: '#fe4365' },
              1: { color: '#fc9d9a' }
            },
    	  vAxis: {title:'Chapter'},
    	  hAxis: {title:'Number of Quiz'},
          width: 1300,
          height: 600,
          /* height : 500,
          width : '100%',  */
          legend: { position: 'top', maxLines: 5},
          bar: { groupWidth: '75%' },
          isStacked: true
        };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  };


  </script>


	<div id="barchart_values" ></div>

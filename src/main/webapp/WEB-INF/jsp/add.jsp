<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resource/css/css.css">
<script type="text/javascript"
	src="<%=request.getContextPath() %>/resource/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/resource/js/axios.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/resource/My97DatePicker/WdatePicker.js"></script>

<script type="text/javascript">
$.prototype.serializeObject=function(){  
    var obj=new Object();  
    $.each(this.serializeArray(),function(index,param){  
        if(!(param.name in obj)){  
            obj[param.name]=param.value;  
        }  
    });  
    return obj;  
}; 
//添加
// function add() {
// var param = $("form").serialize();
// $.post("addMovie",param,function(flag){
// 	if (flag) {
// 		alert("添加成功!");
// 		location = "list";
// 	} else {
// 		alert("添加失败!");
// 	}
// },"json")
// }


$(document).ready(function(){
	alert(123);
	//先测试接口
	axios.get("getDepartList?").then(function(res){
		console.log(res.data);
// 		alert(res.data);
		for(var i=0; i<res.data.length; i++){
			var tmp=res.data[i];
			$("select[name='departid']").append("<option value='"+tmp.departid+"' >"+tmp.departname+"</option>")
		}
		
	});
	
	axios.get("getJobList").then(function(res){
		console.log(res.data);
		for(var i=0; i<res.data.length; i++){
			var tmp=res.data[i];
			$("select[name='jobid']").append("<option value='"+tmp.jobid+"' >"+tmp.jobname+"</option>")
		}
	});
});

function add(){
	console.log($("select[name='departid']").val());
	//check
	if($("select[name='departid']").val()==""){
		alert("部门不能为空");
		return false;
	}
	
// 	axios.get("addEmp",{params: this.empBean})
	//add
// 	var param = $("form").serialize();//转化为字符串
// 	var param = $("form").serializeArray();//转化为json数组
	var param = $("form").serializeObject();//转化为json对象
	
// 	$.parseJSON( param );
	
	axios.get("addEmp?",{params: param}).then(function(res){
		console.log(res)
	});
}

</script>
</head>
<body>

<form>
<table>
<tr>
	<td>empid:</td>
	<td><input type="text" name="empid"></td>
</tr>
<tr>
	<td>empname:</td>
	<td><input type="text" name="empname"></td>
</tr>
<tr>
	<td>empdesc:</td>
	<td><input type="text" name="empdesc"></td>
</tr>
<tr>
	<td>birth:</td>
	<td><input type="text" name="birth" onclick="WdatePicker()">
</td>
<tr>
	<td>depart:</td>
	<td><select name="departid" >
		<option value="">空</option>
	</select>
	</td>
</tr>
<tr>
	<td>job:</td>
	<td><select name="jobid" >
		<option value="">空</option>
	</select>
	</td>
</tr>
<tr>
	<td></td>
	<td><input type="button" value="添加" onclick="add()"></td>
	</tr>
</table>
</form>

</body>
</html>
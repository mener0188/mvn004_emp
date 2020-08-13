<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/css.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/axios.min.js"></script>

<script type="text/javascript">
  //注销
  function logout() {
	location = "logout";
}
  //跳转到添加
  function add() {
	location = "toAdd";
}
  //跳转到修改
  function update(empid) {
	location = "toUpdate?empid="+empid;
}
  //单删
  function del(empid) {
	  axios.get("deleteEmp?empid="+empid).then(function(res){
		  if(res.data=="success"){
			  location.reload();
		  }
	  });
// 	if (confirm("确定删除编号为"+mid+"的数据吗?")) {
// 		$.post("delete",{mid:mid},function(flag){
// 			if (flag) {
// 				alert("删除成功!");
// 				location = "list";
// 			} else {
// 				alert("删除失败!");
// 			}
// 		},"json")
// 	}
}
  //批量删除
  function plsc() {
	var mid = "";
	var ids=[];
	$(":checkbox:checked").each(function(){
		mid += ","+$(this).val();
		ids.push($(this).val())
	})
	//上面的是缩写
	//$("input[type='checkbox']:checked")
	alert(mid);
	mid = mid.substring(1);
	console.log(ids)
	//调用单删的函数
	axios.get("plsc?ids="+ids).then(function(res){
		if(res.data=="success"){
			location.reload();
		}
	});
	
}
  //全选
  function qx() {
	$("[name='ck']").prop("checked",true);
}
  //全不选
  function qbx() {
	$("[name='ck']").prop("checked",false);
}
  //反选
  function fx() {
	$("[name='ck']").each(function(){
		this.checked = !this.checked;
	})
}
</script>
</head>
<body>

<form action="list" method="post">
电影名称:<input type="text" name="mname" value="${mname }">
<input type="submit" value="搜索">
</form>

<table>
   <tr>
      <td></td>
      <td>empid</td>
       <td>empname</td>
       <td>empdesc</td>
       <td>departid</td>
       <td>jobid</td>
       <td>shengid</td>
       <td>shiid</td>
       <td>xianid</td>
       <td>age</td>
       <td>sex</td>
       <td>birth</td>
     <td>
        <input type="button" value="添加" onclick="add()">
     </td>
   </tr>
   <c:forEach items="${empList }" var="m">
     <tr>
       <td>
         <input type="checkbox" name="ck" value="${m.empid }">
       </td>
       <td>${m.empid }</td>
       <td>${m.empname }</td>
       <td>${m.empdesc }</td>
       <td>${m.departid }</td>
       <td>${m.jobid }</td>
       <td>${m.shengid }</td>
       <td>${m.shiid }</td>
       <td>${m.xianid }</td>
       <td>${m.age }</td>
       <td>${m.sex }</td>
       <td>${m.birth }</td>
       <td>
           <input type="button" value="修改" onclick="update(${m.empid})">
           <input type="button" value="删除" onclick="del(${m.empid})">
       </td>
     </tr>
   </c:forEach>
   <tr>
      <td colspan="11">
         <input type="button" value="全选" onclick="qx()">
         <input type="button" value="全不选" onclick="qbx()">
         <input type="button" value="反选" onclick="fx()">
         <input type="button" value="批量删除" onclick="plsc()">
      </td>
   </tr>
   <tr>
      <td colspan="11">
         ${fenye }
      </td>
   </tr>
</table>

</body>
</html>
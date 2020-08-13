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
  function update(mid) {
	location = "toUpdate?mid="+mid;
}
  //单删
  function delOne(mid) {
	if (confirm("确定删除编号为"+mid+"的数据吗?")) {
		$.post("delete",{mid:mid},function(flag){
			if (flag) {
				alert("删除成功!");
				location = "list";
			} else {
				alert("删除失败!");
			}
		},"json")
	}
}
  //批量删除
  function delMany() {
	var mid = "";
	$(":checkbox:checked").each(function(){
		mid += ","+$(this).val();
	})
	mid = mid.substring(1);
	//调用单删的函数
	delOne(mid);
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
<h1>欢迎用户${sessionScope.user.name }登录页面!</h1>
<input type="button" value="注销" onclick="logout()">

<form action="list" method="post">
电影名称:<input type="text" name="mname" value="${mname }">
<input type="submit" value="搜索">
</form>

<table>
   <tr>
     <td></td>
     <td>电影编号</td>
     <td>电影名称</td>
     <td>剧情介绍</td>
     <td>导演</td>
     <td>发行日期</td>
     <td>类型</td>
     <td>操作
        <input type="button" value="添加" onclick="add()">
     </td>
   </tr>
   <c:forEach items="${list }" var="m">
     <tr>
       <td>
         <input type="checkbox" name="ck" value="${m.mid }">
       </td>
       <td>${m.mid }</td>
       <td>${m.mname }</td>
       <td>${m.content }</td>
       <td>${m.author }</td>
       <td>${m.datea }</td>
       <td>${m.tname }</td>
       <td>
           <input type="button" value="修改" onclick="update(${m.mid})">
           <input type="button" value="删除" onclick="delOne(${m.mid})">
       </td>
     </tr>
   </c:forEach>
   <tr>
      <td colspan="11">
         <input type="button" value="全选" onclick="qx()">
         <input type="button" value="全不选" onclick="qbx()">
         <input type="button" value="反选" onclick="fx()">
         <input type="button" value="批量删除" onclick="delMany()">
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
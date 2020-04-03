<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var req;
	function validate() {
		//获取表单提交的内容  
		var idField = document.getElementById("item_id");
		var nmField = document.getElementById("item_nm");
		//创建一个XMLHttpRequest对象req  
		if (window.XMLHttpRequest) {
			//IE7, Firefox, Opera支持  
			req = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			//IE5,IE6支持  
			req = new ActiveXObject("Microsoft.XMLHTTP");
		}

		/*GET方式*/
		//访问validate.do这个servlet，同时把获取的表单内容idField加入url字符串，以便传递给validate.do  
		//var url = "AjaxServlet?id=" + escape(idField.value);
		/* 
		 open(String method,String url, boolean )函数有3个参数 
		 method参数指定向servlet发送请求所使用的方法，有GET,POST等 
		 boolean值指定是否异步，true为使用，false为不使用。 
		 我们使用异步才能体会到Ajax强大的异步功能。 
		 */
		//req.open("GET", url, true);
		//onreadystatechange属性存有处理服务器响应的函数,有5个取值分别代表不同状态  
		//req.onreadystatechange = callback;
		//send函数发送请求  GET方式
		//req.send(null);
		/*POST方式*/
		var url = "AjaxServlet";
		req.open("POST", url, true);
		//onreadystatechange属性存有处理服务器响应的函数,有5个取值分别代表不同状态  
		req.onreadystatechange = callback;
		//注意,使用POST方法提交,在请求发送之前,必须要加上如下一行:
		req.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		//req.setRequestHeader("Content-Type", "application/json");
		//send函数发送请求  POST方式
		//req.send("id=" + idField.value);
		//req.send('{"id":"lzd"}');
		req.send("id=" + idField.value + "&nm="  + nmField.value);
		//idobj = {
		//	"id" : idField,
		//	"nm" : nmField
		//}
		//req.send(idobj.toJSONString());
		//req.send(JSON.stringify(idobj));
	}

	function callback() {
		if (req.readyState == 4 && req.status == 200) {
			var check = req.responseText;
			show(check);
		}
	}

	function show(str) {
		var jsonObj = eval("(" + str + ")");
		var show = jsonObj.msgId;
		document.getElementById("info").innerHTML = show;
		/* 		if (str == "OK") {
			 var show = "<font color='green'>恭喜！！用户名可用！</font>";
			 document.getElementById("info").innerHTML = show;
			 } else if (str == "NO") {
			 var show = "<font color='red'>对不起，用户名不可用！！请重新输入！</font>";
			 document.getElementById("info").innerHTML = show;
			 } */
	}
</script>
</head>
<body>
	<form action="" method="get" name="form">
		<br> 输入用户名： <input type="text" size="10" maxlength="8"
			id="item_id" name="item_id" onblur="validate()"> <span
			id="info"></span> <br> 输入商品名： <input type="text" size="10"
			maxlength="8" id="item_nm" name="item_nm">
	</form>
</body>
</html>
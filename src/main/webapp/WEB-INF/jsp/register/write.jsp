<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>게시글 입력</title>
</head>
<body>
	<h2>게시글</h2>
	<form action="./app/complete" method="post">
		<p>
			제목:<br> <input type="text" name="title" value="${param.title }">
		</p>
		<p>
			내용:<br> <input type="text" name="context" value="${param.context }">
		</p>
		
		<button type="submit">저장</button>
	</form>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>게시판</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>메일 쓰기</h2>
	<p>
		<a href="./app/letter/receiveList">받은 메일함</a>
	</p>
	<form action="./app/letter/send" method="post">
		<p>받을 분 메일 주소 :</p>
		<p>
			<input type="text" name="receiverId" value="${param.receiverId }"/>
			<input type="text" name="receiverName" value="${param.receiverName }"/>
		</p>
		<p>제목 :</p>
		<p>
			<input type="text" name="title" maxlength="100" style="width: 100%;" required>
		</p>
		<p>내용 :</p>
		<p>
			<textarea name="content" style="width: 100%; height: 200px;" required></textarea>
		</p>
		<p>
			<button type="submit">보내기</button>
		</p>
	</form>
</body>
</html>

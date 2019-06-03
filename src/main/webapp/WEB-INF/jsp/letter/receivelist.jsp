<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>게시판</title>
<style type="text/css">
table {
	margin-top: 10px;
	border-collapse: collapse;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	width: 100%;
}
th, td {
	padding: 5px 0;
}
th {
	border-bottom: 1px solid gray;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>받은 메일 목록</h2>
	<p>
		<a href="./app/letter/sendForm">메일 보내기</a>
	</p>
	<p>전체 ${totalCount }건</p>
	<form action="./app/letter/reciveList">
		<input type="number" name="page" value="${param.page }" placeholder="페이지"
			min="1" max="${totalCount / 100 + 1 }" step="1" style="width: 50px;">
		<button type="submit">조회</button>
	</form>
	<table>
		<thead>
			<tr>
				<th>메일 번호</th>
				<th>제목</th>
				<th>보낸 사람</th>
				<th>받은 일시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="letter" items="${sendList}">
				<tr>
					<td><a href="./app/letter/view?senderId=${letter.senderId }">${letter.senderId }</a></td>
					<td><a href="./app/letter/view?senderId=${letter.senderId }">${letter.title }</a></td>
					<td>${letter.senderName }</td>
					<td>${letter.cdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>

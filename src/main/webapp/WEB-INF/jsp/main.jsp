<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>글 목록</title>
</head>
<body>
	<form action="./app/article">
		<input type="number" name="page" value="${param.page }" placeholder="페이지"
			min="1" max="100" step="1" style="width: 50px;">
		<button type="submit">조회</button>
	</form>
	<p> 
 		<a href="./app/write">[게시글 입력]</a> 
 	</p> 

	<table>
		<thead>
			<tr>
				<td>글 번호</td>
				<td>제목</td>
				<td>이름</td>
				<td>등록일시</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.articleId }</td>
					<td>${member.title }</td>
					<td>${member.name }</td>
					<td>${member.cdate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</head>
</html>


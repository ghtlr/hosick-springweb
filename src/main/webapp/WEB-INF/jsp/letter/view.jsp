<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${pageContext.request.contextPath }/" />
<title>메일</title>
<script type="text/javascript">
	function confirmDelete() {
		if (confirm("삭제하시겠습니까?"))
			return true;
		else
			return false;
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/header.jsp"%>
	<h2>메일 보기</h2>
	<p>
		<a href="./app/letter/list">메일 목록</a>
		<c:if test="${letter.userId == sessionScope.MEMBER.memberId }">
			<a href="./app/letter/delete?receiverId=${letter.receiverId } | href="./app/letter/delete?senderId=${letter.senderId }"
				onclick="return confirmDelete();">메일 삭제</a>
		</c:if>
	</p>
	<hr />
	<p>
		<span>${letter.letterId }</span> | <span style="font-weight: bold;">${letter.title }</span>
	</p>
	<p>
		<span>${letter.cdate }</span> | <span>${letter.name }</span>
	</p>
	<hr />
	<p>${letter.contentHtml }</p>
	<hr />
</body>
</html>

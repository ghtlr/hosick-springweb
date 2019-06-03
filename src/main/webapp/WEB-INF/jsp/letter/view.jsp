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
		
		<c:if test="${letter.userId == sessionScope.MEMBER.memberId }">
			<a href="./app/letter/delete?letterId=${letter.receiverId } | ${letter.senderId }"
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

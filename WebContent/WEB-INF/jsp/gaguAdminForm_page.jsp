<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--Page 이전 페이지 구현 --%>
<c:choose>
	<c:when test="${searchType == null}">
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/images/prev.png">
			</c:when>
			<c:otherwise>
				<a
					href="gaguAdminForm?page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }
									&sortValue=${sortValue}">
					<img src="resources/images/prev.png">
				</a>
			</c:otherwise>
		</c:choose>

		<%--Page  페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="gaguAdminForm?page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&sortValue=${sortValue}">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="gaguAdminForm?page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&sortValue=${sortValue}">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page 다음 페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/images/next.png">
			</c:when>
			<c:otherwise>
				<a
					href="gaguAdminForm?page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }&sortValue=${sortValue}">
					<img src="resources/images/next.png">
				</a>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>

		<c:choose>
			<c:when test="${pageInfo.currentBlock eq 1}">
				<img src="resources/images/prev.png">
			</c:when>
			<c:otherwise>
				<a
					href="gaguAdminForm?searchType=${searchType}&searchValue=${searchValue}&page=
									${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }&sortValue=${sortValue}">
					<img src="resources/images/prev.png">
				</a>
			</c:otherwise>
		</c:choose>

		<%--Page  페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}" varStatus="num">
                        [<a
						href="gaguAdminForm?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&sortValue=${sortValue}">
						${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    			</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach
					begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					end="${pageInfo.totalPages}" varStatus="num">
                        [<a
						href="gaguAdminForm?searchType=${searchType}&searchValue=${searchValue}&page=
										${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }&sortValue=${sortValue}">
						${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
			</c:otherwise>
		</c:choose>


		<%--Page 다음 페이지 구현 --%>
		<c:choose>
			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
				<img src="resources/images/next.png">
			</c:when>
			<c:otherwise>
				<a
					href="gaguAdminForm?searchType=${searchType}&searchValue=${searchValue}&page=
									${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }&sortValue=${sortValue}">
					<img src="resources/images/next.png">
				</a>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>


<div class="container pt-2">
	<div class="row align-items-center">
		<div class="text-center" style="width: 100%; border-bottom: solid rgb(32, 54, 68); margin-bottom: 2rem; padding-bottom: 1rem;">
			<span style="font-weight: 600; font-size: 1.7rem; color: rgb(32, 54, 68); margin-bottom: 1rem; padding-bottom: 1rem;">계약 현황</span>
		</div>
		<div class="" style="width: 80%; margin: auto;">

			<p style="font-size: large; text-align: left; margin-bottom: 1rem; font-weight: 600;">
				<i class="bi-list-check m-3"></i>계약서 리스트
			</p>
			<!-- 리스트 -->
			<table class="table table-hover" style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
				<thead>
					<th scope="col">번호</th>
					<th scope="col">병원이름</th>
					<th scope="col">병원장 이름</th>
					<th scope="col">계약일</th>
					<th scope="col">계약금</th>
					<th scope="col">계약상태</th>
					<th scope="col">계약서</th>
				</thead>
				<tbody>
					<c:forEach var="contract" items="${contractList}" varStatus="status">
						<tr>
							<th scope="row">${status.index+1}</th>
							<td>${user.hospital.hname}</td>
							<td>${user.hospital.hdirector}</td>
							<td><fmt:formatDate value="${contract.contDate}" pattern="yyyy-MM-dd" /></td>
							<td>${contract.contDownPayment}</td>

							<c:if test="${contract.contStatus==1}">
								<td>계약완료</td>
							</c:if>
							<c:if test="${contract.contStatus==0}">
								<td>계약파기</td>
							</c:if>
							<c:if test="${contract.cont != null}">
								<td><a class="btn btn-sm btn-secondary" style="font-size: x-small;" href="contractFormPdf?fileIndex=${status.index}">계약서 보기</a></td>
							</c:if>
							<c:if test="${contract.cont == null}">
								<td><a class="btn btn-sm btn-secondary disabled" style="font-size: x-small;" href="contractFormPdf?fileIndex=${status.index}">계약서 보기</a></td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>


		</div>
	</div>
	<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>
</div>


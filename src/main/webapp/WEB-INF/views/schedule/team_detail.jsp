<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<style>
.card border {
	width: 180px;
}
</style>

<main id="main" class="main">
	<div class="dentist_processing">

		<div class="pagetitle">
			<h1>Processing</h1>

			<div>${detailTeamInformationTeamName[0].tcategory}</div>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Home</li>
					<li class="breadcrumb-item">Schedule</li>
					<li class="breadcrumb-item active">Team</li>
				</ol>
			</nav>

		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="team">
				<div class="row">
					<div class="col-sm-12">
						<div class="card" style="width: 90rem; display:flex;  flex-flow : wrap;" >
							<div class="card-body justify-content-between">
								<h5 class="card-title">일정 목록</h5>
								<div style="display: flex; justify-content: space-between; flex-direction: row;">
									<div class="team-wrapper d-flex" style = "display:flex;  flex-flow : wrap;">
									
										<c:forEach var="information"
											items="${detailTeamInformationSchedule}" varStatus="status">
									
											
												
													<!-- Team Card -->
													<div class="card border" style="width: 15rem; "
														onclick="location.href='${pageContext.request.contextPath}/hospital/processing/detail?hdln=${information.constructionschedule.consScheDln}'">
														<div class="card-body d-flex flex-column">
															<div class="d-flex align-items-center"></div>
															<div>
																<div class="display:flex; flex-direction:column;">
																	<h5 class="card-title">${information.constructionschedule.consScheHospitalName}</h5>
																	<div>종료 예정일:
																		${fn:substring(information.constructionschedule.consScheEnddate,0,10)}</div>
																	<div>시작 예정일:
																		${fn:substring(information.constructionschedule.consScheStartdate,0,10)}</div>
																</div>
															</div>
														</div>
													</div>
											
																		
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>
<!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
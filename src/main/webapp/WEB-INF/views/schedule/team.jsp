<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>


<main id="main" class="main">
	<div class="dentist_processing">

		<div class="pagetitle">
			<h1>Processing</h1>

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
					<div class="col-lg-4">
					<!-- 우수한 팀 목록 5개 - JBC -->
						<div class="card card-body" style="width: 80rem;">
							<h5 class="card-title">고평가 팀</h5>

						<div style="display:flex; flex-direction:row;" class="justify-content-between">
							<div class="card border" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[0].tid}'"
								style = "width:13rem;">
								<div class="card-body">
									<div class="d-flex align-items-center justify-content-between">
										<h5 class="card-title">${detailTeamInformationPage[0].tcategory}</h5>

									</div>
									<div>
										<div class="display:flex; flex-direction:column;">
											
										    			<div>SCORE: ${detailTeamInformationPage[0].tscore}</div>
										    			<div>THIS MONTH: ${detailTeamInformationPage[0].tmonthWork}</div>
										    			<div>THIS WEEK: ${detailTeamInformationPage[0].tweekWork}</div>
										    			<div>NOW: ${detailTeamInformationPage[0].tnowWork}</div>
										    			<div>COUNT: ${detailTeamInformationPage[0].sccount}</div>
										    			
										    			<div class="img-wrapper d-flex align-items-center">
													
														</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->
							</div>

							<div class="card border" style = "width:13rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[1].tid}'">
								<div class="card-body d-flex flex-column">
									<div class="d-flex align-items-center justify-content-between">
										<h5 class="card-title">${detailTeamInformationPage[1].tcategory}</h5>

									</div>
									<div>
										<div class="display:flex; flex-direction:column;">
											
										    			<div>SCORE: ${detailTeamInformationPage[1].tscore}</div>
										    			<div>THIS MONTH: ${detailTeamInformationPage[1].tmonthWork}</div>
										    			<div>THIS WEEK: ${detailTeamInformationPage[1].tweekWork}</div>
										    			<div>NOW: ${detailTeamInformationPage[1].tnowWork}</div>
										    			<div>COUNT: ${detailTeamInformationPage[1].sccount}</div>
										    			
										    			<div class="img-wrapper d-flex align-items-center">
														
														</div>
										</div>
									</div>
								</div>

							</div>

							<div class="card border" style = "width:13rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[2].tid}'">
								<div class="card-body d-flex flex-column">
									<div class="d-flex align-items-center justify-content-between">
										<h5 class="card-title">${detailTeamInformationPage[2].tcategory}</h5>

									</div>
									<div>
										<div class="display:flex; flex-direction:column;">
											
										    			<div>SCORE: ${detailTeamInformationPage[2].tscore}</div>
										    			<div>THIS MONTH: ${detailTeamInformationPage[2].tmonthWork}</div>
										    			<div>THIS WEEK: ${detailTeamInformationPage[2].tweekWork}</div>
										    			<div>NOW: ${detailTeamInformationPage[2].tnowWork}</div>
										    			<div>COUNT: ${detailTeamInformationPage[2].sccount}</div>
										    			<div class="img-wrapper d-flex align-items-center">
														
														</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->
							</div>
							
								<div class="card border" style = "width:13rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[3].tid}'">
								<div class="card-body d-flex flex-column">
									<div class="d-flex align-items-center justify-content-between">
									<h5 class="card-title">${detailTeamInformationPage[3].tcategory}</h5>

									</div>
									<div>
										<div class="display:flex; flex-direction:column;">
											
										    			<div>SCORE: ${detailTeamInformationPage[3].tscore}</div>
										    			<div>THIS MONTH: ${detailTeamInformationPage[3].tmonthWork}</div>
										    			<div>THIS WEEK: ${detailTeamInformationPage[3].tweekWork}</div>
										    			<div>NOW: ${detailTeamInformationPage[3].tnowWork}</div>
										    			<div>COUNT: ${detailTeamInformationPage[3].sccount}</div>
										    			<div class="img-wrapper d-flex align-items-center">
														
														</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->
								
							</div>
							
								<div class="card border" style = "width:13rem;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[4].tid}'">
								<div class="card-body d-flex flex-column">
									<div class="d-flex align-items-center justify-content-between">
									<h5 class="card-title">${detailTeamInformationPage[4].tcategory}</h5>

									</div>
									<div>
										<div class="display:flex; flex-direction:column;">
											
										    			<div>SCORE: ${detailTeamInformationPage[4].tscore}</div>
										    			<div>THIS MONTH: ${detailTeamInformationPage[4].tmonthWork}</div>
										    			<div>THIS WEEK: ${detailTeamInformationPage[4].tweekWork}</div>
										    			<div>NOW: ${detailTeamInformationPage[4].tnowWork}</div>
										    			<div>COUNT: ${detailTeamInformationPage[4].sccount}</div>
										    			<div class="img-wrapper d-flex align-items-center">
														
														</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->
							</div>
						</div>
						</div>
					</div>
				</div>


				<!-- 팀 전체 목록 - jbc -->
				<div class="card" style="width: 80rem">
					<div class="card-body justify-content-between">
						<h5 class="card-title">팀 목록</h5>
						<div class="team-wrapper d-flex">

							<div class="col-lg-2.1">
								<!-- Team Card -->
								<div class="card border" style="width: 13rem; "
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=1'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">전기 A팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '1'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>THIS MONTH: ${information.tmonthWork}</div>
										    			<div>THIS WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
												
												
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=2'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">전기 B팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '2'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=3'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">전기 C팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '3'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=7'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 A팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '7'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=8'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 B팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '8'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=9'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 C팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '9'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=10'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 A팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '10'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=11'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 B팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '11'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=12'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 C팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
											<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '12'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
												
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=4'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 A팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '4'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=5'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 B팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '5'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=6'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 C팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
									    			<!-- 팀 SCORE -->
									    			<c:if test="${information.tid eq '6'}">
										    			<div>SCORE: ${information.tscore}</div>
										    			<div>MONTH: ${information.tmonthWork}</div>
										    			<div>WEEK: ${information.tweekWork}</div>
										    			<div>NOW: ${information.tnowWork}</div>
										    			<div>COUNT: ${information.sccount}</div>
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
								<div class="col-lg-2.1">
								<div class="card border" style="width: 13rem;"
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=13'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">상담팀</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>-today: ${selectCounselingTeamInformation[0].counselingSchedule.ctodaywork}</div>
												<div>-week: ${selectCounselingTeamInformation[0].counselingSchedule.cweekwork}</div>
												<div>-month: ${selectCounselingTeamInformation[0].counselingSchedule.cmonthwork}</div>
												
												<div class="img-wrapper d-flex align-items-center">
												
												</div>
											</div>
										</div>
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

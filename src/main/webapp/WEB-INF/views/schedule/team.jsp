<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>


<main id="main" class="main">
	<div class="dentist_processing">

		<div class="d-flex">
			<div class="pagetitle d-flex align-items-end">
				<h1>부서</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">홈</li>
						<li class="breadcrumb-item">스케줄</li>
						<li class="breadcrumb-item">리스트</li>
						<li class="breadcrumb-item active">부서</li>
					</ol>
				</nav>
			</div>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="team">
				<div class="row">
					<div class="col-12">
						<!-- 우수한 팀 목록 5개 - JBC -->
						<div class="card card-body" style="width: 100%;">
							<h5 class="card-title">고평가 팀</h5>

							<div class="d-flex justify-content-between">
								<div class="border col-2" style="border-radius: 5px; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[0].tid}'">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title">${detailTeamInformationPage[0].tcategory}</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>점수: ${detailTeamInformationPage[0].tscore}</div>
												<div>한달: ${detailTeamInformationPage[0].tmonthWork}</div>
												<div>한주: ${detailTeamInformationPage[0].tweekWork}</div>
												<div>현재: ${detailTeamInformationPage[0].tnowWork}</div>
												<div>예정시공: ${detailTeamInformationPage[0].sccount}</div>
											</div>
										</div>
									</div>
									<!-- End Tem Card -->
								</div>

								<div class="border col-2" style="border-radius: 5px; cursor: pointer;" style="" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[1].tid}'">
									<div class="card-body">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title">${detailTeamInformationPage[1].tcategory}</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>점수: ${detailTeamInformationPage[1].tscore}</div>
												<div>한달: ${detailTeamInformationPage[1].tmonthWork}</div>
												<div>한주: ${detailTeamInformationPage[1].tweekWork}</div>
												<div>현재: ${detailTeamInformationPage[1].tnowWork}</div>
												<div>예정시공: ${detailTeamInformationPage[1].sccount}</div>
											</div>
										</div>
									</div>
								</div>

								<div class="border col-2" style="border-radius: 5px; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[2].tid}'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title">${detailTeamInformationPage[2].tcategory}</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>점수: ${detailTeamInformationPage[2].tscore}</div>
												<div>한달: ${detailTeamInformationPage[2].tmonthWork}</div>
												<div>한주: ${detailTeamInformationPage[2].tweekWork}</div>
												<div>현재: ${detailTeamInformationPage[2].tnowWork}</div>
												<div>예정시공: ${detailTeamInformationPage[2].sccount}</div>
											</div>
										</div>
									</div>
									<!-- End Tem Card -->
								</div>

								<div class="border col-2" style="border-radius: 5px; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[3].tid}'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title">${detailTeamInformationPage[3].tcategory}</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>점수: ${detailTeamInformationPage[3].tscore}</div>
												<div>한달: ${detailTeamInformationPage[3].tmonthWork}</div>
												<div>한주: ${detailTeamInformationPage[3].tweekWork}</div>
												<div>현재: ${detailTeamInformationPage[3].tnowWork}</div>
												<div>예정시공: ${detailTeamInformationPage[3].sccount}</div>
											</div>
										</div>
									</div>
									<!-- End Tem Card -->
								</div>

								<div class="border col-2" style="border-radius: 5px; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=${detailTeamInformationPage[4].tid}'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center justify-content-between">
											<h5 class="card-title">${detailTeamInformationPage[4].tcategory}</h5>
										</div>
										<div>
											<div class="display:flex; flex-direction:column;">
												<div>점수: ${detailTeamInformationPage[4].tscore}</div>
												<div>한달: ${detailTeamInformationPage[4].tmonthWork}</div>
												<div>한주: ${detailTeamInformationPage[4].tweekWork}</div>
												<div>현재: ${detailTeamInformationPage[4].tnowWork}</div>
												<div>예정시공: ${detailTeamInformationPage[4].sccount}</div>
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
				<div class="row">
				<div class="col">
				<div class="card">
					<div class="card-body justify-content-between">
						<h5 class="card-title">팀 목록</h5>
						<div class="team-wrapper d-flex col-12 justify-content-between">
							<div class="col-2">
								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;"  onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=1'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">전기 A팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '1'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/e1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=2'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">전기 B팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '2'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/e1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=3'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<div class="d-flex flex-column">
												<h5 class="card-title">전기 C팀</h5>
											</div>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '3'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/e1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

							</div>

							<div class="col-2">

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=7'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 A팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '7'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/d1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=8'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 B팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '8'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>


												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/d1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>

								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=9'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">도배 C팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '9'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/d1.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-2">

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=10'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 A팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '10'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/f2.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=11'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 B팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '11'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/f2.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=12'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">가구 C팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '12'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/f2.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

							</div>

							<div class="col-2">

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=4'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 A팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '4'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/s4.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=5'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 B팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '5'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/s4.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=6'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title">설비 C팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<c:forEach var="information" items="${detailTeamInformationPage}">
													<!-- 팀 점수 -->
													<c:if test="${information.tid eq '6'}">
														<div>점수: ${information.tscore}</div>
														<div>한달: ${information.tmonthWork}</div>
														<div>한주: ${information.tweekWork}</div>
														<div>현재: ${information.tnowWork}</div>
														<div>예정시공: ${information.sccount}</div>
													</c:if>
												</c:forEach>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/s4.png" style="opacity: 0.5;">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-2">
								<div class="card border" style="margin: 0 0 20px 0; cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=13'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
											<h5 class="card-title pr-1">상담팀</h5>
										</div>
										<div class="d-flex align-items-end justify-content-between">
											<div style="display:flex; flex-direction:column;">
												<div>오늘: ${selectCounselingTeamInformation[0].counselingSchedule.ctodaywork}</div>
												<div>한주: ${selectCounselingTeamInformation[0].counselingSchedule.cweekwork}</div>
												<div>한달: ${selectCounselingTeamInformation[0].counselingSchedule.cmonthwork}</div>
												<br>
												<br>
											</div>
											<div>
												<img alt="" src="${pageContext.request.contextPath}/resources/images/c1.png" style="opacity: 0.5;">
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
			</div>
		</section>
	</div>


</main>
<!-- End #main -->
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

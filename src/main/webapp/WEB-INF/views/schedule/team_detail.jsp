<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<style>
	.card border{
		width:180px;
	}
	

</style>

<main id="main" class="main">
    <div class="dentist_processing">

      <div class="pagetitle">
        <h1>Processing</h1>
               
   		<div>${detailTeamInformation[0].tcategory}</div>

        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item">Schedule</li>
            <li class="breadcrumb-item active">Team</li>
          </ol>
        </nav>

      </div><!-- End Page Title -->

      <section class="section">
        <div class="team">
          <div class="row">
            <div class="col-sm-12">
              <div class="card" style="width: 80rem">
					<div class="card-body justify-content-between">
						<h5 class="card-title"> 일정 목록 </h5>
					<div style="display:flex; justify-content: space-between; flex-direction:row; ">
					
						<div class="team-wrapper d-flex">

							<div class="col-lg-2.1">
								<!-- Team Card -->
								<div class="card border" style="width: 15rem; "
									onclick="location.href='${pageContext.request.contextPath}/schedule/team/detail?tid=1'">
									<div class="card-body d-flex flex-column">
										<div class="d-flex align-items-center">
										
									<%-- 	<c:forEach var="information" items="${detailTeamInformation}"> --%>
									    			<!-- 팀 SCORE -->
									    			
									    		<!-- 		<h5 class="card-title">전기 A팀</h5> -->
										    			<div>${information.constructionschedule.consScheStartdate}</div>
										    			<div>${information[0].constructionschedule.consScheEnddate}</div>
										    			
										    			<div>${information[0].constructionschedule.consScheContent}</div>
									    			
									    	
									           		
												<%-- </c:forEach> --%>
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
									    			</c:if>
									    			
												</c:forEach>
												
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
							
								
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								
								<!-- End Tem Card -->

							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>

								<!-- End Tem Card -->

								<!-- Team Card -->
								
							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								
								<!-- End Tem Card -->

							</div>

							<div class="col-lg-2.1">

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								<div class="card border" style="width: 15rem;"
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
									    			</c:if>
									    			
									           		
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<!-- End Tem Card -->

								<!-- Team Card -->
								
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
  </main><!-- End #main -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
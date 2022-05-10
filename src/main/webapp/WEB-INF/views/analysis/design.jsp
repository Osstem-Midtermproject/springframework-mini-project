<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<main id="main" class="main">
	<div class="analysis_design">
		<div class="d-flex">
			<div class="pagetitle d-flex align-items-end">
				<h1>디자인</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item">홈</li>
						<li class="breadcrumb-item">분석통계</li>
						<li class="breadcrumb-item active">디자인</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<div class="row justify-content-center">
		<div class="col-11">
				<div id="designcontent" class="card-body" style="padding: 20px 0 20px 0">
					<div class="d-flex justify-content-between" style="margin: 0 auto;">
						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">1</span> 
							<img id="${themaRank[0].dtt}"  src="${themaRank[0].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							
							<c:if test="${themaRank[0].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[0].dtt}</span>
									<span class="badge rounded-pill bg-danger">+${themaRank[0].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[0].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[0].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[0].count}</span>							
								</div>
							</c:if>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">2</span> 
							<img id="${themaRank[1].dtt}"  src="${themaRank[1].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<c:if test="${themaRank[1].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[1].dtt}</span>	
									<span class="badge rounded-pill bg-danger">+${themaRank[1].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[1].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[1].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[1].count}</span>							
								</div>
							</c:if>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">3</span> 
							<img id="${themaRank[2].dtt}" src="${themaRank[2].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<c:if test="${themaRank[2].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[2].dtt}</span>
									<span class="badge rounded-pill bg-danger">+${themaRank[2].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[2].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[2].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[2].count}</span>							
								</div>
							</c:if>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">4</span> 
							<img id="${themaRank[3].dtt}"  src="${themaRank[3].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<c:if test="${themaRank[3].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[3].dtt}</span>
									<span class="badge rounded-pill bg-danger">+${themaRank[3].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[3].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[3].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[3].count}</span>							
								</div>
							</c:if>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">5</span> 
							<img id="${themaRank[4].dtt}"  src="${themaRank[4].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<c:if test="${themaRank[4].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[4].dtt}</span>
									<span class="badge rounded-pill bg-danger">+${themaRank[4].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[4].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[4].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[4].count}</span>							
								</div>
							</c:if>
						</div>

						<div class="col-2 d-flex flex-column" style="text-align: center; width: 220px;">
							<span class="badge" style="width: 30px; margin-bottom: -10px; margin-left: -10px; z-index: 1; background-color: threedshadow; font-size: 1rem">6</span> 
							<img id="${themaRank[5].dtt}"  src="${themaRank[5].dimg}" alt="" style="width: 220px; height: 160px; border-radius: 1rem;"> 
							<c:if test="${themaRank[5].count > 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[5].dtt}</span>
									<span class="badge rounded-pill bg-danger">+${themaRank[5].count}</span>							
								</div>
							</c:if>
							<c:if test="${themaRank[5].count < 0}">
								<div class="text-center">
									<span style="font-size: 1.7rem; font-weight: 400;">#${themaRank[5].dtt}</span>
									<span class="badge rounded-pill bg-primary">${themaRank[5].count}</span>							
								</div>
							</c:if>
						</div>
					</div>
				</div>
		</div>
		
		<div class="col-lg-12">
				<div class="card-body" style="padding: 50px 20px 20px 20px;">
					<nav style="margin-bottom: 2rem">
						<div class="nav nav-tabs nav-tabs-bordered justify-content-center" id="nav-tab" role="tablist">
							<c:forTokens var="dtt" items="Black,Blue,Gray,Pastel,White,Wood" delims=",">
								<c:if test="${dtt == 'Black'}">
									<button class="nav-link active" onclick="black()" data-bs-toggle="tab" data-bs-target="#nav-${dtt}" type="button" role="tab" aria-controls="nav-${dtt}" aria-selected="true" style="font-weight: 400; font-size: 1.7rem;">${dtt}</button>
								</c:if>
								<c:if test="${dtt != 'Black'}">
									<button class="nav-link" onclick='${dtt}()'data-bs-toggle="tab" data-bs-target="#nav-${dtt}" type="button" role="tab" aria-controls="nav-${dtt}" aria-selected="false" style="font-weight: 400; font-size: 1.7rem;">${dtt}</button>
								</c:if>
							</c:forTokens>
						</div>
					</nav>
					<div class="tab-content" id="nav-tabContent">
						<c:forTokens var="dtt" items="Black,Blue,Gray,Pastel,White,Wood" delims=",">
							<c:if test="${dtt == 'Black'}">
								<div class="tab-pane fade show active" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsBlack" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsBlack" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsBlack" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${Black}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Black </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${Black}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Black </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsBlack" data-bs-slide="prev" style="display: none;">
										    <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color: rgba(32, 54, 68);"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsBlack" data-bs-slide="next" style="display: none;">
										    <span class="carousel-control-next-icon" aria-hidden="true" style="background-color: rgba(32, 54, 68);"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  </div>
									</section>				
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Blue'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsBlue" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsBlue" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsBlue" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${Blue}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Blue </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${Blue}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Blue </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsBlue" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsBlue" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  
									  </div>
									</section>		
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Gray'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsGray" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsGray" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsGray" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${Gray}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Gray </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${Gray}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Gray </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsGray" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsGray" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  
									  </div>
									</section>
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Pastel'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsPastel" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsPastel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsPastel" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${Pastel}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Pastel </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${Pastel}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Pastel </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsPastel" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsPastel" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  
									  </div>
									</section>
								</div>
							</c:if>
							
							<c:if test="${dtt == 'White'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsWhite" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsWhite" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsWhite" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${White}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">White </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${White}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">White </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsWhite" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsWhite" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  
									  </div>
									</section>
								</div>
							</c:if>
							
							<c:if test="${dtt == 'Wood'}">
								<div class="tab-pane fade" id="nav-${dtt}" role="tabpanel" aria-labelledby="nav-${dtt}-tab">
									<section class="pt-4 d-flex justify-content-center">
									  <div class="container">
									  	<div id="carouselExampleCaptionsWood" class="carousel slide" data-bs-ride="carousel" style="height: 400px;">
										  <div class="carousel-indicators">
										    <button type="button" data-bs-target="#carouselExampleCaptionsWood" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="background-color: rgba(32, 54, 68);"></button>
										    <button type="button" data-bs-target="#carouselExampleCaptionsWood" data-bs-slide-to="1" aria-label="Slide 2" style="background-color: rgba(32, 54, 68);"></button>
										  </div>
										  <div class="carousel-inner">
										    <div class="carousel-item active">	   
												<div class="row">
													<c:forEach var="i" items="${Wood}" varStatus="status" begin="0" end="3">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Wood </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>
												</div>	
										    </div>
										    
										    <div class="carousel-item">
										      	<div class="row">
													<c:forEach var="i" items="${Wood}" varStatus="status" begin="4" end="7">
											  			<div class="col-md-3 mb-3">
															<div class="card">
																<img class="rounded" src="${i.contAddress}" style="width: 100%; height: 200px;">
																<div class="card-body">
																	<h4 class="card-title">${i.contDln}</h4>
																	<div class="card-text">
																		<span style="font-size: 1.3rem; font-weight: 500">Wood </span>
																		<span>테마 인기</span>
																		<span style="font-size: 1.3rem; font-weight: 500"> ${i.cno}위 </span>
																		<span>디자인</span>
																	</div>
																</div>
															</div>
														</div>
											  		</c:forEach>													
												</div>
										    </div>
										  </div>
										  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptionsWood" data-bs-slide="prev">
										    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Previous</span>
										  </button>
										  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptionsWood" data-bs-slide="next">
										    <span class="carousel-control-next-icon" aria-hidden="true"></span>
										    <span class="visually-hidden">Next</span>
										  </button>
										</div>
									  
									  </div>
									</section>
								</div>
							</c:if>
						</c:forTokens>
					</div>



					<%-- 					<hr />
					<c:forEach var="dcon" items="${dcon}" varStatus="status">
						<div class="d-flex flex-row">
							<div style="font-size: 30px">${status.count}</div>
							<div id="${dcon.contDetails}" class="mx-4" style="font-size: 30px">${dcon.contArea}</div>
							<span>32</span><span>↑23</span>
							<div style="margin-left: auto">
								<img style="height: 100%; width: 50px" src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" />
							</div>
						</div>
						<hr />
					</c:forEach> --%>

			</div>
		</div>
	</div>
	<div class="card">
		<div class="card-body" style="padding: 20px;">
			<div class="chart-container">
				<canvas id="myChart3" style="height: 25vh; width: 60vw"></canvas>
			</div>
		</div>
	</div>
	<!-- End Page Title -->


</main>
<script>

function White(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"White"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

function Wood(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"Wood"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

function Gray(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"Gray"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

function black(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"Black"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

function Blue(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"Blue"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

function Pastel(){
	$.ajax({
        url:"designajax",
        type:'post',
       data:{"design":"Pastel"}
      }).done((data)=>{
    	  themaChart.data.labels=data.thema;
    	  themaChart.data.datasets[0].data=data.cnt;
    	  themaChart.update();
    		        	  
      });
}

$(function(){
	
	$("#White").hover(function(){	
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"White"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			 
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	
        	  $("#design1").html(str1);
        	  
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        	  
        		        	  
          });
	}, function() {
   		
	});
	$("#Pastel").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Pastel"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			 
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Black").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Black"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Blue").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Blue"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Gray").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Gray"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			  
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
	$("#Wood").hover(function(){
		$.ajax({
            url:"designajax",
            type:'post',
           data:{"design":"Wood"
        				
           }
            
          }).done((data)=>{
        	 
        	  let str1="";
        	  let str2="";
        	  let str3="";
        	  for(let i=0;i<9;i++){
        		  if(i<=2){
        			  str1+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        			
        		  }
        		  else if(i>=3 && i<=5){
        			  str2+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }else{
        			  str3+='<div><img style="height: 150px; width: 200px" src='+data.designlist[i]+"></div>";
        		  }
        	  }
        	  $("#design1").html(str1);
        	  $("#design2").html(str2);
        	  $("#design3").html(str3);
        	  themaChart.data.labels=data.thema;
        	  themaChart.data.datasets[0].data=data.cnt;
        	  themaChart.update();
        		        	  
          });
	}, function() {
   		
	});
})
   		
        const yearData = {
          
          datasets: [
            {
              label: "디자인 순위",

              backgroundColor: [
                //색상
                "rgba(54, 162, 235, 0.2)",
              ],
              borderColor: [
                //경계선 색상
                "rgba(54, 200, 235, 0.6)",
              ],
             
              fill: false,
              tension: 0.1,
            },
          ],
        };
     
      
        const yearConfig = {
          type: "bar",
          data: yearData,
          options: { 
        	indexAxis: 'y',
            responsive: true,
            plugins: {
            	datalabels: {
            		 formatter: (value, yearData) => {
            		        const datapoints = yearData.chart.data.datasets[0].data
            		        const total = datapoints.reduce((total, datapoint) => total + datapoint, 0)
            		        const percentage = value / total * 100
            		        if(percentage==0){
            		        	return "";
            		        }else{
            		        	return percentage.toFixed(2) + "%";	
            		        }
            		        
            		  },
                  },
              legend: {
                labels: {
                  font: {
                    size: 15,
                  },
                },
              },
            },
          },
          plugins: [ChartDataLabels],
        };
     
        const themaChart = new Chart(document.getElementById("myChart3"), yearConfig);
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
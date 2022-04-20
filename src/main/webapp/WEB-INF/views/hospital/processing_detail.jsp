<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="pagetitle">
      <h1>Processing</h1>

      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Home</li>
          <li class="breadcrumb-item">Dentist</li>
          <li class="breadcrumb-item active">Processing</li>
        </ol>
      </nav>

    </div><!-- End Page Title -->

    <section class="section">
      <div class="d-flex align-items-center justify-content-center" style="margin-bottom: 10px;">
        <div style="width: 150px; height: 150px;">
          <img src="${pageContext.request.contextPath}/resources/images/office_img.png" style="height: 100%; width: 100%;">
        </div>
        <div>
          <h3><span class="badge bg-success">진행중</span></h3>
          <h2>오스템임플란트</h2>
          <span>계약일 2020-10-30</span>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-8">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">병원정보</h5>
              <table class="table table-borderless">
                <tbody>
                  <tr>
                    <th scope="row">병원장</th>
                    <td>김혜현</td>
                    <th scope="row">병원번호</td>
                    <td>02-123-1234</td>
                  </tr>
                  <tr>
                    <th scope="row">병원위치</th>
                    <td>서울 송파구 중대로 135 아이티벤처타워</td>
                    <th scope="row">직통번호</td>
                    <td>010-9876-5432</td>
                  </tr>
                  <tr>
                    <th scope="row">개업일</th>
                    <td>2012-05-12</td>
                    <th scope="row">이메일</td>
                    <td>osstem@mycompany.com</td>
                  </tr>
                  
                </tbody>
              </table>
              <!-- End Tables without borders -->

            </div>
          </div>

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item">
                  <button class="nav-link active" id="present-tab" data-bs-toggle="tab" data-bs-target="#bordered-present" type="button">요청내역</button>
                </li>
                <li class="nav-item">
                  <button class="nav-link" id="past-tab" data-bs-toggle="tab" data-bs-target="#bordered-past" type="button">과거내역</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabContent">
                <div class="tab-pane fade show active" id="bordered-present">
                  <table class="table table-borderless">
                    <tbody>
                      <tr>
                        <th scope="row">제목</th>
                        <td>상담 신청합니다.</td>
                        <th scope="row">신청일</th>
                        <td>2022-01-20</td>
                      </tr>
                      <tr>
                        <th scope="row">예산</th>
                        <td>1억</td>
                        <th scope="row">면적</th>
                        <td>115m2 / 35평</td>
                      </tr>
                      <tr>
                        <th scope="row">건물층</th>
                        <td>3층</td>
                        <th scope="row">공간수</th>
                        <td>6개</td>
                      </tr>
                      <tr>
                        <th scope="row">디자인</th>
                        <td>화이트</td>
                        <th scope="row">상담일</th>
                        <td>2022-01-27</td>
                      </tr>
                      <tr>
                        <th scope="row">구분</th>
                        <td>부분 인테리어</td>
                        <th scope="row">공간</th>
                        <td>대기실/인포메이션</td>
                      </tr>

                      <tr>
                        <th scope="row">상담내역</th>
                        <td colspan="3" style="width: 85%;">북유럽 컨셉으로 단조로운 디자인의 가구와 소품들을 사용하고, 소재 본래의 질감과 함께 매끄러운 마감이 가미됐음 좋겠습니다. 기본적으로 흰색과 베이지색, 우드톤이 사용 되고 부드러운 파스텔톤으로 포인트를 줬으면 좋겠습니다.</td>
                      </tr>
                      
                      <!-- 추가요청이 들어올 때마다 추가 -->
                      <tr>
                        <th scope="row">추가요청</th>
                        <td colspan="3" style="width: 85%;">북유럽 컨셉으로 단조로운 디자인의 가구와 소품들을 사용하고, 소재 본래의 질감과 함께 매끄러운 마감이 가미됐음 좋겠습니다. 기본적으로 흰색과 베이지색, 우드톤이 사용 되고 부드러운 파스텔톤으로 포인트를 줬으면 좋겠습니다.</td>
                      </tr>
                      
                      <tr>
                        <th scope="row"></th>
                        <td colspan="3" style="width: 85%;">북유럽 컨셉으로 단조로운 디자인의 가구와 소품들을 사용하고, 소재 본래의 질감과 함께 매끄러운 마감이 가미됐음 좋겠습니다. 기본적으로 흰색과 베이지색, 우드톤이 사용 되고 부드러운 파스텔톤으로 포인트를 줬으면 좋겠습니다.</td>
                      </tr>
    
                      <tr>
                        <th scope="row"></th>
                        <td colspan="3" style="width: 85%;">북유럽 컨셉으로 단조로운 디자인의 가구와 소품들을 사용하고, 소재 본래의 질감과 함께 매끄러운 마감이 가미됐음 좋겠습니다. 기본적으로 흰색과 베이지색, 우드톤이 사용 되고 부드러운 파스텔톤으로 포인트를 줬으면 좋겠습니다.</td>
                      </tr>
    
                    </tbody>
                  </table>
                </div>
                <div class="tab-pane fade" id="bordered-past">
                  <table class="table">
                    <thead>
                      <tr>
                        <th scope="col" style="width: 7%;">번호</th>
                        <th scope="col" style="width: 15%;">일자</th>
                        <th scope="col" style="width: 12%;">구분</th>
                        <th scope="col">상세내역</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <th scope="row">1</th>
                        <td>2021-01-01</td>
                        <td>벽지</td>
                        <td colspan="3">부자재의 경우에는 집의 환경 그리고 합지 시공과 실크 시공에 따라 들어가는 부자재가 많이 달라지게 되기 때문에 정확한 양과 가격을 측정하기가 힘듭니다. 하지만 쉽게 설명드리기 위해 합지 시공의 경우에 들어가는 벽지 1롤당 약 5천 원 정도 실크벽지 시공의 경우 들어가는 벽지 1롤당 약 만원 정도로 생각하시면 편합니다.(현장마다 편차가 있습니다.)</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>2021-01-13</td>
                        <td>바닥</td>
                        <td colspan="3">노출콘크리트바닥 디자인으로 마감된 현장을 방문해보니 구조크랙등의 문제로 바닥 전체에 수많은 크랙이 발생되어 있는 현장을 접하게 되었습니다. 이를 해결 하기 위해 리뉴얼 시공 방법은 마이크로토핑으로 마감하기로 결정하고 마이크로토핑작업을 위한 사전 작업을 진행하게 되었습니다.
                        출입구나 재료분리대 주변등의 높이를 마이크로토핑 작업을 위한 작업 공간(높이)을 만들어 주고 기발생된 구조크랙은 그라우팅 재료등 으로 메꿔 주는등 의 사전 작업이 필요 했습니다.</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>2021-01-16</td>
                        <td>냉난방</td>
                        <td>냉난방 설비란 일정한 실내온도를 유지하기위해 설치된 기계나 기구, 배관 및 그 밖에 성능을 유지하기위한 설비다. 건축물의 실내를 따뜻하게 하기위해 설치되는 난방배관(아파트, 주택 등)과 에어컨 등이 주변에서 흔히 볼 수 있는 냉난방설비다.</td>
                      </tr>
                      <tr>
                        <th scope="row">4</th>
                        <td>2021-01-20</td>
                        <td>전기</td>
                        <td>“전기설비”란 발전·송전·변전·배전·전기공급 또는 전기사용을 위하여 설치하는 기계·기구·댐·수로·저수지·전선로·보안통신선로 및 그 밖의 설비를 말합니다</td>
                      </tr>
                      <tr>
                        <th scope="row">5</th>
                        <td>2021-01-28</td>
                        <td>인테리어</td>
                        <td>서양 건축의 천장과 벽 또는 방바닥의 표면을 다른 재료를 써서 마무리짓는 화장이나 마무리 위에 회화나 부조를 하고 샹들리에, 거울, 가구류에 의장을 집중시켜 실내를 하나의 양식으로 만드는 것을 뜻했다.</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div><!-- End Bordered Tabs -->

            </div>
          </div>

          
        </div>

        <div class="col-lg-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Recent Activity</h5>
              <div class="dashboard">
                <div class="activity">

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-01</div>
                    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                    <div class="activity-content">
                      상담진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-03</div>
                    <i class='bi bi-circle-fill activity-badge text-primary align-self-start'></i>
                    <div class="activity-content">
                      상담완료
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-05</div>
                    <i class='bi bi-circle-fill activity-badge text-secondary align-self-start'></i>
                    <div class="activity-content">
                      계약진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-06</div>
                    <i class='bi bi-circle-fill activity-badge text-secondary align-self-start'></i>
                    <div class="activity-content">
                      계약완료
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-07</div>
                    <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                    <div class="activity-content">
                      전기 시공 진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-10</div>
                    <i class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
                    <div class="activity-content">
                      전기 시공 완료
                    </div>
                  </div>
                  
                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-11</div>
                    <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                    <div class="activity-content">
                      벽지 시공 진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-13</div>
                    <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                    <div class="activity-content">
                      벽지 시공 완료
                    </div>
                  </div>
                  
                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-14</div>
                    <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                    <div class="activity-content">
                      인테리어 시공 진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-20</div>
                    <i class='bi bi-circle-fill activity-badge text-warning align-self-start'></i>
                    <div class="activity-content">
                      인테리어 시공 완료
                    </div>
                  </div>
                  
                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-22</div>
                    <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                    <div class="activity-content">
                      벽지 추가 시공 진행
                    </div>
                  </div><!-- End activity item-->

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-24</div>
                    <i class='bi bi-circle-fill activity-badge text-danger align-self-start'></i>
                    <div class="activity-content">
                      벽지 추가 시공 완료
                    </div>
                  </div>

                  <div class="activity-item d-flex">
                    <div class="activite-label">2022-03-24</div>
                    <i class='bi bi-circle-fill activity-badge text-info align-self-start'></i>
                    <div class="activity-content">
                      최종 시공 완료
                    </div>
                  </div><!-- End activity item-->

                </div>
              </div>
            </div>
          </div><!-- End Recent Activity -->
        </div>
      </div>
    </section>

  </main><!-- End #main -->
  
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
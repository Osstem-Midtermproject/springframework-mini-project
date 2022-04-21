<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<%@ include file="/WEB-INF/views/user/common/sidebar.jsp"%>

<%@ include file="/WEB-INF/views/user/common/userPageHeader.jsp"%>


            <div class="row align-items-center mx-5 px-4"> 
                <div class="text-center" style="width: 100%; border-bottom: solid #f26522; margin-bottom: 2rem;">
                    <span style="font-weight: 600; font-size: 1.5rem; color: #f26522;">계약 현황</span>
                </div>
                <div class="" style="width: 80%; margin: auto;">

                    <p style="font-size: large; text-align: left; margin-bottom: 1rem; font-weight: 600;"><i class="bi-list-check m-3"></i>계약서 리스트</p>
                    <!-- 리스트 -->
                    <table class="table table-hover" style="margin-bottom: 2rem; font-weight: 600; font-size: 0.8rem;">
                        <thead>
                            <th scope="col">번호</th>
                            <th scope="col">병원이름</th>
                            <th scope="col">담당자 이름</th>
                            <th scope="col">담당자 전화번호</th>
                            <th scope="col">계약일</th>
                            <th scope="col">계약상태</th>
                            <th scope="col">계약서</th>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>강윤치과 송파점</td>
                                <td>전병천</td>
                                <td>010-4444-1234</td>
                                <td>2022-02-17</td>
                                <td>계약완료</td>
                                <td><a class="btn btn-sm btn-secondary" style="font-size: x-small;" href="contractForm">계약서 보기</a> </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>강윤치과 강남점</td>
                                <td>이주영</td>
                                <td>010-2222-1234</td>
                                <td>2021-04-23</td>
                                <td>계약완료</td>
                                <td><a class="btn btn-sm btn-secondary" style="font-size: x-small;" href="contractFormPdf">계약서 보기</a> </td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>강윤치과 봉천점</td>
                                <td>김혜현</td>
                                <td>010-3333-1234</td>
                                <td>2018-09-30</td>
                                <td>계약파기</td>
                                <td><a class="btn btn-sm btn-secondary disabled" style="font-size: x-small;" href="contractForm">계약서 보기</a> </td>
                            </tr>
                        </tbody>
                    </table>

                <!-- 페이징 -->
                <nav>
                    <ul class="pagination justify-content-center">
                      <li class="page-item disabled">
                        <a class="page-link" href="#">
                          <span>&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item disabled">
                        <a class="page-link" href="#">
                          <span>&lsaquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item disabled">
                        <a class="page-link" href="#">
                          <span>&rsaquo;</span>
                        </a>
                      </li>
                      <li class="page-item disabled">
                        <a class="page-link" href="#">
                          <span>&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                    
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>
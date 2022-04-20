<%@ page contentType="text/html; charset=UTF-8"%>


    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">

        <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse">
            <i class="bi bi-grid"></i><span>마이페이지</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed"  data-bs-toggle="collapse" href="${pageContext.request.contextPath}/user/userInformation">
            <i class="bi bi-person-check-fill"></i><span>회원정보</span>
            </a>
        </li><!-- End Dentist Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed"  data-bs-toggle="collapse" href="${pageContext.request.contextPath}/user/progressDetail">
            <i class="bi bi-list-task"></i><span>진행내역</span>
            </a>
        </li><!-- End Dentist Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed"  data-bs-toggle="collapse" href="${pageContext.request.contextPath}/user/contractsView">
            <i class="bi bi-file-earmark-text-fill"></i><span>계약현황</span>
            </a>
        </li><!-- End Dentist Nav -->

        </ul>

    </aside><!-- End Sidebar-->
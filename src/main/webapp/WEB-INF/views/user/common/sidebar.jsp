<%@ page contentType="text/html; charset=UTF-8"%>

<style>
	.sidebar {
    position: fixed;
    top: 5rem;
    left: 0;
    bottom: 0;
    width: 300px;
    z-index: 996;
    box-shadow: 0px 0px 20px rgba(1, 41, 112, 0.1);
    background-color: rgb(32, 54, 68);
    padding-top: 1rem;
    font-size: 1.2rem;
    
  }

  .sidebar-nav {
    padding: 0;
    margin: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    padding: 0;
    margin: 0;
    list-style: none;
  }  

  .sidebar-nav .nav-link {
    display: flex;
    align-items: center;
    font-size: 1.2rem;
    font-weight: 600;
    color: rgb(255, 255, 255);
    transition: 0.3;
    background: rgb(32, 54, 68);
    padding: 10px 15px;
  }
  
  .sidebar-nav .nav-link i {
    font-size: 1.2rem;
    margin-right: 1rem;
    color: rgb(255, 255, 255);
  }
  .sidebar-nav .nav-link.collapsed {
    color: rgb(255, 255, 255);
    background: rgb(32, 54, 68);
  }
  .sidebar-nav .nav-link.collapsed i {
    color: rgb(255, 255, 255);
  }
  .sidebar-nav .nav-link:hover {
    color: rgb(255, 255, 255);
    background: rgba(43, 71, 90, 0.86)
  }
  .sidebar-nav .nav-link:hover i {
    color: rgb(255, 255, 255);
  }
  .sidebar-nav .nav-content a i {
    font-size: 1.2rem;
    margin-right: 8px;
    line-height: 0;
    border-radius: 50%;
  }
  
</style>


    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">

        <ul class="sidebar-nav mt-3" id="sidebar-nav">

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
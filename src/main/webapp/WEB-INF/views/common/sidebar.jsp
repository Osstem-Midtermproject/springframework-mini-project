<%@ page contentType="text/html; charset=UTF-8"%>
<!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/dashboard">
          <i class="bi bi-grid"></i><span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-bar-chart-line-fill"></i><span>Analysis</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/analysis/analysis">
              <i class="bi bi bi-cash-coin"></i><span>Sales</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/analysis/design">
              <i class="bi bi-palette"></i><span>Design</span>
            </a>
          </li>
           <li>
            <a href="${pageContext.request.contextPath}/analysis/teamAnalysis">
              <i class="bi bi bi-cash-coin"></i><span>TeamAnalysis</span>
            </a>
          </li>
        </ul>
      </li><!-- End Analysis Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-calendar-check"></i><span>Schedule</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li class="nav-item">
            <a href="#"  data-bs-target="#forms-schedule" data-bs-toggle="collapse" >
              <i class="bi bi-calendar-week"></i><span>Calendar</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
           	 <ul id="forms-schedule" class="nav-content collapse">
            	 <li >
            		<a href="${pageContext.request.contextPath}/schedule/calendar">
              			<span>-상담/AS</span>
            		</a>
          		</li>
          		<li>
            		<a href="${pageContext.request.contextPath}/schedule/calendar">
              		<span>-시공</span>
            		</a>
          		</li>
            </ul>
          </li>
          
          <li>
            <a href="${pageContext.request.contextPath}/schedule/scheduler">
              <i class="bi bi-calendar-week-fill"></i><span>Scheduler</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/schedule/list">
              <i class="bi bi-card-list"></i><span>List</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/schedule/team">
              <i class="bi bi-collection"></i><span>Team</span>
            </a>
          </li>
        </ul>
      </li><!-- End Schedule Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-plus-circle"></i><span>Hospital</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/hospital/processing">
              <i class="bi bi-clock-history"></i><span>시공 내역 Processing</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/history">
              <i class="bi bi-skip-backward"></i><span>History</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/location">
              <i class="bi bi-geo-alt"></i><span>Location</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/contractHistory">
              <i class="bi bi-envelope-paper"></i><span>Contract</span>
            </a>
          </li>
        </ul>
      </li><!-- End Dentist Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/management">
          <i class="bi bi-person-rolodex"></i><span>Management</span>
        </a>
      </li><!-- End Management Nav -->
    </ul>

  </aside><!-- End Sidebar-->
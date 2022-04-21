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
              <i class="bi bi-brush-fill"></i><span>Design</span>
            </a>
          </li>
        </ul>
      </li><!-- End Analysis Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-clock-fill"></i><span>Schedule</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/schedule/calendar">
              <i class="bi bi-calendar-week-fill"></i><span>Calendar</span>
            </a>
          </li>
          <li>
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
              <i class="bi bi-card-list"></i><span>Team</span>
            </a>
          </li>
        </ul>
      </li><!-- End Schedule Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-hospital-fill"></i><span>Hospital</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="${pageContext.request.contextPath}/hospital/processing">
              <i class="bi bi-hourglass-bottom"></i><span>Processing</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/history">
              <i class="bi bi-pencil-square"></i><span>History</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/location">
              <i class="bi bi-geo-alt"></i><span>Location</span>
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/hospital/contractHistory">
              <i class="bi bi-geo-alt"></i><span>Contract History</span>
            </a>
          </li>
        </ul>
      </li><!-- End Dentist Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/management">
          <i class="bi bi-pencil-fill"></i><span>Management</span>
        </a>
      </li><!-- End Management Nav -->
    </ul>

  </aside><!-- End Sidebar-->
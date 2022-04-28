
<nav>
  <ul class="pagination justify-content-center">
    <li class="page-item">
      <a class="page-link" onclick="checkBox(1)">
        <span>&laquo;</span>
      </a>
    </li>
    
    <c:if test="${pager.groupNo>1}">
	  <li class="page-item">
	    <a class="page-link" onclick="checkBox(${pager.startPageNo-1})">
	      <span>&lsaquo;</span>
	    </a>
	  </li>
	</c:if>
	
	<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		<c:if test="${pager.pageNo != i}">
			<li class="page-item"><a class="page-link" onclick="checkBox(${i})">${i}</a></li>
		</c:if>
		<c:if test="${pager.pageNo == i}">
			<li class="page-item"><a class="page-link text-primary" onclick="checkBox(${i})">${i}</a></li>
		</c:if>
	</c:forEach>
    
    <c:if test="${pager.groupNo<pager.totalGroupNo}">
      <li class="page-item">
        <a class="page-link" onclick="checkBox(${pager.endPageNo+1})">
          <span>&rsaquo;</span>
        </a>
      </li>
    </c:if>
    
    <li class="page-item">
      <a class="page-link" onclick="checkBox(${pager.totalPageNo})">
        <span>&raquo;</span>
      </a>
    </li>
  </ul>
</nav><!-- End Pagination -->
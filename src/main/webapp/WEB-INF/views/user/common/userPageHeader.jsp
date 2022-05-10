<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


    <!-- 내용 -->
    <!-- 전체 내용이 들어갈 -->
    <div class="" style="margin-left: 300px;">
        <div class="d-flex flex-column text-center">
            <div id="userHeader" class="row align-items-center shadow" style="padding-top: 2rem; padding-bottom: 2rem; margin-bottom: 2rem;">
                <div class="col text-right" >
                    <i class="bi bi-person-circle" style="font-size: 150px; color: white;"></i>
                </div>
                <div class="col text-left" style="color: white; font-weight: 500;">
                    <span style="font-weight: 700; font-size: 2.5rem;">${user.uname}</span>님<br>
                    <span style="font-weight: 300; font-size: 1rem; margin-left: 0.2rem;">가입일: <fmt:formatDate pattern="yyyy-MM-dd" value="${user.umembershipdate}"/></span>
                </div>
            </div>
            
        <style>
			#userHeader {
				background: url('${pageContext.request.contextPath}/resources/images/mypageBg3.png') no-repeat;
				background-size: cover;
				position: relative;
			}
			
			#userHeader:before{
			  content: "";
			  background: rgba(32, 54, 68, 0.6);
			  position: absolute;
			  bottom: 0;
			  top: 0;
			  left: 0;
			  right: 0;
			}
    	</style>
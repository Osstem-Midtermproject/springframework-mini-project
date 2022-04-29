<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

<form method="post" action="${pageContext.request.contextPath}/management/modifymanagementForm">
	<div class="card">
		<h5 class="card-title" style="margin-left: 2rem">회원 정보 수정</h5>

		<div class="card"
			style="display: flex; margin: 20px; height: 50px; justify-content: center;">
			<div class="d-flex align-items-center " style="margin-left: 20px;">
				<div style="width:5rem;">이름 :</div>
			
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<input type="text" name="uname" class="form-control" style="margin-left: 1rem; width: 80rem"
							value="${User.uname}">
					</div>
				
			</div>
		</div>



		<div class="card"
			style="display: flex; margin: 20px; height: 50px; justify-content: center;">
			<div class="d-flex align-items-center " style="margin-left: 20px;">
				<div style="width:5rem;">병원 위치 :</div>
				
				
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<input type="text" name="uaddress" class="form-control" style="margin-left: 1rem; width: 80rem"
							value="${User.uaddress}">
					</div>
			
			</div>
		</div>

		<div class="card"
			style="display: flex; margin: 20px; height: 50px; justify-content: center;">
			<div class="d-flex align-items-center " style="margin-left: 20px;">
				<div style="width:5rem;">전화번호 :</div>
				
				
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<input type="text" name="uphonenumber" class="form-control" style="margin-left: 1rem; width: 80rem"
							value="${User.uphonenumber}">
					</div>
				
			</div>
		</div>



		<div class="card"
			style="display: flex; margin: 20px; height: 50px; justify-content: center;">
			<div class="d-flex align-items-center " style="margin-left: 20px;">
				<div style="width:5rem;">아이디 :</div>
				
					<div class="input-group">
						<div class="input-group-prepend"></div>
						<input type="text" name="userid" style="margin-left: 1rem; width: 80rem" class="form-control" value="${User.userid}">
					</div>
				
			</div>
		</div>
	
		<button type="submit" class="btn btn-primary btn-sm" value="수정" style="margin: 30px;">수정</button>
	  
	  </form>
	
	</div>
</main>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
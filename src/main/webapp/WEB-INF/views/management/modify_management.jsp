<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="card">
        <h5 class="card-title" style="margin-left: 25px">회원 정보 수정</h5>

        <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
          <div class="d-flex align-items-center " style="margin-left: 20px;">
            이름 :
          </div>	
          
        </div> 

          <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
            <div class="d-flex align-items-center " style="margin-left: 20px;">
              병원 위치 :
			      </div>	
          </div>  

          <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
            <div class="d-flex align-items-center " style="margin-left: 20px;">
              전화 번호 :
			      </div>	
          </div>  

          <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
            <div class="d-flex align-items-center "style="margin-left: 20px;">
              병원장:  <input type="text" name="mid" class="form-control" style="width: 10rem" value = "${ch14Member.mid}"> </div>	
			     
          </div> 

          <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
            <div class="d-flex align-items-center " style="margin-left: 20px;">
              아이디  :
			      </div>	
          </div> 
          
          <form method="post" action="join">
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
				<input type="text" name="mid" class="form-control" value = "${ch14Member.mid}">
			</div>
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">mname</span></div>
				<input type="text" name="mname" class="form-control" value = "${ch14Member.mname}">
			</div>
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">mpassword</span></div>
				<input type="text" name="mpassword" class="form-control">
			</div>
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text">memail</span></div>
				<input type="email" name="memail" class="form-control" value = "${ch14Member.memail}">
			</div>
			<input class="btn btn-info btn-sm mt-2" type="submit" value="가입"/>
		</form>

          <button type="button" class="btn btn-outline-primary" style="margin: 30px;" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">수정</button>
        </div>
    </div>
  </main>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
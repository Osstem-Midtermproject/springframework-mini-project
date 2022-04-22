<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

<main id="main" class="main">

    <div class="card">
        <h5 class="card-title">회원 정보 수정</h5>

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
              병원장  :
			      </div>	
          </div> 

          <div class="card" style = "display:flex; margin:20px; height: 50px; justify-content: center;">
            <div class="d-flex align-items-center " style="margin-left: 20px;">
              아이디  :
			      </div>	
          </div> 

          <button type="button" class="btn btn-outline-primary" style="margin: 30px;" onclick="location.href='https://dokdo.mofa.go.kr/kor/'">수정</button>
        </div>
    </div>
  </main>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
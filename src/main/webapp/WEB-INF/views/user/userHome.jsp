<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<style>

	html{
		scroll-behavior: smooth;
	}

	
	#hero {
	  width: 100%;
	  height: 100vh;
	  background: url("${pageContext.request.contextPath}/resources/images/userBg2.png") top center;
	  background-size: cover;
	  position: relative;
	  
	}
	
	
	#hero:before {
	  content: "";
	  background: rgba(32, 54, 68, 0.5);
	  position: absolute;
	  bottom: 0;
	  top: 0;
	  left: 0;
	  right: 0;
	}
	
	#hero .hero-container {
	  position: absolute;
	  bottom: 0;
	  top: 0;
	  left: 0;
	  right: 0;
	  display: flex;
	  padding-top: 80px;
	  padding-right : 5rem;
	  justify-content: center;
	  align-items: end;
	  flex-direction: column;
	  text-align: center;
	}
	
	#hero h1 {
	  margin: 0 0 10px 0;
	  font-size: 48px;
	  font-weight: 400;
	  line-height: 56px;
	  color: rgb(198, 171, 124);
	}
	
	#introduction h1{
	  margin: 0 0 10px 0;
	  font-size: 48px;
	  font-weight: 400;
	  line-height: 56px;
	  color: rgb(32, 54, 68);
	}
	
	#hero h2 {
	  color: #eee;
	  margin-bottom: 50px;
	  font-size: 20px;
	  font-weight: 300;
	}
	
	#hero .btn-get-started {
	  font-family: "Lato", sans-serif;
	  font-weight: 400;
	  font-size: 16px;
	  letter-spacing: 1px;
	  display: inline-block;
	  padding: 8px 28px 10px 28px;
	  border-radius: 50px;
	  transition: 0.5s;
	  border: 1px solid #fff;
	  color: white;
	}
	
	#hero .btn-get-started:hover {
	  background: #fff;
	  color: rgb(32, 54, 68);
	  border: 1px solid #70b9b0;
	}
	
	@media (min-width: 1024px) {
	  #hero {
	    background-attachment: fixed;
	  }
	}
	
	@media (max-width: 768px) {
	  #hero h1 {
	    font-size: 28px;
	    line-height: 36px;
	  }
	  
	  #hero h2 {
	    font-size: 18px;
	    line-height: 24px;
	    margin-bottom: 30px;
	  }
	}
</style>


    
  <!-- #hero -->
  <section id="hero">
  <div class="row">
    <div class="hero-container">
    	<div class="col-4">
	      <h1>Welcome to INSSTEM</h1>
	      <h2>성공개원을 위한 파트너 인스템이 디자인하면 다릅니다. INSSTEM에서 전문가와 맞춤상담 하세요.</h2>
	      <a href="#bottom" class="btn-get-started scrollto">Get Started</a>    	
    	</div>
    </div>
  </div>
  </section>
  
<!--   <section id="introduction" class="d-flex" style="padding-top: 25vh; align-items: center; justify-content: center;">
  <div class="row">
    <div class="col" style="background-color: rgb(198, 171, 124); width: 100%; height: 30rem;">
		<h1>성공적인 인테리어를 위한 모든 것이 한 곳에</h1>
	    	
    </div>
  </div>
  </section>
  
  
    <div class="" id="" style="padding-top: 25vh">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="http://www.치과인테리어.kr/images/slides_05.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="http://www.치과인테리어.kr/images/slides_01.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="http://www.치과인테리어.kr/images/slides_02.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="http://www.치과인테리어.kr/images/slides_03.jpg" class="d-block w-100">
                </div>
                <div class="carousel-item">
                    <img src="http://www.치과인테리어.kr/images/slides_04.jpg" class="d-block w-100">
                </div>
            </div>
        </div>
    </div> -->
   


    <div id="bottom" style="" >
        <div class=" " style="width: 100%; min-height: 22vh; background-color: rgb(32, 54, 68);">
            <div class="row justify-content-center pt-4">
                
            </div>
        </div>
    </div>
</body>

</html>
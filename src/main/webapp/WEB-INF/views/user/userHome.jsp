<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="/WEB-INF/views/user/common/header.jsp"%>

<style>

	html{
		scroll-behavior: smooth;
	}

	#hero {
	  width: 100%;
	  height: 80vh;
	  background: url("${pageContext.request.contextPath}/resources/images/userBg3.png") 0 center / 200% repeat-x;
	  position: relative;
	  animation: movebg 10s ease infinite;
	  
	}
	
	@keyframes movebg{
	  	0%	{background-position: 0 center;}
	  	50%	{background-position: 100% center;}
	  	100% {background-position: 200% center;}
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
	      <a href="#introduction" class="btn-get-started scrollto">Get Started</a>    	
    	</div>
    </div>
  </div>
  </section>
  
  <section id="introduction" class="d-flex" style="padding-top: 25vh; align-items: center; justify-content: center;">
  <div class="row">
    <div class="col">
		<h1>성공적인 인테리어를 위한 모든 것이 한 곳에</h1>
	    <h2>성공개원을 위한 파트너 인스템이 디자인하면 다릅니다. INSSTEM에서 전문가와 맞춤상담 하세요.</h2>
	    	
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
    </div>
    <div class="container-fluid">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="G_slider">
            <tbody>
                <tr>
                    <td align="center">
                        <table width="1100" border="0" cellpadding="0" cellspacing="0">
                            <tbody>
                                <tr>
                                    <td style="height: 285px; vertical-align: middle;">
                                        <link rel="stylesheet"
                                            href="http://www.xn--vb0bq4v9ljvwbn1oxre.kr/skin/latest/move_2/style.css">
                                        <section class="n_gallery_wrap">
                                            <div class="n_title_wrap"></div>

                                        </section>
                                        <script type="text/javascript">
                                            var sliderwidth = "1180px"  //스크롤 가로 사이즈
                                            var sliderheight = "197px"  //스크롤 세로 사이즈
                                            var slidespeed = "1"
                                            slidebgcolor = "transparent"  // 배경색을 주시려면 #99cc00 등과 같이 바꾸시면 됩니다 !

                                            var leftarrowimage = "http://www.xn--vb0bq4v9ljvwbn1oxre.kr/skin/latest/move_2/img/left.gif";
                                            var rightarrowimage = "http://www.xn--vb0bq4v9ljvwbn1oxre.kr/skin/latest/move_2/img/right.gif";

                                            var leftrightslide = new Array()
                                            var finalslide = ''

                                            leftrightslide[0] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2203/thumb-146ba57ab75c01a3cd5b687ffb6243fc_1646874052_35_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[1] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2203/thumb-146ba57ab75c01a3cd5b687ffb6243fc_1646873939_98_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[2] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2203/thumb-146ba57ab75c01a3cd5b687ffb6243fc_1646873762_66_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[3] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2202/thumb-cb3f87e5695c4f7c27128ea948b33d04_1643875801_85_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[4] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2202/thumb-cb3f87e5695c4f7c27128ea948b33d04_1643875281_11_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[5] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2112/thumb-477502bbef30332873703ee1fba15fb9_1639444056_77_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[6] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-efad1ae88d268a6f32a5f0b45e5f4421_1637720149_33_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[7] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-efad1ae88d268a6f32a5f0b45e5f4421_1637719934_41_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[8] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-5ef0213e95e70030159a9a7f782e4e5a_1637202089_02_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[9] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-5ef0213e95e70030159a9a7f782e4e5a_1637026943_54_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[10] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2111/thumb-43c2f14f363a92e5701979d63e5bab40_1636945414_33_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[11] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2108/thumb-ec94badb36a94a41274ef897c87d0df5_1630386496_66_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[12] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2106/thumb-6536abc83d10d1cb4c3c7be52899ef08_1624414449_41_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[13] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2106/thumb-6536abc83d10d1cb4c3c7be52899ef08_1624414387_9_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[14] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2105/thumb-5ea1f6cf068a623a720e1d0d2e60a35a_1622162292_3_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[15] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2105/thumb-5ea1f6cf068a623a720e1d0d2e60a35a_1622161276_66_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[16] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2105/thumb-89c24a1d88b950add26a60c591265431_1621840884_29_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[17] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2103/thumb-fd91154412042490d75aa1f84e655a4e_1616550016_66_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[18] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2102/thumb-f47f4efc52c742b994778a1728a183f3_1613546021_1_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[19] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2101/thumb-73808600fbac93865475853263cbc928_1611813446_55_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[20] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2012/thumb-f0ac8afedac8851a6159bf147bb18a33_1606960341_12_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[21] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2011/thumb-e44e6dd90c600cab052ab4d1c9cbd40c_1605084253_9_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[22] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2011/thumb-e44e6dd90c600cab052ab4d1c9cbd40c_1605083172_16_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";
                                            leftrightslide[23] = "&nbsp;&nbsp;&nbsp;<A HREF='#' ><img src='http://www.xn--vb0bq4v9ljvwbn1oxre.kr/data/editor/2010/thumb-39e4bfde2a90a605f1b84c12bc21fc62_1603849038_65_300x197.jpg' border=0 width='300' height='197' ></A>&nbsp;&nbsp;&nbsp;";


                                            var imagegap = ""
                                            var slideshowgap = 0

                                            var copyspeed = slidespeed
                                            leftrightslide = '<nobr>' + leftrightslide.join(imagegap) + '</nobr>'
                                            var iedom = document.all || document.getElementById
                                            if (iedom)
                                                document.write('<span id="temp" style="visibility:hidden;position:absolute;top:-100px;left:-9000px">' + leftrightslide + '</span>')

                                            var actualwidth = ''
                                            var cross_slide, ns_slide
                                            var righttime, lefttime

                                            function fillup() {
                                                if (iedom) {
                                                    cross_slide = document.getElementById ? document.getElementById("test2") : document.all.test2
                                                    cross_slide2 = document.getElementById ? document.getElementById("test3") : document.all.test3
                                                    cross_slide.innerHTML = cross_slide2.innerHTML = leftrightslide
                                                    actualwidth = document.all ? cross_slide.offsetWidth : document.getElementById("temp").offsetWidth
                                                    cross_slide2.style.left = actualwidth + slideshowgap + "px"
                                                }
                                                else if (document.layers) {
                                                    ns_slide = document.ns_slidemenu.document.ns_slidemenuorange
                                                    ns_slide2 = document.ns_slidemenu.document.ns_slidemenu3
                                                    ns_slide.document.write(leftrightslide)
                                                    ns_slide.document.close()
                                                    actualwidth = ns_slide.document.width
                                                    ns_slide2.left = actualwidth + slideshowgap
                                                    ns_slide2.document.write(leftrightslide)
                                                    ns_slide2.document.close()
                                                }
                                                lefttime = setInterval("slideleft()", 30)
                                            }
                                            window.onload = fillup

                                            function slideleft() {
                                                if (iedom) {
                                                    if (parseInt(cross_slide.style.left) > (actualwidth * (-1) + 8))
                                                        cross_slide.style.left = parseInt(cross_slide.style.left) - copyspeed + "px"
                                                    else
                                                        cross_slide.style.left = parseInt(cross_slide2.style.left) + actualwidth + slideshowgap + "px"
                                                    if (parseInt(cross_slide2.style.left) > (actualwidth * (-1) + 8))
                                                        cross_slide2.style.left = parseInt(cross_slide2.style.left) - copyspeed + "px"
                                                    else
                                                        cross_slide2.style.left = parseInt(cross_slide.style.left) + actualwidth + slideshowgap + "px"
                                                }
                                                else if (document.layers) {
                                                    if (ns_slide.left > (actualwidth * (-1) + 8))
                                                        ns_slide.left -= copyspeed
                                                    else
                                                        ns_slide.left = ns_slide2.left + actualwidth + slideshowgap
                                                    if (ns_slide2.left > (actualwidth * (-1) + 8))
                                                        ns_slide2.left -= copyspeed
                                                    else
                                                        ns_slide2.left = ns_slide.left + actualwidth + slideshowgap
                                                }
                                            }

                                            function slideright() {
                                                if (iedom) {
                                                    if (parseInt(cross_slide.style.left) < (actualwidth + 8))
                                                        cross_slide.style.left = parseInt(cross_slide.style.left) + copyspeed + "px"
                                                    else
                                                        cross_slide.style.left = parseInt(cross_slide2.style.left) + actualwidth * (-1) + slideshowgap + "px"
                                                    if (parseInt(cross_slide2.style.left) < (actualwidth + 8))
                                                        cross_slide2.style.left = parseInt(cross_slide2.style.left) + copyspeed + "px"
                                                    else
                                                        cross_slide2.style.left = parseInt(cross_slide.style.left) + actualwidth * (-1) + slideshowgap + "px"
                                                }
                                                else if (document.layers) {
                                                    if (ns_slide.left > (actualwidth * (-1) + 8))
                                                        ns_slide.left -= copyspeed
                                                    else
                                                        ns_slide.left = ns_slide2.left + actualwidth + slideshowgap
                                                    if (ns_slide2.left > (actualwidth * (-1) + 8))
                                                        ns_slide2.left -= copyspeed
                                                    else
                                                        ns_slide2.left = ns_slide.left + actualwidth + slideshowgap
                                                }
                                            }

                                            function right() {
                                                if (lefttime) {
                                                    clearInterval(lefttime)
                                                    clearInterval(righttime)
                                                    righttime = setInterval("slideright()", 30)
                                                }
                                            }

                                            function left() {
                                                if (righttime) {
                                                    clearInterval(lefttime)
                                                    clearInterval(righttime)
                                                    lefttime = setInterval("slideleft()", 30)
                                                }
                                            }
                                            document.write('<table width=' + sliderwidth + ' border="0" cellspacing="0" cellpadding="0">');
                                            document.write('<tr><td align=center valign=middle width=50><img src=' + leftarrowimage + ' onMouseover="left(); copyspeed=2" onMouseout="copyspeed=1" style="cursor:hand"></td>')


                                            if (iedom || document.layers) {
                                                with (document) {
                                                    document.write('<td>')
                                                    if (iedom) {
                                                        write('<div style="position:relative;width:' + sliderwidth + ';height:' + sliderheight + ';overflow:hidden">')
                                                        write('<div style="position:absolute;width:' + sliderwidth + ';height:' + sliderheight + ';background-color:' + slidebgcolor + '" onMouseover="copyspeed=0" onMouseout="copyspeed=1">')
                                                        write('<div id="test2" style="position:absolute;left:0px;top:0px"></div>')
                                                        write('<div id="test3" style="position:absolute;left:-1100px;top:0px"></div>')
                                                        write('</div></div>')
                                                    }
                                                    else if (document.layers) {
                                                        write('<ilayer width=' + sliderwidth + ' height=' + sliderheight + ' name="ns_slidemenu" bgColor=' + slidebgcolor + '>')
                                                        write('<layer name="ns_slidemenuorange" left=0 top=0 onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
                                                        write('<layer name="ns_slidemenu3" left=0 top=0 onMouseover="copyspeed=0" onMouseout="copyspeed=slidespeed"></layer>')
                                                        write('</ilayer>')
                                                    }
                                                    document.write('</td>')
                                                }
                                            }

                                            document.write('<td width="50" align=center valign=middle><img src=' + rightarrowimage + ' onMouseover="right();copyspeed=2" onMouseout="copyspeed=1" style="cursor:hand"></td></tr></table>')

                                        </script>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div> 



    <footer style="" >
        <div class="container-fluid " style="width: 100%; min-height: 22vh; background-color: #3d3d3d;">
            <div class="row justify-content-center pt-4">
                <img src="${pageContext.request.contextPath}/resources/images/footimg.png">
            </div>
        </div>
    </footer>
</body>

</html>
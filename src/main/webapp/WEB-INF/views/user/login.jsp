<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        

    <style>
        .img-wrapper {
            margin: 40px 40px;
        }

        .form-control {
            height: calc(1.5em + 2em + 2px);
        }

        a:link { color: gray; text-decoration: none;}
        a:visited { color: black; text-decoration: none;}
        a:hover { color: rgba(242, 101, 34); text-decoration: underline;}

        .find {
            margin: 20px;
        }
        
        
        
    </style>

</head> 
<body>
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
       <div>
           <div class="img-wrapper"style="height:170px; width: 300px;"><a href="${pageContext.request.contextPath}/user/userHome" ><img src="${pageContext.request.contextPath}/resources/images/osstem_ci.png" style="height: 100%; width: 100%;"></a></div>
            <form style="margin-bottom: 1rem;" method="post" action="login">
                    <input type="id" class="form-control" name="userid" placeholder="아이디">
                    <input type="password" class="form-control" name="upassword" placeholder="비밀번호는 6자~20자">
                    
                    <small style="color: red" id="idPasswordError">${error}</small>
            		
            		<button type="submit" class="btn" style="background-color: rgba(242, 101, 34); color: white; width: 100%; height: 50px; font-size: 1.5rem;">로그인</button>
            </form>
            <div class="find justify-content-center align-items-center" style="text-align: center";>
                <a href="#">아이디찾기</a>
                <span style="color: gray;">|</span>
                <a href="#">비밀번호찾기</a>
            </div>
        </div>
    </div>
</body>
</html>
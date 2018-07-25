<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/RegisterSecond.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 
<head>
    <title>네이버 : 회원가입</title>
    <style>
    </style>
</head>
 
<body>
    <div id="naver">
        <div id="header">
            <img src="img/naver.JPG">
        </div>
        <div id="container">
        
            <form name="Regi" action="RegisterAct.jsp">
                <label for="id">아이디</label>
                <div id="idBox" class="box">
                    <input type="text" id="id" name="id" class="input">
                    <span>@naver.com</span>
                </div>
                <p id="redCheck_id" class="redCheck"></p>
 
                <label for="pwd">비밀번호</label>
                <div id="pwdBox" class="box">
                    <input type="password" id="pwd" name="pwd" class="input">
                    <img src="https://static.nid.naver.com/images/ui/join/pc_icon_pass_180417.png">
                </div>
                <p id="redCheck_pwd" class="redCheck"></p>
 
                <label for="pwdCheck">비밀번호 재확인</label>
                <div id="pwdCheckBox" class="box">
                    <input type="password" id="pwdCheck" class="input">
                    <img src="https://static.nid.naver.com/images/ui/join/pc_icon_check_disable_180417.png">
                </div>
                <p id="redCheck_pwdCheck" class="redCheck"></p>
 
                <label for="name">이름</label>
                <div id="nameBox" class="box">
                    <input type="text" id="name" name="name" class="input">
                </div>
                <p id="redCheck_name" class="redCheck"></p>
                
           		<div id="photoBox">
           			<label>프로필 사진</label>
           			<input type="text" id="photo" name="photo">
           			<input type="button" value="프로필 사진 찾기" onclick="photoGet()">
           		</div>
 
                <label>생년월일</label>
                <div id="birth">
                    <input type="number" name="birth_year" placeholder="년(4자)">
                    <select name="birth_mon">
                    <option>월</option>
                    <option>01</option>
                    <option>02</option>
                    <option>03</option>
                    <option>04</option>
                    <option>05</option>
                    <option>06</option>
                    <option>07</option>
                    <option>08</option>
                    <option>09</option>
                    <option>10</option>
                    <option>11</option>
                    <option>12</option>
                    
                     </select>
                    <input type="number" name="birth_day" placeholder="일">
                </div>
                <p id="redCheck_birth" class="redCheck"></p>
 
                <label>성별</label>
          	    <div class="gender-box box1 ">
                <div>
                    <input type="radio" id="man" name="gender" value="M">
                    <label for="man">남자</label>
                </div>
                <div>
                    <input type="radio" id="woman" name="gender" value="F">
                    <label for="woman">여자</label>
                </div>
            </div>
            
                <label for="email">본인 확인 이메일</label>
                <div id="email" class="box">
                    <input type="text" name="email" placeholder="선택입력"  class="input">
                </div>
                <p id="redCheck_email" class="redCheck"></p>
 
                <label for="phone">휴대전화</label>
                <select id="phoneSel" >
                <option value="+82">대한민국 +82</option>
                <option value="+64">네덜란드 +64</option>
                <option value="+47">노르웨이 +47</option>
                <option value="+227">니제르 +227</option>
            </select>
 
                <input type="button" id="phoneBtn" value="인증번호 받기">
                <div id="phoneBox" class="box">
                    <input type="text" id="phone" name="phone" class="input" placeholder="전화번호 입력">
                </div>
 
 
                <div id="serialBox" class="box">
                    <input type="text" id="serialPhone" class="input" placeholder="인증번호 입력하세요">
                </div>
                 <p id="redCheck_phone" class="redCheck"></p>
 
                <input type="submit" id="send" value="가입하기">
            </form>
        </div>
        <div id="footer">
            <ul>
                <li><a href="#">이용약관 </a></li>
                <li><a href="#">개인정보처리방침 </a></li>
                <li><a href="#">책임의 한계와 법적고지 </a></li>
                <li><a href="#">회원정보 고객센터</a></li>
            </ul>
 
            <img src="img/footernaver.JPG">
            <label>Copyright <b>Naver Crop.</b> All Rights Reserved.</label>
 
        </div>
    </div>
</body>
 
</html>
 
 
<script>
	function photoGet(){
		window.open("PhotoGetForm.jsp");
	}
	
    $(document).ready(function(){
        var idReg=/^[A-za-z0-9]{5,20}$/g;
        var pwdReg=/^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        var nameReg=/^[가-힣a-zA-Z]+$/;
        var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 
        
        /*ID*/
        /*포커스인일 때, 초록색 테두리*/
        $('#id').focusin(function(){
            $('#idBox').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#id').focusout(function(){
            $('#idBox').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_id').html("필수 정보입니다.").css('color','red');;
//                $(this).focus();
            
            }else{
                if(!idReg.test($(this).val())){
                   $('#redCheck_id').html("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.").css('color','red');
                }else{
                    $('#redCheck_id').html("멋진 아이디네요!").css('color','#08a600');
                    
                }
            }
        });
        
        
        /*pwd*/
        /*포커스인일 때, 초록색 테두리*/
        $('#pwd').focusin(function(){
            $('#pwdBox').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#pwd').focusout(function(){
            $('#pwdBox').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_pwd').html("필수 정보입니다.").css('color','red');;
            
            }else{
                if(!pwdReg.test($(this).val())){
                   $('#redCheck_pwd').html("6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.").css('color','red');
                }else{
                    $('#redCheck_pwd').html(" ");
                }
            }
        });
  
         
        /*pwdCheck*/
         /*포커스인일 때, 초록색 테두리*/
        $('#pwdCheck').focusin(function(){
            $('#pwdCheckBox').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#pwdCheck').focusout(function(){
            $('#pwdCheckBox').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_pwdCheck').html("필수 정보입니다.").css('color','red');
            
            }else{
                if($(this).val()!=$('#pwd').val()){
                    $('#redCheck_pwdCheck').html("비밀번호가 일치하지 않습니다.").css('color','red');
                }else{
                   $('#redCheck_pwdCheck').html(" ");
                }
            }
        });
        
        
        /*name*/
         $('#name').focusin(function(){
            $('#nameBox').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#name').focusout(function(){
            $('#nameBox').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_name').html("필수 정보입니다.").css('color','red');
            
            }else{
               if(!nameReg.test($(this).val())){
                   $('#redCheck_name').html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)").css('color','red');
                }else{
                    $('#redCheck_name').html(" ");
                }
            }
        });
        
        /*생년월일_년*/
        $('#birth input:nth-child(1)').focusin(function(){
            $(this).css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#birth input:nth-child(1)').focusout(function(){
            $(this).css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_birth').html("필수 정보입니다.").css('color','red');
            
            }else{
               if($(this).val().length!=4){
                   $('#redCheck_birth').html("태어난 년도 4자리를 정확하게 입력하세요.").css('color','red');
               }else{
                   $('#redCheck_birth').html(" ");
               }
            }
        });
        
        
        /*생년월일_월*/
        $('#birth select').focusin(function(){
            $(this).css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#birth select').focusout(function(){
            if($(this).val()=="월"){
                 $('#redCheck_birth').html("생년월일을 다시 확인해주세요.").css('color','red');
            }else{
                $('#redCheck_birth').html(" ");
            }
        });
        
        
        /*생년월일_일*/
        $('#birth input:last-child').focusin(function(){
            $(this).css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#birth input:last-child').focusout(function(){
            $(this).css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_birth').html("필수 정보입니다.").css('color','red');
            
            }else{
               if($(this).val().length>2){
                   $('#redCheck_birth').html("태어난 일(날짜) 2자리를 정확하게 입력하세요.").css('color','red');
               }else{
                   $('#redCheck_birth').html(" ");
               }
            }
        });
        
        
        /*이메일*/
        $('#email input').focusin(function(){
            $('#email').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#email input').focusout(function(){
            $('#email').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_email').html("필수 정보입니다.").css('color','red');
            
            }else{
                 if(!emailReg.test($(this).val())){
                       $('#redCheck_email').html("이메일 주소를 다시 확인해주세요.").css('color','red');
                    }else{
                        $('#redCheck_email').html(" ");
                    }
            }
        });
        
        
        /*전화번호*/
        $('#phone').focusin(function(){
            $('#phoneBox').css('border','1px solid #08a600');
        });
        
        $('#phone').focusout(function(){
            $('#phoneBox').css('border','1px solid rgb(218, 218, 218)');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#phoneBtn').click(function(){
            
            if($('#phone').val()==null || $('#phone').val().trim(" ").length==0){
                $('#redCheck_phone').html("필수 정보입니다.").css('color','red');
            }else{
                if(!($('#phone').val().length==10 || $('#phone').val().length==11)){
                   $('#redCheck_phone').html("형식에 맞지 않는 번호 입니다.").css('color','red');
                }else{
                    $('#redCheck_phone').html(" ");
                    $('#serialPhone').css('background', '#fff');  
                    $('#serialBox').css('background', '#fff');  
                }
            }
        });
        
    });
</script>
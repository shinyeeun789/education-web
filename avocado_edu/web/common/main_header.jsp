<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<div class="hd_wrap">
    <a href="test.html" class="logo">
        <img src="./images/logo_96.png" alt="아보카도 로고타입">
        <p class="logo_title"> 아보카도 </p>
    </a>
    <nav class="tnb">
        <ul class="menu">
            <li><a href=""> 회원가입 </a></li>
            <li><a href=""> 로그인 </a></li>
        </ul>
    </nav>
</div>
<div class="slide_menu">
    <figure class="vs">
        <ul class="img_box">
            <li class="item1 active">
                <input type="radio" name="vs_ra" id="vs_ra1" class="va_ra">
                <div class="bg_box"></div>
                <h2 class="vs_tit"> 온라인 강의와 함께 <br>
                    지식을 키워나가요🌱 </h2>
            </li>
            <li class="item2">
                <input type="radio" name="vs_ra" id="vs_ra2" class="va_ra">
                <div class="bg_box"></div>
                <h2 class="vs_tit"> 학습 스케줄 도우미와 함께 <br>
                    학습 성취도를 높여나가요🌸 </h2>
            </li>
        </ul>
        <ul class="btn_box">
            <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
            <li class="item1 active"><label for="vs_ra2" class="vs_btn"></label></li>
        </ul>
    </figure>
</div>
<script>
    $(function(){
        $(".btn_box li .vs_btn").click(function(){
            var par = $(this).parents("li").index();
            $(".img_box li").removeClass("active");
            $(".img_box li").eq(par).addClass("active");
            $(".btn_box li").removeClass("active");
            $(".btn_box li").eq(par).addClass("active");
        });
        var sw = 1;
        var int1 = setInterval(function(){
            if(sw==1){
                autoplay(1);
                sw = 0;
            } else {
                autoplay(0);
                sw = 1;
            }
        }, 3500);

        function autoplay(n){
            $(".img_box li").removeClass("active");
            $(".img_box li").eq(n).addClass("active");
            $(".btn_box li").removeClass("active");
            $(".btn_box li").eq(n).addClass("active");
        }

        $(".play_btn").click(function(){
            if($(this).hasClass("active")){
                $(this).removeClass("active");
                sw = 1;
                int1 = setInterval(function(){
                    if(sw==1){
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);
            } else {
                $(this).addClass("active");
                sw = 0;
                clearInterval(int1);
            }
        });
    });
</script>
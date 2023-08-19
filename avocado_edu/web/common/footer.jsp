<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<footer class="ft">
    <div class="ft_wrap">
        <nav class="ft_link">
            <ul class="fnb">
                <li class="ft_logo"></li>
                <li><a href="">제휴 문의</a></li>
                <li><a href="">이메일 무단 수집 거부</a></li>
            </ul>
            <ul class="snb">
                <li class="locate">
                    <select name="sel" id="sel" onchange="loc()">
                        <option value="">FAMILY LINK</option>
                        <option value="https://chunjaetext.co.kr/">천재교과서</option>
                        <option value="http://www.milkt.co.kr/Main/Main_new">밀크T</option>
                        <option value="http://www.prinpia.co.kr/">프린피아</option>
                        <option value="http://www.edumon.co.kr/intro/index.asp">에듀몬</option>
                    </select>
                </li>
            </ul>
        </nav>
        <script>
            function loc(){
                var url = document.getElementById("sel").value;
                if(url!="") {
                    var win = window.open(url);
                }
            }
        </script>
    </div>
    <div class="ft_wrap2">
        <p class="copyright">
            <span> (주) 아보카도 </span>
            <span> 서울시 금천구 디지털로9길 23 </span>
            <span> 대표자 신예은 </span>
            <span class="end"> 문의 shinyeeun789@gmail.com </span>
        </p>
        <p class="cp">COPYRIGHT 2023-2023 AVOCADO EDUCATION INC. ALL RIGHTS RESERVED.</p>
    </div>
</footer>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>commentTest</h2>
comment:<input type="text" name="comment"><br>   <%--쓰기하기 위한 input태그--%>
<button id="sendBtn" type="button">저장</button>   <%--send 버튼 누르면 input 내용 저장되게,--%>
<button id="modBtn" type="button">수정</button>   <%--수정 버튼 누르면 input 내용 수,--%>

<div id="commentList"></div>
<script>
    let bno=2896;


<%--    댓글목록 가져온것을 commentList안에 넣게됨--%>
    let showList=function (bno){
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/comments?bno='+bno ,  // 요청 URI
            success : function(result){
                //result에 배열이 들어온다. 배열에 들어오는 결과를 tohtml 함수를 이용해서 li 태그로 만든다음에 commentList에 넣는다.
                $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }


    //댓글 작성
    //send버튼 누르면 comment input 필드에 입력한 값을 가져와서, JSON에 보내준다
    //그러면 컨트롤러가 받아서 ,json-> 자바객체로 바껴서 write 메서드에 넘어옴
    $(document).ready(function() {
        showList(bno);

        //댓글 수정한 후 수정버튼 누르면 입력
        $("#modBtn").click(function () {
            let comment = $("input[name=comment]").val();
            let cno = $(this).attr("data-cno");   //cno 를 가져와줘야 한다. 버튼의 속성 중 data-cno를 가져오면됨

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }
            $.ajax({
                type: 'PATCH',       // 요청 메서드
                url: '/comments/' + cno,  // 요청 URI  /comments/70  PATCH
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({cno: cno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            })
        })


//댓글 입력
        $("#sendBtn").click(function () {
            let comment = $("input[name=comment]").val();

            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/comments?bno=' + bno,  // 요청 URI  /comments?bno=2896
                headers: {"content-type": "application/json"}, // 요청 헤더
                data: JSON.stringify({bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            });
        });

    });


    // //댓글 목록보여줌
    // $(document).ready(function() {
    //     $("#sendBtn").click(function () {
    //         showList(bno);
    //     });

        //댓글수정버튼을 누르면 input창에 댓글이 옮겨져간다.
    $("#commentList").on("click", ".modBtn", function () {
        //위의 .modBtn은 각 커멘트마다 붙어있는 버튼,을 누르면 아래 주석 1,2번의 정보를 전달해준다
        let cno = $(this).parent().attr("data-cno");   //cno 를 가져와줘야 한다. 버튼의 부모의 속성 중 data-cno를 가져오면됨
        let comment = $("span.comment", $(this).parent()).text();  //클릭된 수정버튼의 부모에 있는 span의 comment만 가져오게 함

        //1. comment의 내용을 Input에 넣어준다
        $("input[name=comment]").val(comment);  //span의 comment 가져온 것을 input에 뿌려준다.
        //2. cno 전달하기
        $("#modBtn").attr("data-cno", cno);  //#modBtn  내용입력 후 누르는 수정버튼

    });

            //댓글삭제
        //$(".delBtn").click(function(){
        // 이렇게 넣으면 실행안됨. send버튼을 눌러야 삭제버튼이 생기는데 이렇게 넣으면 그전에 실행되버려서 삭제버튼 실행 불가
        // 아래처럼 하면, send버튼 생길때 commentList는 존재함. commentList안에 있는 delBtn 클래스에 클릭 이벤트를 걸어준다.
        $("#commentList").on("click", ".delBtn", function () {
            let cno=$(this).parent().attr("data-cno");   //cno 를 가져와줘야 한다. 버튼의 부모의 속성 중 data-cno를 가져오면됨
            let bno=$(this).parent().attr("data-bno");

            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/comments/' + cno + '?bno=' + bno,  // 요청 URI
                success: function (result) {
                    alert(result)
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()


    });

    //댓글이 들어오면 댓글을 html로 넣어서 바꿔준다.
    let toHtml =function(comments) {
        let tmp = "<ul>";
        //배열들어온 것을 리스트태그를 이용해서 전체 언오더 리스트를 구성한다음에 넣을것이다.
        comments.forEach(function (comment) {     //배열에서 댓글 하나하나 가져와서 tmp에 쌓는다.
            //댓글번호, 부모댓글번호, 게시글번호, 커멘터,커멘트
            tmp += '<li data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            tmp += ' commenter=<span class="commenter">' + comment.commenter + '</span>'   //span 태그에 넣어야 나중에 따로 읽어오기좋다
            tmp += ' comment=<span class="comment">' + comment.comment + '</span>'        //나중에 수정할때 가져오기 쉽게
            tmp += ' up_date=' + comment.up_date
            tmp += '<button class="delBtn">삭제</button>'      //각 댓글마다 삭제버튼
            tmp += '<button class="modBtn">수정</button>'      //각 댓글마다 수정

            tmp += '</li>'
        })
        return tmp + "</ul>";

    };


</script>
</body>
</html>
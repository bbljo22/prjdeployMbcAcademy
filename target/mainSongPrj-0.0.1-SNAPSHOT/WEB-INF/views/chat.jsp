<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script type="text/javascript">
    var stompClient = null;

    function connect() {
        var socket = new SockJS('<%= request.getContextPath() %>/chat-ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function (frame) {
            console.log('Connected: ' + frame);
            $("#chatMessageArea").append("연결되었습니다.<br>");
            stompClient.subscribe('/topic/messages', function (message) {
                showMessage(message.body);
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
        console.log("Disconnected");
        $("#chatMessageArea").append("연결을 끊었습니다.<br>");
    }

    function sendMessage() {
        var nickname = $("#nickname").val();
        var message = $("#message").val();
        stompClient.send("/app/sendMessage", {}, nickname + ": " + message);
        $("#message").val("");
    }

    function showMessage(message) {
        $("#chatMessageArea").append(message + "<br>");
        var chatAreaHeight = $("#chatArea").height();
        var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
        $("#chatArea").scrollTop(maxScroll);
    }

    $(document).ready(function() {
        $('#message').keypress(function(event) {
            var keycode = (event.keyCode ? event.keyCode : event.which);
            if (keycode == '13') {
                sendMessage(); 
            }
            event.stopPropagation();
        });
        $('#sendBtn').click(function() { sendMessage(); });
        $('#enterBtn').click(function() { connect(); });
        $('#exitBtn').click(function() { disconnect(); });
    });
</script>
<style>
#chatArea {
    width: 100%; height: 300px; overflow-y: auto; border: 1px solid black;
}
</style>
</head>
<body>
    이름:<input type="text" id="nickname">
    <input type="button" id="enterBtn" value="입장">
    <input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>

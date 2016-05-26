<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telphone=no, email=no">
    <base href="http://www.wit-orange.com/static/h5/static/hrth/" />
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="bg"><img src="images/bg.jpg"></div>
    <div class="logo"><img src="images/logo.png"></div>
    <div class="title_big myscale"><img src="images/title_big.png"></div>
    <div class="title_small"><img src="images/title_small.png"></div>
    <div class="form1">
        <div>
            <span class="form_title">在下列【互动对话】框输入信息"确认"即可</span>
        </div>
        <div class="form_body">
            <div class="name">
                <div class="name_lable">
                    <label for="">客户姓名:</label>
                </div>
                <div class="name_input">
                    <input type="text" name="" value="" maxlength="10">
                </div>
            </div>
            <div class="tel">
                <div class="tel_lable">
                    <label for="">联系方式:</label>
                </div>
                <div class="tel_input">
                    <input type="tel" name="" value="" maxlength="11">
                </div>
            </div>
            <div class="submit">
                <img src="images/submit.png" alt="">
            </div>
        </div>
    </div>
    <div class="warming"><img src="images/warming.png"></div>
    <div class="hrinfo">
        <div class="info"><img src="images/hrinfo.png" alt=""></div>
        <div class="qrcode"><img src="images/qrcode.png" alt=""></div>
    </div>
    <div class="dialog">
        <div class="dialogMsg"></div>
        <hr>
        <div class="ok">好</div>
    </div>
    <div class="float_bg">
        <div class="float"><img src="images/qrcode.png" alt=""></div>
    </div>
    <script type="text/javascript" src="js/zepto.min.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" src="js/tools.js"></script>
    <script type="text/javascript" src="js/validator.js"></script>
    <script type="text/javascript">
    $(function() {
        // jssdk();

        $('.qrcode>img').on('click', function() {
            $('.float_bg').css({
                "display": "block"
            });
            $('.float_bg').on('click', function() {
                $('.float_bg').css({
                    "display": "none"
                });
            });
        });

        // 提交信息
        $('.submit>img').on('click', function() {
            var tel = $('.tel_input>input').val();
            var name = $('.name_input>input').val();

            if (!isName(name)) {
                showDialog("请输入合法姓名");
                return;
            }
            if (!istel(tel)) {
                showDialog("请输入正确的号码");
                return;
            }
            $.ajax({
                url: '/hrth/submit',
                type: 'POST',
                data: {
                    tel: tel,
                    name: name
                },
                success: function(data) {
                    var verifyCode = data;
                    var userinfo = {};
                    userinfo.name = name;
                    userinfo.verifyCode = verifyCode;
                    var storage = window.localStorage;
                    storage.setItem("userinfo",JSON.stringify(userinfo));
                    location.href = "code.html";

                },
                error: function(data) {
                    console.log(data)
                    if (JSON.parse(data.response).message.code == 11000) {
                        showDialog("无法重复获取验证码");
                    } else {
                        showDialog(JSON.parse(data.response).message);
                    }

                }
            });
        });

        //弹出框
        function showDialog(msg, _callback) {
            $('.dialog .dialogMsg').text(msg);
            $('.dialog').css("display", "block");
            $('.dialog .ok').on('click', function() {
                $('.dialog').css("display", "none");
                execCallBack(_callback);
            });
        }

        $('.share_btn>img').on('click', function() {
            $('.float').css({
                "display": "block"
            });
            $('.float').on('click', function() {
                $('.float').css({
                    "display": "none"
                });
            });
        });



    })
    </script>
</body>

</html>

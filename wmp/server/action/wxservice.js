//用到的模块
var wechat = require('wechat');
// var wechat = require('../model/wechat.js');
var menu = require('../model/menu.js');

//应用信息的配置
//测试帐号
// var appid = 'wx2fb3bedb2b468477';
// var secret = '617917dc8ff556b69257269d522d1ae3';

//启航
// var appid = 'wx1120ac5acbe9b01f';
// var secret = '73a1d0b075c94c8a7028876878da29a5';
// var encodingAESKey = 'uTP78PuIKKDCIFoqfogdQ0WPB9f7vhYA1nBjh9KeoGu';
// var token = 'fogdQ0WPB9f7vhYA1nB';
//广州智讯互动
var appid = 'wx43233b4496331a8a';
var secret = 'c61c11c4c6170e4eaa554d9d147969b9';
var encodingAESKey = '9nP01akXX3JhzIn71Focr8mSaGoVVrxgAwDikDiiycM';
var token = '3JhzIn71Focr8mSaGo';


var domainName = 'http://www.wit-orange.com';
var config = {
    token: token,
    appid: appid,
    secret: secret,
    encodingAESKey: encodingAESKey
};





module.exports.get = function(req, res, next) {
    //创建自定义菜单
    menu(config, function() {});
    /*****************************公众平台接入******************************/
    // wechat(config)(req,res,next);
    wechat(config, function() {})(req, res, next);

}
module.exports.post = function(req, res, next) {
    // //配置回复信息
    wechat(config, function() {
        // 微信输入信息都在req.weixin上
        var message = req.weixin;
        console.log(message)
        if (message.Content === 'diaosi') {
            // 回复屌丝(普通回复)
            res.reply('hehe');
        } else if (message.FromUserName === 'text') {
            //你也可以这样回复text类型的信息
            res.reply({
                content: 'text object',
                type: 'text'
            });
        } else if (message.FromUserName === 'hehe') {
            // 回复一段音乐
            res.reply({
                type: "music",
                content: {
                    title: "来段音乐吧",
                    description: "一无所有",
                    musicUrl: "http://mp3.com/xx.mp3",
                    hqMusicUrl: "http://mp3.com/xx.mp3",
                    thumbMediaId: "thisThumbMediaId"
                }
            });
        } else {
            // 回复高富帅(图文回复)
            res.reply([{
                title: '你来我家接我吧',
                description: '这是女神与高富帅之间的对话',
                picurl: 'http://nodeapi.cloudfoundry.com/qrcode.jpg',
                url: 'http://nodeapi.cloudfoundry.com/'
            }]);
        }

    })(req, res, next);


}

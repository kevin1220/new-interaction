module.exports = function(config) {
    var menus = {
        "button": [{
            "type": "click",
            "name": "今日歌曲",
            "key": "V1001_TODAY_MUSIC"
        }, {
            "name": "菜单",
            "sub_button": [{
                "type": "view",
                "name": "搜索",
                "url": "http://www.soso.com/"
            }, {
                "type": "view",
                "name": "视频",
                "url": "http://v.qq.com/"
            }, {
                "type": "click",
                "name": "赞一下我们",
                "key": "V1001_GOOD"
            }]
        }]
    }
    var token = require('./token.js');
    token(config)
        .then(function(data) {
            console.log(data)
            yog.ralP('wxmenu_create', {
                    query: {
                        access_token: data.access_token,
                    },
                    data: menus,
                })
                .then(function(data) {
                    console.log('创建自定义菜单成功:' + JSON.stringify(data));
                })
                .catch(function() {
                    console.log('创建自定义菜单失败');
                });
        })
        .catch(function(err) {
            yog.log.debug("获取token失败:" + err)
        });


}

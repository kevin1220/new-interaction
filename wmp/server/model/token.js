module.exports = function(config) {
    return yog.ralP('wxtoken', {
            data: {
                'appid': config.appid,
                'secret': config.secret,
            }
        });
}

1 application 中初始化
           HttpUtils.init(this);
2 全局配置
           HttpUtils.getInstance()
                    .ConfigGlobalHttpUtils()
                    //全局的BaseUrl
                    .setBaseUrl("https://www.baidu.com/")
                    //开启缓存策略
                    .setCache()
                    //全局的请求头信息
                    //.setHeaders(headerMaps)
                    //全局持久话cookie,保存本地每次都会携带在header中
                    .setCookie(false)
                    //全局ssl证书认证
                    //信任所有证书,不安全有风险
                    .setSslSocketFactory()
                    //使用预埋证书，校验服务端证书（自签名证书）
                    //.setSslSocketFactory(getAssets().open("your.cer"))
                    //使用bks证书和密码管理客户端证书（双向认证），使用预埋证书，校验服务端证书（自签名证书）
                    //.setSslSocketFactory(getAssets().open("your.bks"), "123456", getAssets().open("your.cer"))
                    //全局超时配置
                    .setReadTimeOut(10)
                    //全局超时配置
                    .setWriteTimeOut(10)
                    //全局超时配置
                    .setConnectionTimeOut(10)
                    //全局是否打开请求log日志
                    .setLog(true);
3 单个配置
           HttpUtils.getInstance()
                    .ConfigSingleInstance()
                    .baseUrl("https://www.baidu.com/")
                    .createService(ApiService.class)
                    .getInterface()
                    .compose(new ObservableTransformer<Bean>(loading_dialog))
                    .subscribe(new CommonObserver<Bean>(loading_dialog) {
                        @Override
                        protected void onError(String errorMsg) {

                        }

                        @Override
                        protected void onSuccess(Bean bean) {

                        }
                    });
1.项目功能：  
    属于车载端与手机端视频传输模块中的手机端demo程序。接收由车载端发送的经H264压缩的视频后解压并显示。
2.环境配置：
    1）iMX6q 车载板机需要编译gstreamer 1.0 框架
    2）Android开发环境配置（eclipse为例）
        a)下载gstreamer sdk for android (本项目使用 gstreamer 0.1版本sdk )到/opt/gstreamer-sdk-android-arm-release-2013.6
        b)环境变量配置，对ubuntu 14.04 sudo gedit /etc/profile 在profile 中添加export GSTREAMER_SDK_ROOT_ANDROID=/opt/gstreamer-sdk-android-arm-release-2013.6
          终端执行 . /etc/profile 立即生效 其他平台参考 http://docs.gstreamer.com/display/GstSDK/Installing+for+Android+development
        c)eclipse 需要配置ndk 版本需要是r9d
        d)eclipse 配置gstreamer sdk 路径，在eclipse的菜单栏 window >> preferences >> C/C++(左侧边栏中) 目录下>> Build 目录下 >> Build Variables >> Add (右侧边栏) 
                  在弹窗中Variable name 设置为 GSTREAMER_SDK_ROOT_ANDROID  Type设置为 Directory  Value 设置为 /opt/gstreamer-sdk-android-arm-release-2013.6
3.项目导入
    1)clipse 中 import gstreamer sdk 中的tutorial-3 
    2)右键 tutorial-3 >> Android tool >> Add Native Support >> Finish(Library name 可以改动，这里选择默认)
    3)修改代码逻辑
4.注意事项
    1)修改该项目网络权限：在项目中AndroidManifest.xml 文件中 添加<uses-permission android:name="android.permission.INTERNET" />
    2)工程的tutorial-3.c 文件中 gst_parse_launch（）中的解码element 选用fdec_h264，选择其他的也可以，但必须适合gstreamer sdk for android 0.1版本
    3)工程的Android.mk 文件中需要设置 GSTREAMER_PLUGINS$(GSTREAMER_PLUGINS_CORE) $(GSTREAMER_PLUGINS_SYS) $(GSTREAMER_PLUGINS_EFFECTS) $(GSTREAMER_PLUGINS_NET) $(GSTREAMER_PLUGINS_CODECS_RESTRICTED) $(GSTREAMER_PLUGINS_PLAYBACK) $(GSTREAMER_PLUGINS_CODECS) $(GSTREAMER_PLUGINS_ENCODING) 
                       和GSTREAMER_SDK_ROOT_ANDROID  :=/opt/gstreamer-sdk-android-arm-release-2013.6

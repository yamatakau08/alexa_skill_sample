
# Table of Contents

1.  [PaizaCloud 側](#org0e62f79)
2.  [alexa developer console側](#orgf1f6120)


<a id="org0e62f79"></a>

# PaizaCloud 側

open ターミナル

    $ cd
    $ git clone https://github.com/yamatakau08/alexa_skill_sample.git
    $ cd alexa_skill_sample/weather/server/
    $ ls
    livedoor_forecast.rb  my_weather.rb
    $ sudo ruby ./my_weather.rb -o 0 -p 80
    ...

プログラムを変更した場合、Ctrl-C で中断し、再度、
sudo ruby &#x2026;
実行する。


<a id="orgf1f6120"></a>

# alexa developer console側

-   Alexaシュミレータ "自宅の天気" と入力
-   PaizaCloud側のServerが返すJSON が出力として表示されるので正しい動作をしているか確認する
-   endpointは、PaizaCloud側のurlを指定する


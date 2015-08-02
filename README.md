# Mtime-iOS
模仿Mtime时光网iOS App客户端做的精仿Mtime，仅供学习<br>
***
做此项目，对之前学习的UI知识进行一个综合的应用，用到了SDWebImage，UIViewExt的基本框架<br>
项目中应用最多的还是tableView，collectionView等等的应用
***
接下来介绍下实现的功能：<br>
1、首次下载使用App启动会有引导界面，创建了一个scrollView，最后点击start Mtime进入登陆页面<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic0.png)  <br>
***
2、进入登陆页面<br>
一个旋转的图片展示页面<br>
展示完毕后进入App<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic1.png)  <br>
***
3、电影页面<br>
下图，上面有个小海报，和下图的大海报，两者的图片滑动式同步的，同时点击大海报会翻转显示电影细节<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic2.png)  <br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic3.png)  <br>
点击右上角，页面会翻转到tableView形式展示电影列表<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic4.png)  <br>
***
4、新闻页面
tableView的新闻展示界面，同时下拉，透视图会放大，点击小新闻带有图片图标的会进入图片浏览页面，点击普通进入一个webView页面，这个页面没有细做，只是实现功能<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic5.png)  <br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic8.png)  <br>
***
5、图片浏览<br>
类似一个相册的功能，collectionViewCell<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic6.png)  <br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic7.png)  <br>
***
6、Top页面，同样是collectionView的应用<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic9.png)  <br>
***
7、点击Top界面的图标会进入电影详情页面<br>
头视图包括基本的信息，和一个collectionView，部collectionView中的图片可以点击进入视频页面
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic10.png)  <br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic11.png)  <br>
***
8、影院页面，一个列表，展示影院<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic12.png)  <br>
***
9、更多页面，一些操作，点击清除缓存会跳出缓存操作确认框，涉及沙盒操作<br>
![](https://github.com/nongchaozhe/Mtime-iOS/raw/master/screenshots/pic13.png)  <br>
***
如有错误请指出，仅供初学者学习用~ <br>

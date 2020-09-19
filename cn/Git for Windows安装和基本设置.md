# Git for Windows安装和基本设置

文章来源https://www.cnblogs.com/vitah/p/3612473.html，已做部分增加和修改



1、下载地址：

https://git-scm.com/download/win

 

2、下载完成后安装，安装路径自己选择，其他的选项参照下图：

![img](../files/Git for Windows安装和基本设置/git_for_win-1.jpg)

![img](../files/Git for Windows安装和基本设置/git_for_win-2.jpg.jpg)

![img](../files/Git for Windows安装和基本设置/git_for_win-3.jpg)

其他的一步一步往下即可，最后Finish完成安装；

 

3、配置github的ssh密钥:

(1)打开Git Bash查看电脑上是否已经存在SSH密钥：

输入 cd ~/.ssh

![img](../files/Git for Windows安装和基本设置/git_for_win-4.png)

若如上图显示无法找到该文件则要创建新的ssh key;

(2)创建新的ssh key:

输入 ssh-keygen -t rsa -C "your_email@youremail.com" 

![img](../files/Git for Windows安装和基本设置/git_for_win-5.jpg)

执行这条命令会如上图提示文件保存路径，可以直接按Enter，

然后提示输入 passphrase（密码），输入两次（可以不输直接两次Enter），

![img](../files/Git for Windows安装和基本设置/git_for_win-6.jpg)

然后会在 .ssh 目录生产两个文件：id_rsa和id_rsa.pub

<img src="../files/Git for Windows安装和基本设置/01.JPG" style="zoom:67%;" />

用记事本打开.ssh目录下的id_rsa.pub文件，复制里面的内容；

 <img src="../files/Git for Windows安装和基本设置/02.JPG" style="zoom:50%;" />

4、复制ssh key到github：

On the GitHub site Click “Account Settings” > Click “SSH Keys” > Click “Add SSH key”

打开github网站，点击右上角扳手图标，然后点击左边菜单的 ssh key， 然后右边页面的 add ssh key，将复制的内容粘贴到github的key中，title可以不填，直接保存即可。

<img src="../files/Git for Windows安装和基本设置/03.JPG" style="zoom: 67%;" />

<img src="../files/Git for Windows安装和基本设置/04.JPG" style="zoom: 67%;" />

<img src="../files/Git for Windows安装和基本设置/05.jpg" style="zoom:67%;" />

 

5、测试 ssh 链接 github：

输入 ssh -T git@github.com

![img](../files/Git for Windows安装和基本设置/git_for_win-7.jpg)

出现Successfully就OK；

 

6、设置自己的git信息：

输入

git config --global user.name "Firstname Lastname" （此处name可修改也不是用于登录github的登录名）

git config --global user.email "your_email@youremail.com"

设置自己的git信息即完成安装和设置，可以输入git config --list查看自己的git信息。
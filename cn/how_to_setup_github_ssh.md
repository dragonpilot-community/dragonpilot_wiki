## OP设置SSH-绑定GitHub账户

从0.83开始，安装好OP后会删掉原来通用的ssh密钥信息，无法进行ssh/sftp登录。若需要登录，需要在OP里面绑定GitHub账户里头的ssh公钥。

### 一、快捷偷懒的办法

由于拥有OP公共ssh密钥的人非常多，所以用这个存在一定的安全隐患，例如若你的WIFI环境被其他人访问，那么他完全可以登录到你的设备进行破坏，甚至影响你的安全驾驶！

1. 打开 "设置 - 网络" 

2. Enable SSH选项打开

3. SSH keys选项点击“ADD”， 添加GitHub账户“ brianhaugen2 ”

   ![20210422012410](../files/how_to_setup_github_ssh/20210422012410.jpg)
key下载地址(https://wiki.dpp.cool/otherFiles/key/eon_rsa_key.txt)
### 二、正确的创建ssh密钥办法

1、进入https://github.com/ ，点击右上角的“Sign up”注册账号![20210422013111](../files/how_to_setup_github_ssh/20210422013111.png)



**“Username” 需要唯一， 这个ID将是你稍后在OP里面填写的GitHub ID。**

<img src="../files/how_to_setup_github_ssh/1619026509845.png" alt="1619026509845" style="zoom: 67%;" />

2、注册账号完成， 邮件认证通过后，进入https://github.com/settings/keys 添加ssh公钥

![QQ截图20210422010439](../files/how_to_setup_github_ssh/QQ截图20210422010439.png)

这时，聪明的朋友一定会问，这个key文本框里面的东西怎么来？你若是安装了putty，可以使用里面带的工具“PuTTYgen”

![1619026906570](../files/how_to_setup_github_ssh/1619026906570.png)

如果你已经用“快捷偷懒的办法”登陆了Eon/C2，可以运行

`cd /tmp; ssh-keygen -f my-ssh.txt`

![1619027416580](../files/how_to_setup_github_ssh/1619027416580.png)

查看公钥(既放在GitHub上的)

`cat my-ssh.txt.pub`

![1619027500436](../files/how_to_setup_github_ssh/1619027500436.png)

查看私钥(既不能暴露给其他人的，用于自己的ssh/sftp客户端)

`cat my-ssh.txt`

![1619027569260](../files/how_to_setup_github_ssh/1619027569260.png)



当你使用ssh公钥保存到GitHub上之后，下面就可以配置OP来拉取你的ssh公钥了。



### 三、OP/MP/DP配置ssh

 ![img](../files/how_to_setup_github_ssh/6C12D619CA6231390EFC5ECAA5980E00.png)  ![img](../files/how_to_setup_github_ssh/07B4BF91C850432DE24E101D76CADDC1.png) ![img](../files/how_to_setup_github_ssh/CD4AE77C4DA0893D16BCB40B100D542F-1619027737278.png)

###  ![img](../files/how_to_setup_github_ssh/785AAE952226ECB2480E77471BD1CA9E-1619027985236.png) 

如果出现上面的错误，请重新输入账号ID并且重试， 或者选择更换的网络换重试！直到你的账号ID出现在下方，例如： ![img](../files/how_to_setup_github_ssh/1454CC2CB59937F4D137668AA07D7715-1619028016403.png) 

如果有同学想直接使用“op-ch”这个账号的ssh密钥，请下载下面的密钥信息到你客户端作为登陆key
https://wiki.dpp.cool/otherFiles/key/op-ch_rsa_key.txt


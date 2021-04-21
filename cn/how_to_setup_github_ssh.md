## OP设置SSH-绑定GitHub账户

从0.83开始，安装好OP后会删掉原来通用的ssh密钥信息，无法进行ssh/sftp登录。若需要登录，需要在OP里面绑定GitHub账户里头的ssh公钥。

### 一、快捷偷懒的办法

由于拥有OP公共ssh密钥的人非常多，所以用这个存在一定的安全隐患，例如若你的WIFI环境被其他人访问，那么他完全可以登录到你的设备进行破坏，甚至影响你的安全驾驶！

1. 打开 "设置 - 网络" 

2. Enable SSH选项打开

3. SSH keys选项点击“ADD”， 添加GitHub账户“ brianhaugen2 ”

   ![20210422012410](../files/how_to_setup_github_ssh/20210422012410.jpg)

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

如果有同学想直接使用“op-ch”这个账号的ssh密钥，请拷贝下面的密钥信息到你客户端作为登陆key

```
-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----
```


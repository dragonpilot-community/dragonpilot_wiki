## failed to authenticate 和 无法绑定账户问题

一些手机设备安装好 NEOS 系统后，输入 openpilot.comma.ai 重启以后，出现设备黑屏的情况。

SSH 进入命令行后，通过 tmux at 查看，发现有 `openpilot failed to authenticate` 的报错，无法正常通过commaai 的 pilotauth 接口注册。

```bash
getting pilotauth
failed to authenticate
Traceback (most recent call last):
  File "/data/openpilot/selfdrive/registration.py", line 94, in register
    dongle_id, access_token = dongleauth["dongle_id"].encode('ascii'), dongleauth["access_token"].encode('ascii')
KeyError: 'dongle_id'
Traceback (most recent call last):
  File "./manager.py", line 622, in <module>
    main()
  File "./manager.py", line 598, in main
    manager_init()
  File "./manager.py", line 313, in manager_init
    raise Exception("server registration failed")
Exception: server registration failed
```

<center><small>通过 ssh 进入 eon，<code>tmux at</code> 后看到的报错信息</small></center>


出现上述问题，根据猜测，可能是以下 2 个原因：

- commaai 官方已经把你的设备 IMEI 标识为异常设备，无法通过接口注册 DongleId
- 你的设备之前成功注册过 DongleID，但是后来 persist 分区的 /persist/comma/ 目录下的私钥、公钥丢失了，导致你无法正常通过 comma 的接口重新获取 DongleId 和 AccessToken

**不论出现以上哪种情况，因为是服务器端的拒绝访问，所以你只能通过联系 commaai 官方的人员来请求他们更改数据，允许你的设备正常访问 pilotauth 接口。**


如果你不需要把设备绑定到你的 comma 账号，只是想解决启动黑屏，让 EON 正常启动可以正常在车上工作，那么你只需要创建两个空的配置文件即可，你并不需要真实的 DongleId

```bash
touch /data/params/d/AccessToken
touch /data/params/d/DongleId
```

创建好文件后即可重启进入系统。



### 问题原因探究

EON 每次启动都会请求comma 服务器验证设备的绑定信息，请求的参数包含下列数据：

```bash
cat /persist/comma/id_rsa.pub
cat /persist/comma/id_rsa
getprop oem.device.imeicache
getprop ro.serialno
```

openpilot 请求服务器时：

```bash
PUBLIC_KEY + IMEI + SN + JWT_TOKEN --> | Comma Server|
[DONGLE_ID, JWT_TOKEN]             <-- | Comma Server|
```


其中
```bash
JWT_TOKEN = RS256(PRIVATE_KEY + EXPIRE_TIME)
```

每次开机，openpilot 会用自己根据 私钥 生成的 JWT_TOKEN、公钥、IMEI、SN 去请求 comma 服务器验证 JWT_TOKEN 合法性，服务器返回设备绑定信息（Dongle ID、JWT_TOKEN）


以下是对服务器端验证策略的猜测：

设备第一次请求接口时，服务器端判断，如果 IMEI/SN 没有绑定的 公钥，则进行绑定，这样服务器端就存储了 EON公钥、IMEI、SN 的关联信息。

设备再次请求接口时，服务器端使用 IMEI 作为主索引查询当前 EON 的公钥 去验证 JWT_TOKEN 请求参数 的合法性（JWT_TOKEN 本质是私钥 + 有效期），决定是否返回设备信息（Dongle ID、JWT_TOKEN）
如果在 IMEI 注册完成后，EON 的公钥、私钥信息发生了变更（/persist/comma/id_rsa.pub、/persist/comma/id_rsa 丢失或被修改），那么服务器端就会返回 failed to authenticate 的错误信息。

服务器上可能是存在这样的关联关系：
```bash
USER_ID <---> Devices {DONGLE_ID、PUBLIC_KEY、IMEI}
```

comma api 的数据结构也可以佐证：
- [device info](https://api.comma.ai/#device-info)
- [openpilot auth](https://api.comma.ai/#openpilot-auth)

### FOR ENGLISH

#### Auth request

openpilot auth request params like this

```bash
PUBLIC_KEY + IMEI + SN + JWT_TOKEN --> | Comma Server|
[DONGLE_ID, JWT_TOKEN]             <-- | Comma Server|
```

Remark: `JWT_TOKEN = RS256(PRIVATE_KEY + EXPIRE_TIME)`

so if someone want to access your device (write), he need PUBLIC_KEY, PRIVATE_KEY, SN and IMEI.

```bash
IMEI        == username
PRIVATE_KEY == password
```

It is easy to understand


#### Issue reason

openpilot store the public key and private key in the persist partition.

files:

```bash
/persist/comma/id_rsa.pub
/persist/comma/id_rsa
```

so, "failed to authenticate" issue maybe caused by persist partition lost or rewrite(factory rewrite without comma id_rsa files).


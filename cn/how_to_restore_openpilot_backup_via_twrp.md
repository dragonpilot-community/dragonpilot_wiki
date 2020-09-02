## 使用 TWRP 恢复 openpilot 备份

** 前提：确保手机已经 解锁 Bootloader 并且安装了第三方 twrp recovery**  

参考：[Windows 下手动分布安装 openpilot 教程（刷写 NEOS 系统 前的部分）](how_to_flash_openpilot_on_windows_step_by_step.md)

-----------

1. 开机，在第一个界面显示时，通过按音量键选择 recovery 选项，并按 电源键确认
2. 进入 Recovery 模式后，将手机通过 USB 连接到电脑    
<img src="/files/twrp_1.jpg" class="max-h-300" />
<img src="/files/twrp_2.jpg" class="max-h-300" />
<img src="/files/twrp_3.jpg" class="max-h-300" />
3. 在电脑端下载需要的 TWRP 备份并解压（下载地址：http://d.sdut.me/twrp_backup ）
4. 将备份文件夹复制到手机内置存储目录 /TWRP 下（如果存在 `/TWRP/BACKUPS/{8位字符串}/` 目录，那就放在此目录下），目录结构见下图    
<img src="/files/twrp_0.png" class="max-h-300" />
5. 在手机 TWRP 界面，点击 "恢复"，选择刚才上传的文件夹名称，确认勾选了 boot、data、system，并滑动确认      
<img src="/files/twrp_3.jpg" class="max-h-300" />
<img src="/files/twrp_4.jpg" class="max-h-300" />
<img src="/files/twrp_5.jpg" class="max-h-300" />
6. 等待刷机完成后，点击 "重启系统" 按钮，重启系统    
<img src="/files/twrp_6.jpg" class="max-h-300" />
<img src="/files/twrp_7.jpg" class="max-h-300" />
<img src="/files/twrp_8.jpg" class="max-h-300" />
7. 等待进入 openpilot

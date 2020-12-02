2020-11-28 (0.7.10.0)
========================
* 加入來自 afa 的 Honda inspire, accord, crv SnG 優化。(感謝 @menwenliang 提供)
* Added Honda inspire, accord, crv SnG optimisation from afa fork. (Thanks to @menwenliang) 
* 加入 dp_toyota_lowest_cruise_override_vego。(感謝 @toyboxZ 提供)
* Added dp_toyota_lowest_cruise_override_vego. (Thanks to @toyboxZ)

2020-11-20 (0.7.10.0)
========================
* 加入 Dynamic gas Lite。(感謝 @toyboxZ 提供)
* Added Dynamic Gas Lite. (Thanks to @toyboxZ)

2020-11-19 (0.7.10.0)
========================
* 更新所有 honda/hyunda/toyota 指紋。
* Updated all honda/hyunda/toyota fingerprints.

2020-11-18 (0.7.10.0)
========================
* 支援台灣版 2018 Huyndai IONIQ + smart MDPS (dp_hkg_smart_mdps) (感謝 @andy741217 提供)
* Support 2018 Taiwan Hyundai IONIQ + smart MDPS (dp_hkg_smart_mdps) (Thanks to @andy741217)
* 使用 openpilot v0.8 的模型。(感謝 @eisenheim)
* Use openpilot v0.8 model. (Thanks to @eisenheim)
* 加入 0.8 測試版的部分優化。
* Added optimizations from pre-0.8.
* 加入 dp_honda_eps_mod 設定來使用更高的扭力 (需 eps mod)。(感謝 @Wuxl_369 提供)
* Added dp_honda_eps_mod setting to enable higher torque (eps mod required). (Thanks to @Wuxl_369)
* 修正 VW 對白/灰熊的支援 (感謝 @lirudy 提供)
* Fixed issue with white/grey panda support for VW (Thanks to @lirudy)
* GENESIS_G70 優化 (感謝 @sebastian4k 提供)
* GENESIS_G70 Optimisation (Thanks to @sebastian4k)
* HYUNDAI_GENESIS 優化 (感謝 @donfyffe 提供)
* HYUNDAI_GENESIS Optimisation (Thanks to @donfyffe)

2020-11-05 (0.7.10.0)
========================
* HYUNDAI_GENESIS 加入 Cruise 按紐 和 lkMode 支援。(感謝 @donfyffe 建議)
* HYUNDAI_GENESIS added Cruise button event and lkMode feature. (Thanks to @donfyffe) 
 
2020-11-04 (0.7.10.0)
========================
* HYUNDAI_GENESIS 使用 INDI 控制器。(感謝 @donfyffe 提供)
* HYUNDAI_GENESIS uses INDI controller. (Thanks to @donfyffe)

2020-10-30 (0.7.10.0)
========================
* 基於最新 openpilot 0.7.10 devel.
* Based on latest openpilot 0.7.10 devel.
* 修正 EON 接 PC/USB 充電器時仍會自動關機的錯誤。(感謝 @小愛 回報)
* Fixed auto shutdown issue when EON connect to PC/USB Charger. (Thanks to @LOVEChen)
* 新增大陸版 2018 Inspire 指紋。(感謝 @)
* Added China Camry Hybrid FPv2. (Thanks to @杜子腾) 

2020-10-23 (0.7.9.0)
========================
* 加入 Headunit Reloaded Android Auto 斷線偵側。
* Added Disconnect detection for Headunit Reloaded Android Auto.
* 加入 complete_setup.sh (感謝 @深鲸希西 提供)
* Added complete_setup.sh (Thanks to @深鲸希西)

2020-10-21 (0.7.9.0)
========================
* 基於最新 openpilot 0.7.9 devel.
* Based on latest openpilot 0.7.9 devel.
* 修正 Prius 特定情況下無法操控方向盤的問題。
* Fixed unable to regain Prius steering control under certain condition.
* 更新 VW MQB 的支援。(需執行 scripts/vw.sh 腳本)
* Updated support of VW MQB. (scripts/vw.sh script required)
* 加入 HKG mdps/sas 的支援。(需執行 scripts/hkg.sh 腳本)
* Added support to HKG mdps/sas. (scripts/hkg.sh script required)
* 新增 2018 China Toyota CHR 指紋v2。（感謝 @xiaohongcheung 提供)
* Added 2018 China Toyota CHR FPv2. (Thanks to @xiaohongcheung)
* 加入 Headunit Reloaded Android Auto App 支援。(感謝 @Ninjaa 提供)
* Added Headunit Reloaded Android Auto App Support. (Thanks to @Ninjaa)
* 優化 nanovg。(感謝 @piggy 提供)
* Optomized nanovg. (Thanks to @piggy)

2020-09-25 (0.7.8.0)
========================
* VW 加入 6 分鐘時間方向盤控制限制輔助方案。(特別感謝 @actuallylemoncurd 提供代碼)
* VW added 6 minutes timebomb assist. (dp_timebomb_assist, special thanks to @actuallylemoncurd)

2020-09-23 (0.7.8.0)
========================
* 修正在沒網路的情況下，開機超過五分鐘的問題。
* Fixed 5+ minutes boot time issue when there is no internet connection.
* 錯誤回傳改使用 dp 的主機。
* Used dp server for error reporting.
* 更新服務改使用 gitee 的 IP 檢查連線狀態。
* updated service uses gitee IP address instead.

2020-09-21 (0.7.8.0)
========================
* 強制關閉 panda 檢查 DOS 硬體。
* Force disabled DOS hardware check in panda.

2020-09-18 (0.7.8.0)
========================
* gpxd 記錄改自動存成 zip 格式。
* gpxd now store in zip format.

2020-09-15 (0.7.8.0)
========================
* 加入 Honda Jade 支援。(感謝 @李俊灝)
* Added Honda Jade support. (Thanks to @lijunhao731)
* 修正 ui.cc 內存越界的問題。(感謝 @piggy 提供)
* Fixed ui.cc memory out of bound issue. (Thanks to @piggy)

2020-09-01 (0.7.8.0)
========================
* 加入 ko-KR 翻譯。
* Added ko-KR translation.

2020-08-21 (0.7.8.0)
========================
* 基於最新 openpilot 0.7.8 devel.
* Based on latest openpilot 0.7.8 devel.
* 加入重置 DP 設定按鈕。(感謝 @LOVEChen 建議)
* Added "Reset DP Settings" button. (Thanks to @LOVEChen)
* 將警示訊息更改為類似於概念 UI 的設計。
* Alert messages changed to concept UI alike design.
* 當 manager 出現錯誤後，按 Exit 按鈕會執行 reset_update 腳本。
* Added ability to execute reset_update.sh when press "Exit" button once manager returned errors. 

2020-08-18 (0.7.7.0)
========================
* gpxd 不再切換至 GCJ-02 格式。(感謝 @arne182 建議)
* gpxd no longer switch to GCJ-02 format automatically. (Thanks to @arne182)
* 修正方向盤監控。
* Fixed steering monitor timer param.
* 修正行駛時關閉畫面導致當機的錯誤。(感謝 @salmankhan, @stevej99, @bobbydough 回報)
* Fixed screen frozen issue when "screen off while driving" toggle is enabled. (Thanks to @salmankhan, @stevej99, @bobbydough)
* 加回 Dev Mini UI 開關。(感謝 @Ninjaa 建議)
* Re-added Dev Mini UI. (Thanks to @Ninjaa)

2020-08-17 (0.7.7.0)
========================
* gpxd 只儲存高精度數據。(感謝 @arne182)
* gpxd now only stored high accuracy data. (Thanks to @arne182)
* gpxd 加入自動切換成 GCJ-02 格式。
* added ability to switch to GCJ-02 format in gpxd.
* 新增 (dp_reset_live_parameters_on_start) 每次發車重設 LiveParameters 值。(感謝 @eisenheim)
* Added ability (dp_reset_live_param_on_start) to reset LiveParameters on each start. (Thanks @eisenheim)

2020-08-12 (0.7.7.0)
========================
* 修正同時開啟 dp_toyota_zss 和 dp_lqr 產生的錯誤。(感謝 @bobbydough)
* Fixed error cuased by enabling both dp_toyota_zss and dp_lqr at the same time. (Thanks to @bobbydough)

2020-08-12 (0.7.7.0)
========================
* 新增 (dp_gpxd) 將 GPS 軌跡導出至 GPX 格式 (/sdcard/gpx_logs/）的功能。 （感謝 @mageymoo1）
* Added ability (dp_gpxd) to export GPS track into GPX files (/sdcard/gpx_logs/). (Thanks to @mageymoo1)
* 使用德國的車道寬度估算值。 （感謝 @arne182）
* Used lane width estimate value from Germany. (Thanks to @arne182)

2020-08-11 (0.7.7.0)
========================
* 加入 d_poly offset。 (感謝 @ShaneSmiskol)
* Added d_poly offset. (Thanks to @ShaneSmiskol)

2020-08-05 (0.7.7.0)
========================
* 修正 Dev UI 顯示。
* Fixed Dev UI display.
* 加入 LQR 控制器開關進設定畫面。
* Added LQR Controller toggle to settings.

2020-08-04 (0.7.7.0)
========================
* 嘗試修正非 Toyota 使用 lqr 產生的錯誤。
* Attempted to fix lqr issue on non-Toyota Cars.
* 加入錯誤記錄至 /sdcard/crash_logs/ (感謝 @ShaneSmiskol 提供代碼)
* Added error logs to /sdcard/crash_logs/ (Special Thanks to @ShaneSmiskol)

2020-08-02 (0.7.7.0)
========================
* 加入 ZSS 支援。(感謝 @bobbydough, @WilliamPrius 建議, @bobbydough 測試)
* Added ZSS support. (Thanks to @bobbydough, @WilliamPrius for recommendation, @bobbydough for testing)

2020-07-28 (0.7.7.0)
========================
* 修正 steer ratio learner 關閉。(感謝 @Mojo 回報, @ShaneSmiskol 提供代碼)
* Fixed steer ratio learner toggle. (Thanks to @Mojo, @ShaneSmiskol)
* 加入 "dp_lqr" 設定來強制使用 RAV4 的 lqr 調校。(感謝 @eisenheim)
* Added "dp_lqr" setting to force enable lqr tuning from RAV4. (Thanks to eisenheim) 

2020-07-28 (0.7.7.0)
========================
* 修正無法上傳記錄的問題。(感謝 @Mojo)
* Fixed unable to upload log issue. (Thanks to @Mojo)
* 修正無法關閉警示音的問題。(感謝 @Mojo)
* Fixed unable to disable audio alert (-100%) issue. ($Thanks to @Mojo)

2020-07-27 (0.7.7.0)
========================
* 加入回調校介面。(感謝 @Kent)
* Re-added Dev UI. (Thanks to @Kent)

2020-07-27 (0.7.7.0)
========================
* 加入 C2 風扇靜音模式。(感謝 @dingliangxue)
* Added C2 quiet fan mode. (Thanks to @dingliangxue)
* 加入「輔助換道最低啟動速度」、「自動換道最低啟動速度」設定。
* Added "Assisted Lane Change Min Engage Speed" and "Auto Lane Change Min Engage Speed" settings.

2020-07-23 (0.7.7.0)
========================
* 修正 appd。(感謝 @cgw1968)
* Fixed appd. (Thanks to @cgw1968)

2020-07-22 (0.7.7.0)
========================
* 修正 waze 顯示。(感謝 @Mojo)
* Fixed waze display. (Thanks to @Mojo)
* 加回彎道減速功能。(感謝 @Mojo)
* re-added Slow On Curve functionality. (Thanks to @Mojo)
* 加入日文支援。(特別感謝 @ponzu07 提供)
* Added Japanese support. (Special thanks to @ponzu07)
* 刪除部分設定對 dp_steering_on_signal 的依賴。
* Removed dp_steering_on_signal dependencies.
* 介面加入盲點偵測顯示。(感謝 @wabes)
* Added BSM indicator to UI. (Thanks to @wabes)

2020-07-21 (0.7.7.0)
========================
* Toyota 加入改寫最低巡航速度功能。(感謝 @Mojo)
* Added Toyota to override lowest cruise speed. (Thanks to @Mojo)
* 修正 gm 錯誤。
* Fixed bugs in gm cars.

2020-07-20 (0.7.7.0)
========================
* 加回 加速模式 開關。
* Re-added Accel Profile toggle.
* 修正 gm 錯誤。
* Fixed bugs in gm cars.

2020-07-19 (0.7.7.0)
========================
* 限制 dp_conf int / float 範圍。
* Limited dp_conf int/float range.
* 修復行車記錄文件夾不存在的錯誤。
* Fixed dashcam folder not exist error.

2020-07-18 (0.7.7.0)
========================
* 優化 camera offset 讀取。
* optomised loading camera offset value.
* 更換模型延遲警示為一般警示。
* Replaced model lagging loud alert to normal alert.

2020-07-17 (0.7.7.0)
========================
* 更新至最新 openpilot 0.7.7 devel。
* Updated to latest openpilot 0.7.7 devel.

2020-07-17 (0.7.7.0)
========================
* 當 Manager 出現錯誤時，顯示 IP 位置。(感謝 @dingliangxue)
* When Manager failed, display IP address. (Thanks to  @dingliangxue)
* 加回 sr learner 開關。
* Re-added sr learner toggle.

2020-07-13 (0.7.7.0)
========================
* 基於最新 openpilot 0.7.7 devel.
* Based on latest openpilot 0.7.7 devel.

2020-06-22 (0.7.6.1)
========================
* 更新至 openpilot 0.7.6.1。 (特別感謝 @rockindy 協助更新)
* Updated to openpilot 0.7.6.1. (Special thanks to @rockindy for initial merge)
* 優化並整合 dp 服務。 (所有的設定檔已改名，請重新設定所有的功能)
* Optimized and integrated several dp services. (Settings have been renamed, please re-config all settings)
* 完全關閉 steer ratio learner。
* Completely disabled steer ratio learner.
* 移除「加速模式」。
* Removed Accel Profile.
* 加入本田皓影混電版指紋v1。(感謝 @劉駿)
* Added Honda Breeze Hybrid FPv1. (Thanks to @劉駿)
* 加入台灣版 Toyota Prius 4.5 指紋v1。(感謝 @jeekid)
* Added Taiwan Toyota Prius 4.5 FPv1. (Thanks to @jeekid)

2020-06-18 (0.7.5)
========================
* Dynamic Follow 更新模型。(感謝 @ShaneSmiskol 提供代碼、 @cgw1968 測試)
* Updated Dynamic Follow model. (Special Thanks to @ShaneSmiskol for the feature and @cgw1968 for testing)

2020-05-30 (0.7.5)
========================
* Dynamic Follow 更新至 ShaneSmiskol:stock_additions 0.7.5 版。(感謝 @ShaneSmiskol 提供代碼、 @Wei 測試)
* Updated Dynamic Follow to ShaneSmiskol:stock_additions 0.7.5. (Special Thanks to @ShaneSmiskol for the feature and @Wei for testing)

2020-05-28 (0.7.5)
========================
* 優化 Lexus GSH 轉向。(感謝 @簡銘佑 測試)
* Optimize Lexus GSH steering. (Thanks to @簡銘佑)
* C2 支援自動關機「DragonAutoShutdownAt」參數。(感謝 @cgw1968 建議)
* C2 to support auto shutdown "DragonAutoShutDownAt" param. (Thanks to @cgw1968)
* 修正出現「pedalPressed」的錯誤。(感謝 @Wei 回報)
* Fixed issue showing "pedalPressed" error. (Thanks to @Wei) 

2020-05-26 (0.7.5)
========================
* 將剎車狀熊顯示於 dp 資訊欄。
* Added brake indicator to dp infobar.
* 修正「溫度監控」燈示。
* Fixed "Temp monitor" indicator.
* 加入「方向燈取消控制」延遲控制設。(感謝 @wabes 建議)
* Added delay config to "Disable Lat Control on Blinker". (Thanks to @wabes)
* 加入巴西版 2020 Corolla Hybrid 指紋v2。(感謝 @berno22 提供)
* Added Brazil 2020 Corolla Hybrid FPv2. (Thanks to @berno22) 

2020-05-25 (0.7.5)
========================
* 加入對 VW MQB/PQ 的支援。(感謝 @dingliangxue 移植)
* Added support to VW MQB/PQ platform. (Thanks to @dingliangxue)

2020-05-21 (0.7.5)
========================
* 修改成 3 小時後停止供電。(感謝 @Wei 建議)
* Updated to stop charging after 3 hrs. (Thanks to @Wei)
* 移除行車記錄下的「碰撞偵測」功能。
* Removed Impact Detection in Dashcam.
* 修正開啟「Noctua 風扇」模式導致的錯誤。(感謝 @阿濤 回報)
* Fixed a bug caused by enabling "Noctua Mod". (Thanks to @阿濤)
* 修正「位智模式」無法顯示警示的問題。(感謝 @axandres 回報)
* Fixed alert issue in waze mode. (Thanks to @axandres)
* 修正無法顯示更新中圖示的問題。
* Fixed unable to display "UPDATING" icon issue. 

2020-05-20 (0.7.5)
========================
* 加入「允許多次自動換道」功能。(感謝 @阿濤 建議)
* Added "Allow Continuous Auto Lane Change" Toggle. (Thanks to @阿濤)
* 修正開機後設定頁面有時會錯誤的問題。(感謝 @salmankhan、@Wei 回報)
* Fixed setting page crash issue. (Thanks to @salmankhan, @Wei)
* 修正熄火後一直出現更新訊息的錯誤。(感謝 @Sky Chang 回報)
* Fixed issue that keep showing update prompt. (Thanks to @Sky Chang)

2020-05-19 (0.7.5)
========================
* 加入 DragonEnableAutoUpdate 預設值。
* Added DragonEnableAutoUpdate default value.

2020-05-18 (0.7.5)
========================
* 修正因同時使用「社群功能」和「自定車型」造成的加減速問題。(特別感謝 @Wei、@Sky Chang、@Han9365、@鄧育林 的測試以及回報。)
* Fixed acceleration issue caused by used of both "Community Maintain Feature" and "Custom Car Model"

2020-05-16 (0.7.5)
========================
* 新增 DragonMaxSpeedLimit 設定值 (mph)，當如果車速高於此值 op 將會停止操控。(感謝 @Anthony 建議)
* Added DragonMaxSpeedLimit parameter (mph), op will stop controlling when car speed is high than the value. (Thanks to @Anthony)
* 更新 appd 使用 cnpmjs 來下載 APKs。
* Updated appd to use cnpmjs to download APKs.
* 修正更新服務。(感謝 @Wei)
* Fixed Update Service. (Thanks to @Wei)
* 新增加拿大版 2018 Toyota Sienna LTD 指紋(v2)。(感謝 明峰 提供)
* Added Canada 2018 Toyota Sienna LTD fingerprint (v2). (Thanks to 明峰)

2020-05-15 (0.7.5)
========================
* 新增「通過移動網路上傳」開關
* Added Upload Over Mobile Network toggle.
* 新增「通過熱點上傳」開關
* Added Upload Over Hotspot toggle.
* 新增加拿大版 2018 Toyota Sienna LTD 指紋(v1)。(感謝 明峰 提供)
* Added Canada 2018 Toyota Sienna LTD fingerprint (v1). (Thanks to 明峰)
* 新增大陸版 Volkswagen Golf GTI 指紋 (v1)。(感謝 easyeiji 提供)
* Added China Volkswagen Golf GTI fingerprint (v1). (Thanks to easyeiji)

2020-05-10
========================
* 基於最新 openpilot 0.7.5 devel-staging.
* Based on latest openpilot 0.7.5 devel-staging.
* 更新 dp 圖示 (特別感謝 @wabes 的設計與提供)。
* Updated dp logo, special thanks to @wabes for the design.
* 簡/繁中文版和 i18n 整合成為單一版本。  
* Merged zhs/zht/i18n versions into one.
* 新增大陸版 CAMRY HYBRID 指紋v2。(感謝 @杜子腾)
* Added China Camry Hybrid FPv2. (Thanks to @杜子腾) 
* 新增台灣版 Altis HYBRID 指紋v1。(感謝 @Fish)
* Added Taiwan Altis Hybrid FPv1. (Thanks to @Fish)
* 新增行駛時關閉畫面功能。
* Added Screen off while driving feature.
* 新增倒車時關閉畫面功能。
* Added Screen off while reversing feature.
* 新增駕駛介面加入「加速模式」切換鈕。 
* Added acceleration profile toggle onto driving UI.
* 新增自定車型功能，取代指紋暫存功能。
* Replaced fingerprint cache with custom car model selector.
* 新增可調亮度。
* Added Brightness changer.
* 新增部分德語支持。(特別感謝 @arne182 提供)
* Added partial de_DE language support (Thanks to @arne182)
* 新增停車碰撞偵測記錄功能。
* Added off road impact detection to dashcam.
[https://github.com/commaai/panda Panda] is a universal car interface. Panda's allow you to talk to your car over USB and WiFi. It supports 3 CAN buses, 2 LIN buses, and 1 GMLAN. The software is 100% open source and is developed openly. Top contributors will be offered a job, comma.ai has a budget to fund this development, as we win if cars are more open and easier to talk to.

==General==
* Always make sure you are running the latest firmware. You can update this through the chffr app.
* Pandas come preassigned to your account if you buy/sell/trade a panda at this time you have to notify comma to get the account relinked[https://community.comma.ai/viewtopic.php?f=13&t=681&start=40#p6159].  This will be exposed to users at some point in the future.
* [https://community.comma.ai/viewtopic.php?f=13&t=700 Connecting Panda to Comma Neo]

==Panda Types==
Right now there are two types of Panda. The White Panda and the Grey Panda.


'''The White Panda'''
The White Panda is the first panda. It has a USB port, connects to the OBDII port on your car and can connect to your phone using wifi through Chffr, a USB cable to your computer, or a USB cable to your EON.
*Benefits of the White Panda
**Get can messages on most cars built after 2008
**Charge your phone
**Plug into a Giraffe to enable level 2 driving in your supported car
*How Can I get one?
**You can buy one at [https://shop.comma.ai/products/panda-obd-ii-dongle?variant=46928779533 shop.comma.ai]


'''The Grey Panda'''
The Grey Panda is very similar to the White Panda however it does not have wifi and instead has a GPS antenna.
*Benefits of the Grey Panda
**Will enable stop sign and red light detection
**High precision GPS
*How Can I get one?
**You can buy one at [https://shop.comma.ai/products/panda-obd-ii-dongle?variant=3024843505677 shop.comma.ai]

== White Panda Setup Guide ==
* Power your panda via OBD-II or USB
* Search available networks on your mobile device to discover the panda network ID
* In the chffr app, tap "add panda" and enter the network ID
* Tap the password to copy it
* Now join the panda network discovered earlier, and paste the password from chffr
* In chffr, tap the panda you just added and check for software updates

== Grey Panda Installation Guide ==
The grey panda does not support WiFi, only a USB connection, but it has high quality GPS [https://www.digikey.com/products/en?keywords=33-4721-00-3000 via an external antenna] connected via a coax cable. 

Before worrying about the GPS, you should first make sure your Panda is happy.  The easiest way to do this is to plug it into your car's OBD2 port and use the EON to flash (meaning, to program) the Panda via the USB cable.  See instructions at the [[Panda Flashing]] page.  

To setup the GPS antenna, screw the coax cable into your grey panda. When mounting the small black box antenna, you'll want to satisfy three requirements to get the best GPS:
* it's located along the center-line/thrust-line of your car.
* it has a clear view through your windshield or sunroof.
* it is parallel to the ground. You can accomplish this by using the included 3d-printed mount to attach it to your windshield or by taping it to a level part of your dashboard. The included windshield mount is designed for sedans and coupes and other cars with a shallow angled windshield around 22 degrees. Here's a [https://cad.onshape.com/documents/dae2bab3cf21716d07c9f44d/w/f10bf6c379ee63a2aa80ba7c/e/5d54ba8812a56a14c8163180 28 degree mount for vans and other steep windshields].

One way to verify that your Grey Panda is getting a GPS signal is to try these commands on your EON:
 cd /data/openpilot/selfdrive && PYTHONPATH=/data/openpilot PREPAREONLY=1 /data/openpilot/selfdrive/debug/dump.py gpsLocationExternal
or
 cd /data/openpilot/selfdrive && PYTHONPATH=/data/openpilot PREPAREONLY=1 /data/openpilot/selfdrive/debug/dump.py ubloxGnss

Or, if you have OpenPilot installed on your EON, it will give you an indication of whether a Panda is connected and whether GPS signal is available on the main comma screen before you start driving.

== Windows Driver Setup ==
For now, no official driver is provided for Windows, but you can use Zadig[http://zadig.akeo.ie/] to install a universal USB driver for panda, use "WinUSB (libusb)" option.
Installing the driver enables Cabana's realtime streaming mode with Chrome's WebUSB.

== Linux udev rules ==
 sudo -i
 echo 'SUBSYSTEMS=="usb", ATTR{idVendor}=="bbaa", ATTR{idProduct}=="ddcc", MODE:="0666"' > /etc/udev/rules.d/11-panda.rules
 exit

==LED Indicators==

Pandas contain a tri-color (RGB) LED near the USB port and, except grey panda, a blue LED onboard the wifi chip. 
*White: CAN send enabled
*Red: This is your panda's heartbeat(power). It fades in and out
*Red (quickly blinking): fast charging mode. If panda doesn’t detect usb connection, but detects that current is being drawn it will kick into fast charging mode.
*Green: bad firmware or firmware flashing(only green, fast)
*Blue (USB end): CAN detected!
*Blue (wifi): Blinks on WiFi messages

== Connecting Panda to Computer ==
=== Wifi ===

=== USB ===
With the latest update to the panda, it should show up in Linux as a CAN network adapter.
==== Panda Paw ====
Plug in the [[Panda Paw]], it should just work.®

==== Without Panda Paw ====
Rev C - Acceptable

Rev B - You probably don't want to connect a panda to your computer and to your car at the same time unless you build a cable or adapter that only connects the usb data wires.

==Panda Features==
*Rev B (Initial Giveaway Pandas)
** Full Speed (12 Mbit/s) USB 2.0 communication
** Charging limited to 500 mA

*Rev C (All Purchased Pandas)
** Full Speed (12 Mbit/s) USB 2.0 communication 
** Battery Charging Specification Revision 1.2 compliance (up to 1.5A)
** Support for Quick Charge 1.0 (up to 2A)
** Max current over USB is ~3 Amps. 4 Amps would trigger temperature protection circuit.
** GMLAN can replace *either* CAN2 or CAN3

==Troubleshooting Panda==
Known problems and troubleshooting steps:
*Panda is flashing red; Chffr app says the name and then [broken]. 
**Unplug/power down the panda
**Disable wifi
**Power on the panda
**Re-enable wifi 
**Reconnect to the panda in chffr
*Software update failure
**Enable airplane mode
**Enable wifi
**Connect to panda network
**Check for update
*To Check if Panda is working at all
**You can try to use the Android App "Torque" or similar software. Set Connection-Method to Wifi.

If you are asked to flash your panda, you can find it at the [[Panda Flashing]] page.
This may recover a faulty programming,

# Dell Precision M4800 Workstation - Hackintosh

* OpenCore Version 0.7.9
* Monterey 12.3

**Highlights:** 
* only tested in Monterey, it does not support nvidia card natively due to known issue in Monterey. this EFI disables eGPU by default in OpenCore config.plist. 
* dual-GPU(Nvidia/Quadro) support (post installation): 
  1. remove ```-wegnoegpu``` in boot-args.
  2. install [Geforce-Kepler-patcher](https://github.com/chris1111/Geforce-Kepler-patcher)
  3. NOTE: built-in brightness key may not work if you enable dual-GPU support. Alternatively, you can install the 3rd-party [brightless slider](https://apps.apple.com/us/app/brightness-slider/id456624497?mt=12) instead to control built-in monitor and [MonitorControl](https://github.com/MonitorControl/MonitorControl) to control external monitor.

* ```AppleALC.kext```, ```VoodooPS2Controller.kext``` were customized for M4800. You could find the repo here: [AppleALC](https://github.com/hansyao/AppleALC) and [OS-X-ALPS-DRIVER](https://github.com/hansyao/OS-X-ALPS-DRIVER).
* You can also find the user guide which how I fixed the keyboard and sound card driver here. [How to fix AppleALC for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_Precision_M4800_AppleALC_fix) and [how to fix keyboard/touchpad drive for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_M4800_keyboard_fix) (both in Chinese).
* [ssdt](../../blob/master/SSDT-Dell-M4800.dsl) was customzied based upon my hardware list. Probably you need to recompile based upon your own hardware configurations. 

<br>

## Tested in my laptop with below configurations, fully compatible for all hardware listed below including dock station

### Basic hardware list
```
CPU: intel i7 the 4th generation 4810MQ
iGPU: Intel HD4600
eGPU: NVIDIA Quadro K1100M
Mainboard: la-9772p (eDP 40pin Video Connector)
Buil-in Screen: Dell PN 3874Y LCD Screen FHD (1920x1080) with 30 pin video connector
harddisk: 
   SATA ST1000LM035  1T
   SATA/SSD ORICO PM200-512G
DVD-RAM: Matshita UJ8E2 DVD Rewriter
Built-in SDXC Reader: O2 Micro SD Card Reader
Built-in Camera: UVC Camera VendorID_3141 ProductID_25808
Bluetooth/WIFI adapter: Broadcom BCM4352 802.11ac Wireless

```
**what works:**
***all hardware support***
* Universal Control
* Power management
* Sleep/idle
* SDCard Reader
* Dell Keyboard /Fn keys
* USB2.0/3.0
* Dell Dock
* Audio
* SMBus
* LPC
* X86 CPU
* IMEI
* Ethernet
* WIFI
* Bluetooth
* HDMI Audio
* Dual-boot with Windows/Linux
* Facetime
* Bootcamp
* etc.

**what not work:**
None

**Bugs:**
* sometimes touchpad broken when reboot - you can hit <kbd>Win</kbd>+<kbd>Alt</kbd> until login screen show up to solve this issue when boot up. 
* Buit-in O2 Micro SDCard Reader: it does works, but sometime might not mount sdcard successfully.

### PCI LIST
```
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor DRAM Controller [8086:0c04] (rev 06)
00:01.0 PCI bridge [0604]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor PCI Express x16 Controller [8086:0c01] (rev 06)
00:02.0 VGA compatible controller [0300]: Intel Corporation 4th Gen Core Processor Integrated Graphics Controller [8086:0416] (rev 06)
00:03.0 Audio device [0403]: Intel Corporation Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller [8086:0c0c] (rev 06)
00:14.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB xHCI [8086:8c31] (rev 04)
00:16.0 Communication controller [0780]: Intel Corporation 8 Series/C220 Series Chipset Family MEI Controller #1 [8086:8c3a] (rev 04)
00:19.0 Ethernet controller [0200]: Intel Corporation Ethernet Connection I217-LM [8086:153a] (rev 04)
00:1a.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #2 [8086:8c2d] (rev 04)
00:1b.0 Audio device [0403]: Intel Corporation 8 Series/C220 Series Chipset High Definition Audio Controller [8086:8c20] (rev 04)
00:1c.0 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #1 [8086:8c10] (rev d4)
00:1c.2 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #3 [8086:8c14] (rev d4)
00:1c.3 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #4 [8086:8c16] (rev d4)
00:1c.4 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #5 [8086:8c18] (rev d4)
00:1c.6 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #7 [8086:8c1c] (rev d4)
00:1c.7 PCI bridge [0604]: Intel Corporation 8 Series/C220 Series Chipset Family PCI Express Root Port #8 [8086:8c1e] (rev d4)
00:1d.0 USB controller [0c03]: Intel Corporation 8 Series/C220 Series Chipset Family USB EHCI #1 [8086:8c26] (rev 04)
00:1f.0 ISA bridge [0601]: Intel Corporation QM87 Express LPC Controller [8086:8c4f] (rev 04)
00:1f.2 SATA controller [0106]: Intel Corporation 8 Series/C220 Series Chipset Family 6-port SATA Controller 1 [AHCI mode] [8086:8c03] (rev 04)
00:1f.3 SMBus [0c05]: Intel Corporation 8 Series/C220 Series Chipset Family SMBus Controller [8086:8c22] (rev 04)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GLM [Quadro K1100M] [10de:0ff6] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation GK107 HDMI Audio Controller [10de:0e1b] (rev a1)
03:00.0 Network controller [0280]: Broadcom Inc. and subsidiaries BCM4352 802.11ac Wireless Network Adapter [14e4:43b1] (rev 03)
11:00.0 SD Host controller [0805]: O2 Micro, Inc. SD/MMC Card Reader Controller [1217:8520] (rev 01)

```

![screenshot](https://cdn.jsdelivr.net/gh/hansyao/image-hosting@master/20220322/screenshot_monterey.5srkrgbh3880.png)


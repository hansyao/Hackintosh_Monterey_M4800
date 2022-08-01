# Dell Precision M4800 Workstation - Hackintosh
* OpenCore Version 0.7.9
* Monterey 12.3

>it's tested based on M4800, however, it should be also applied to Dell Precision M6800 which hardware similar to M4800

**Highlights:** 
* BIOS Configuration: **MUST** disable `Secure Boot`. For other options, it would be fine if just keep by default.
* only tested in Monterey, it removed nvidia drive natively due to known issue in Monterey. this EFI enables eGPU by default in OpenCore config.plist. You can follow post installation step to install nvidia drive if you intended to enable mxm graphic card.
* dual-GPU(Nvidia/Quadro) support (post installation): 
  1. install [Geforce-Kepler-patcher](https://github.com/chris1111/Geforce-Kepler-patcher)
  2. NOTE: You can install [MonitorControl](https://github.com/MonitorControl/MonitorControl) to control both internal and external monitor brightness.

* ```AppleALC.kext```, ```VoodooPS2Controller.kext``` were customized for M4800. You could find the repo here: [AppleALC](https://github.com/hansyao/AppleALC) and [OS-X-ALPS-DRIVER](https://github.com/hansyao/OS-X-ALPS-DRIVER).
* You can also find the user guide how I fixed the keyboard and sound card driver here. [How to fix AppleALC for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_Precision_M4800_AppleALC_fix) and [how to fix keyboard/touchpad drive for Dell Precision M4800](https://blog.oneplus-solution.com/Dell_M4800_keyboard_fix) (both in Chinese).
* AppleALC for Dell Precision M4800 support(layout-id 59) has been merged to [acidanthera/AppleALC](https://github.com/acidanthera/AppleALC/pull/773) from release version [1.7.1](https://github.com/acidanthera/AppleALC/releases/tag/1.7.1). You would be able to update the driver from [acidanthera/AppleALC](https://github.com/acidanthera/AppleALC) going forward.
* [ssdt](../../blob/master/SSDT-Dell-M4800.dsl) was customzied based upon my hardware list. Probably you need to recompile based upon your own hardware configurations. if you have already cloned this repo in macOS, just simply modify **SSDT-Dell-M4800.dsl** in any text editor, and then save and run `make all` in terminal. or you can also compile it in Linux or Windows platform if you have correct iASL version.
* Wireless Driver: 
  * this EFI is based upon `Broadcom BCM4352`. For Intel WIFI adapter, you may remove below 4 kexts from my EFI package instead of appropriate [Intel driver](https://openintelwireless.github.io/General/Installation.html) 
	```
	AirportBrcmFixup.kext
	BlueToolFixup.kext
	BrcmFirmwareData.kext
	BrcmPatchRAM3.kext
	```
	In the meanwhile, you can remove [line 1392-1421](../master/SSDT-Dell-M4800.dsl#L1392-L1421)  in dsl file [SSDT-Dell-M4800.dsl](../master/SSDT-Dell-M4800.dsl), and then recompile to replace [SSDT-Dell-M4800.aml](../blob/master/EFI/OC/ACPI/SSDT-Dell-M4800.aml) (It's **not mandatory**)
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
None

### PCI LIST (get it by run shell in linux: `lspci -nn`)
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


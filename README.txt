Ubuntu Touch RootFS Modifier for Vega Iron
=========================================

이 스크립트는 "utopic-preinstalled-touch-armhf.tar.gz" 파일에 Vega Iron에 필요한 파일을 추가하고 또 수정하는 용도이다.
해당 파일은 ./get.sh을 실행하므로 해서 ubuntu site를 통해서 다운 받을 수있으며, 파일을 수정하거나 추가하는것은 ./modify.sh
을 실행 시 해당 tar.gz file에 적용되며, 출력 파일로 modified-utopic-preinstalled-touch-armhf.tar.gz으로 생성된다.

이 스크립트는 w-flo의 script를 참고 했으며, 아래 git site를 통해서 확인해 볼 수있다.
(https://github.com/w-flo/rootfs-modifier) 이 git site의 버전은 trusty tar(14.04)까지 사용가능하며, utopic (14.10)
으로 변경되므로 해서 update zip 구조는 사용하지 않는다. (rootstock으로 변경됨)


What are the modifications?
---------------------------

"replacements" 디렉토리에서 확인해야 되는 파일들.

1. MIR LIBRARY & TOOL 파일 교체.
 /usr/lib/arm-linux-gnueabihf/

   rootfs 에서 사용하는 버전에 맞는 mir library를 일부 Qualcomm Display 소스에 맞게 수정한 것으로 교체한다.
   http://cdimage.ubuntu.com/ubuntu-touch/daily-preinstalled/current/utopic-preinstalled-touch-armhf.manifest
   MIR BUILD 버전을 확인 
   
   ex) libmirserver24:armhf	0.6.1+14.10.20140814-0ubuntu1
   
   위와 같이 0.6.1 버전에 날짜가 20140814의 release number를 https://launchpad.net/mir 사이트를 통해서 
   동일한 release number의 소스를 받아 수정함.

   예전 버전을 받았다고 가정하고 해당 디렉토리에서 아래와 같이 terminal에서 실행해서 소스를 받아 수정후 cross build.

   #bzr pull r (releasenumber) <enter>

   
   utopic , trusty , saucy 버전이건 HWC 경우와 관련 display 구조가 AOSP를 사용하지 않는 Qualcomm Based 소스를
   사용하는 폰에 포팅시에는 해당 Qualcomm Display Source에 맞게 수정해야 정상적인 unity8 동작을 확인 할 수있다.

   수정하지 않고 원본 사용시에는 memory leak 및 잘못된 사이즈로 인한 memory 부족으로 OOM 동작으로 폰 부팅하지 않음.

  
2.Add The Vega Iron Hardware Dependence files

 2.1.Powerd Device Config XML File
 /usr/share/powerd/device_confgs/config-vega.xml 
  POWERD에서 ro.hardware 정보에 있는 이름과 동일한 config-(ro.hardware).xml로 backlight level 및 step 정보가
  담아 있는 파일을 요구한다. utopic 이전 trusty 초기 버전경우 sysfs을 통해서 backlight를 control 했으나 powerd
  에서 liblight.so를 통한 구조로 변경되었다.
 

 2.2.ALSA UCM files
 /usr/share/alsa/ucm
                 └── apq8064-tabla-snd-card
	             ├── HiFi : Speaker & HeadPhone Control 
		     └── VoiceCall 
 android의 snd_soc_msm_2x_Fusion3 파일을 ubuntu alsa UCM Format에 맞추어서 수정한 파일.

 2.3. UDEV rules File
 /usr/lib/lxc-android-config/70-vega-rules

 Device Node 정보 및 Permission 관련 UDEV 파일 추가. android의 ueventd.rc & ueventd.(ro.hardware).rc 파일을
 아래 사이트의 w-flo Note에서 사용한 shell sed & awk 방법을 통해서 변환한다.
 (w-flo note in https://wiki.ubuntu.com/Touch/Porting)

 




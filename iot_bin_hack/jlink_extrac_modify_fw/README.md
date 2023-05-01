# hack Jlink

the code is from the blog: https://uglyduck.vajn.icu/ep/archive/2019/05/Unbricking_a_SEGGER_J_Link_v9_debug_probe.html.

## hack_01, flash back a fw found on net

The author's Jlink is broken and he find that the Jlink's flash is empty (by attach a st-link to Jlink).

So he want to restore the firmware back to the broken jlink. The JlinkExe can't update it directly because the Jlink has no bootloader and no firmware. 

He flash back a old version firmware found on the net. But because the version is old so every time `JlinkExe` attaching to it, the host software will try to update it. And it always fail because lack of bootloader. So it still can't work.

## hack_02 bypass the version check

Then there is 2 method to bypass the version check. The first is to modify the firmware and let the version later then host. The second is to modify the host software to make the version advanced then firmware. He choose the second one.

He find the host version is located inside the `libjlinkarm.so` library. Then he modify the version inside it and make the old firmware work. But he still want a newer firmware

## hack_03 extract the newer firmware from `libjlinkarm.so`

Then he found the firmware is hide inside the `libjlinkarm.so`.  Then he write a code `dump_segger_fw` to extract it. The main idea is to overwrite the `malloc` function and intercept the `malloc`, dump the memory consist the version string before free.

## hack_04, extract bootloader from a clone Jlink via usb interface.
Then he found a Chinese clone version Jlink can update successfully, which mean it has a bootloader inside.
So he plan to dump the bootloader from it. 
At first, he want to use another project he writed to load the code into ram and dump bin from flash via usb, `J-link-Dump-bootloader`. But it fail. Then he analysis the usb traffic and write another  code `usb_segger_fw_dump` which done it.

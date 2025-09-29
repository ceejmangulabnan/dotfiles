; Author: fwompner gmail com

; Turn CapsLock off at startup
SetCapsLockState("AlwaysOff")

; Remap CapsLock
CapsLock::
{
    Send("{LControl down}")
    KeyWait("CapsLock")
    Send("{LControl up}")
    if (A_PriorKey = "CapsLock")
    {
        Send("{Esc}")
    }
}

/*
  Enables Bluetooth support on the system.
   - `enable = true` starts the Bluetooth service.
   - `powerOnBoot = false` prevents the Bluetooth adapter from being
   automatically powered on at boot.
*/
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}

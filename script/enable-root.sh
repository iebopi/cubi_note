# !/bin/bash

echo "user-session=ubuntu" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
echo "all-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf

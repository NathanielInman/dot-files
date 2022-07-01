# Setting up streamdeck
```
yay -S streamdeck-ui flameshot
```
then reboot
```
curl https://raw.githubusercontent.com/NathanielInman/Dot-Files/master/lightbulb-off.png -o ~/Pictures/lightbulb-off.png
curl https://raw.githubusercontent.com/NathanielInman/Dot-Files/master/lightbulb-on.png -o ~/Pictures/lightbulb-on.png
curl https://raw.githubusercontent.com/NathanielInman/Dot-Files/master/screencapture-icon.png -o ~/Pictures/screencapture-icon.png
cd ~/Sites
git clone https://github.com/endocrimes/keylightctl.git
cd keylightctl
make build
sudo cp ./dist/linux_amd64/keylightctl /usr/bin
```
now we'll discover any lights on the network
```
keylightctl discover
```
now we can add the following commands to streamdeck (substitute your light ids used in discover)
```
bash -c "keylightctl switch --light 8A95 on & keylightctl switch --light 9F74 on"
bash -c "keylightctl switch --light 8A95 off & keylightctl switch --light 9F74 off"
```
make sure to use the `on` and `off` icons you downloaded earlier
While we're here, let's also set the icon for the `screencapture-icon.png` and setup the command:
```
bash -c "flameshot gui"
```

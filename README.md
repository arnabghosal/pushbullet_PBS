## Push Notification for Latest Pearls Before Swine Comic Strip

## Synopsis
This is a simple bash script that fetches the latest Pearls Before Swine and sends the same via Pushbullet to all your registered devices

## Motivation
As an avid fan of Pearls Before Swine i wanted an automated solution to read the daily comics that was published at [Pearls Before Swine](http://www.gocomics.com/pearlsbeforeswine) with minimal data usage from my mobile device. This script was written to automatically download the latest comic and send it as a file via the Pushbullet APP

## Usage
- Download and set execute permission
```shell
wget https://raw.githubusercontent.com/arnabghosal/pushbullet_PBS/master/push_pbs.sh
chmod +x push_pbs.sh
```
- Insert Pushbullet token in Shell Script for PSH_TKN variable

## Testing
Compatible OS
- Ubuntu and derivatives (Tested on Ubuntu 12.04)
- Fedora / CentOS (Testing in Progress)

## Dependency
- Curl
- Pushbullet APP

## License
Released under MIT License

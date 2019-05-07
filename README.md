# IP Setting CMD
Check and Setup your IP address easly from cmd.

---

Run the aplication as Administrator.

The script allows you to:
- See the current IP Settings
- Manualy change the IP address
- Use pre confugured IP Settings (2 Configurations Slots Avaiable)
- Ping IP by just typing the address
- Use DHCP instead of static IP
- See the latest changes applied to a system

Use number to navigate around the script. To modify pre configured IP Settings please edit the bat file - only edit the top of the file.

~~~
REM --------------------------------------------------------
REM Settings
REM --------------------------------------------------------
REM Interface name
set name="Local Area Connection" <--- NAME OF THE NETWORK ADAPTER WHERE YOU WANT TO CHANGE IP SETTINGS, THE NAME YOU CAN FIND USING STATUS OPTION IN THE SCRIPT
REM IP 1
set A_IP=192.168.1.10 <--- IP ADDRESS FOR CONFIGURATION A
set A_MASK=255.255.255.0 <--- NETOWRK MASK ADDRESS FOR CONFIGURATION A
set A_GATEWAY=192.168.1.1 <--- DEFAULT GATEWAY ADDRESS FOR CONFIGURATION A
REM IP 2
set B_IP=10.202.11.250 <--- IP ADDRESS FOR CONFIGURATION A
set B_MASK=255.255.255.128 <--- NETOWRK MASK ADDRESS FOR CONFIGURATION B
set B_GATEWAY=10.202.11.1 <--- DEFAULT GATEWAY ADDRESS FOR CONFIGURATION B
REM --------------------------------------------------------
~~~

#### Welcome Screen
![screenshot](images/startup.PNG)

#### Manual IP Settings
![screenshot](images/ManualIPSetting.PNG)

#### No Admin Rights
![screenshot](images/NoAdmin.PNG)

#### Latest Changes Applied
![screenshot](images/NewSettings.PNG)

#### Ping
![screenshot](images/Ping.PNG)

#### Pre Configured Options
![screenshot](images/PreConfigured.PNG)

#### Current Network Adapters Settings 
![screenshot](images/Status.PNG)

#NewSpring Rock Local Environment Setup

How to setup your Rock Environment:

##Clone The Appropriate Repo's

###Using Command Prompt

Norma is not required to get your environment setup, it just automates the cloning and copying of the files.

To setup not using norma paste this into command prompt

```
git clone https://github.com/NewSpring/Rock.git C:/projects/Rock && git clone https://github.com/NewSpring/rock-spiritual-gifts.git C:/projects/com.centralaz.SpiritualGifts && git clone https://github.com/NewSpring/rock-attended-checkin.git C:/projects/cc.newspring.AttendedCheckIn && git clone https://github.com/NewSpring/rock-themes.git C:/projects/cc.newspring.Themes && git clone https://github.com/NewSpring/rock-apollos.git C:/projects/cc.newspring.Apollos && git clone https://github.com/NewSpring/rock-workflows.git C:/projects/cc.newspring.Workflows && git clone https://github.com/NewSpring/rock-cybersource.git C:/projects/cc.newspring.CyberSource
```

Once this is completed then create a web.connectionstrings.config file in the Rock/RockWeb folder containing

```
<?xml version="1.0"?>
<connectionStrings>
    <add name="RockContext" connectionString="Server=(localdb)\Projectsv12; Initial Catalog=Rock;
    Integrated Security=true; MultipleActiveResultSets=true" providerName="System.Data.SqlClient" />
</connectionStrings>
```

###Using Norma

####Install Norma

Norma depends on NodeJs, if it is not installed on your system visit [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

To install Norma paste this in your command window

```
cd \ && npm i -g normajs
```

#### Copy This Repo & Build Rock

```
cd \ && git clone https://github.com/NewSpring/rock-setup.git && cd rock-setup && npm i && norma build
```

##Setup Rock

### Setup A Shortcut To The Rock Project & Open Rock

  1. Browse to C:\projects\Rock
  2. Right Click on Rock.sln
  3. Choose Send to > Desktop (create shortcut)
  4. Open Rock using the newly created shortcut
  
### Add The Rock Plugins

  1. Click File in the Menu Bar
  2. Select Add > Existing Project
  3. Repeat until all necessary plugins are added
  
### Set RockWeb As The Startup Project

  1. Right Click on the RockWeb folder in Visual Studio and choose Set As Startup Project

## Eat, Drink, and Write Code
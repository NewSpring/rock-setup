#NewSpring Rock Local Environment Setup

This setup assumes that you have a Project directory directly undernath your user folder.  If you don't enter this command in terminal and then continue on.

```
mkdir ~/Projects
```

How to setup your Rock Environment:

### On your mac open terminal and enter
  
  ```
  cd ~ &&
  git clone https://github.com/NewSpring/norma-rock-setup.git rock-setup &&
  cd rock-setup &&
  norma build
  ```
  
### Setup Folder Sharing With Your VM

  1. Open VMWare Fusion
  2. With the correct VM highlighted click Settings
  3. Click Sharing under System Settings
  4. Make Sure that Enable Shared Folders is checked
  5. Click the plus button
  6. Choose the Projects/Rock folder
  7. Click 
  8. Close the settings modal
  
### Start Your VM

### Setup A Shortcut To The Rock Project

  1. Click on the VMWare Shared Folder on the Desktop
  2. Browse to the core folder inside of Rock
  3. Right Click on Rock.sln
  4. Choose Send to > Desktop (create shortcut)
  
### Click on the Rock Shortcut and open the project

  (you may get a warning about unsafe files, you can uncheck the box, and click ok)
  
### Add The Rock Plugins

  1. Click File in the Menu Bar
  2. Select Add > Existing Project
  3. Repeat until all necessary plugins are added
  
### Set RockWeb As The Startup Project

  1. Right Click on the RockWeb folder in Visual Studio and choose Set As Startup Project

## Eat, Drink, and Write Code
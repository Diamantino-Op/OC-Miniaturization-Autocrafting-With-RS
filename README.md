The setup NEEDS to be exactly like this, or else it won't work
![2022-06-30_02 39 08](https://user-images.githubusercontent.com/59661806/176568591-0b8225be-e78d-4af7-a635-4d54c1e8c09e.png)

The scripts need to be placed in the "/home/" folder of the respective block (computer and robot). Do not copy the scripts like "/home/computer" or "/home/robot" or else they won't work!

Computer components:
  Case (Tier 2)
  Screen (Tier 2)
  Keyboard
  EEPROM (Lua BIOS)
  Graphics Card (Tier 2)
  Wireless Network Card (Tier 1)
  2x Memory (Tier 2)
  Central Processing Unit (CPU) (Tier 2)
  Hard Disk Drive (Tier 2) (2MB) (With OpenOS installed)
  Adapter (Needs to touch RS Interface)
  Disk Drive
  Power Converter
  3x Cables

Robot components:
  Screen (Tier 1)
  Keyboard
  EEPROM (Lua BIOS)
  Graphics Card (Tier 1)
  Wireless Network Card (Tier 2)
  2x Memory (Tier 1)
  Central Processing Unit (CPU) (Tier 2)
  Hard Disk Drive (Tier 1) (1MB) (With OpenOS installed)
  Inventory Upgrade
  Inventory Controller Upgrade
  Battery Upgrade (Tier 2) (Optional)
  Charger (Placed near the robot supplied with redstone signal and RF to recharge it)
  
Refined Storage (RS) components:
  Interface (Placed near OC Adapter)
  Crafter (Needs to point towards the chest)
  2x Cables
  Importer (Connected to the Vacuumulator)
  Vacuumulator (To take the miniaturization output)
  Chest (Where the robot takes the materials)
  
Other components:
  4x Miniaturization Field Projectors
  Lever (Turn ON/OFF miniaturization field)
  Lever (Supplies a redstone signal to the Charger)
  Fluxduct (Any)
  2x Tunnels (1 for RF and 1 for RS)
  
 These scripts have a bug where you need to craft every item singularly, like:
  if you request a compact machine and don't have the walls or the pearl, make the pearl or the walls first, do not send a recipe that have more than 1 miniaturization recipes in it.
 
If you have any problems with the script please open an issue.

# Corroborator-Reporter

**Image recording and fingerprinting app for forensic evidence verification.**  

**NOTE TO TECH TO PROTECT REVIEWERS:** email iansphilips@gmail.com to be added as a test user on Apple TestFlight and download the compiled app.

Images and associate metadata taken on this app are "hashed" to create a Content Identified (CID), or a digital fingerprint of the image and metadata. If a **pixel** is changed in the image, or **any** metadata (location, time, etc.) changed, the CID producted from the edited image will differ from the original. The image is uploaded to the InterPlanetary File Storage (IPFS - a distributed, decentralized storage protocol), and CID published to the Ethereum Rinkeby network, an immutable, decentralized blockchain.  

  
<img src="https://github.com/Corroborator-Net/Corroborator-iOS/blob/master/IMG_0683.png" width="200"> <img src="https://github.com/Corroborator-Net/Corroborator-iOS/blob/master/IMG_0684.png" width="200"> <img src="https://github.com/Corroborator-Net/Corroborator-iOS/blob/master/IMG_0685.png" width="200">  


## Features  
  - High quality image capture included with JPEG metadata:
    -  Capture time via [TrueTime](https://github.com/instacart/TrueTime.swift)
    -  GPS information via Device [Location services](https://developer.apple.com/documentation/corelocation/cllocationmanager)
    -  Department, photo purpose, investigation ID, user's name via user input in Settings
    -  Unique device ID and model via Apple [API1](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) and [API2](https://developer.apple.com/documentation/foundation/processinfo/1417911-environment)
  - 3rd-party verifiable time of image recording via Ethereum [block timestamp](https://rinkeby.etherscan.io/blocks)
  - Image fingerpriting via IPFS [CID](https://docs.ipfs.io/guides/concepts/cid/)
  - Fingerprint persistence via [Ethereum distributed ledger](https://ethereum.org/beginners/)
  - Optional decentralized, peer-to-peer, serverless, image storage on [IPFS](https://ipfs.io/)
  - Optional secure image storage via device application storage with preview via user's Camera Roll
  - Image transfer via Itunes Application File Sharing
  - Image file list with report status and thumbnail
  - All networks transfers via TLS
  

## Installation
If a tech to protect reviewer, email iansphilips@gmail.com to be added as a test user on Apple TestFlight and download the compiled app. Otherwise, connect an iPhone with iOS version 13, using Xcode version 11 open the `.xcworkspace`, and hit run.

## Usage  
All information persisted on the blockchain is encrypted via the "Encryption Key" field in the Settings page. This key is used to decrypt the information later on the auditor side. [Assymetric encryption](https://en.wikipedia.org/wiki/Public-key_cryptography) is coming soon.  

All images are packaged with metadata including location, timestamp, photo purpose, investigation ID, user’s name, department, and phone model and unique ID. All metadata is automatically populated (upon photo recording) except the metadata sourced from user input in the Settings such as photo purpose, investigation ID, user name, department. Upon filling the information in the Settings page, the data will be packaged in the metadata for any following pictures taken. Users can view the status and thumbnail of images captured in the image file list page.  

In addition to packaging metadata, the Settings page allows users to specify if they want their files uploaded to the Auditor File Storage via IPFS and if so, if they want the local files deleted from the device. The default is to upload files to IPFs but this can be easily turned off in the Settings page. 

After filling the appropriate fields in the Settings page and choosing the file storage options, the app functions while online and offline.

While **online**:  
Pictures are automatically uploaded to IPFS if "Upload Photos to Auditor File Storage" is set in the Settings page, and the Content Identifier (CID - hash of the jpeg) is uploaded to the Ethereum Rinkeby network with accompanying metadata.


While **offline**:  
Pictures are saved to the application's secure directory and their locations are saved and placed in a queue to be uploaded. Should the user change a photo in their default photo album, this won't change the image and CID uploaded to IPFS and Ethereum. The offline queue is consumed and the saved images are uploaded as soon as the app has internet access. The offline queue persists after the app is restarted. Tap the bottom right file icon to see the Files List page of unsynced and synced files. If you were offline and had files pending, you'll see notifications when they're synced while on the File list page. 

## Transferring Images to a Computer  
In order to transfer an image on the device to a computer, use **Itunes file sharing** and **not** the photo roll as iOS makes changes to images saved to the photo roll (and therefore photo roll images will not pass the auditor PIP check). All photos are stored in the user's default photo album for reference **only**.  

1. Connect your phone to your computer via USB. Open Itunes and click on the phone icon in the top left.  

<img src="https://github.com/Corroborator-Net/Corroborator-iOS/blob/master/Itunes_filesharing_mobile_icon.png" width="300">
  
2. Under settings click on the "File Sharing" tab and the "Corroborator Cam" app. You'll see your list of images on the right.
  
<img src="https://github.com/Corroborator-Net/Corroborator-iOS/blob/master/IMG_filesharing2.png" width="300">



## References  
**Ethereum contract address**: 0x97E7E10b7D408cc9232467B5E1Fc02A76E5960E1  
**To see transactions sent to the contract**: https://rinkeby.etherscan.io/address/0x97E7E10b7D408cc9232467B5E1Fc02A76E5960E1 
**To see/download image with CID from above Ethereum contract**: https://gateway.pinata.cloud/ipfs/IMAGE_CID_HERE  


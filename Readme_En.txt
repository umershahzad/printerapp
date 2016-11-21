************************************************************
      StarPRNT SDK Ver 5.0.2
         Readme_En.txt             Star Micronics Co., Ltd.
************************************************************

 1. Overview
 2. Ver 5.0.2 Changes
 3. Contents
 4. Scope
 5. Limitation
 6. Copyright
 7. Release History

=============
 1. Overview
=============

  This package contains StarPRNT SDK Ver 5.0.2.
  StarIO/StarIO_Extension/SMCloudServices is a library for supporting to develop
  application for Star printers.

  Supported OS  :  iOS 7.0 - iOS 9.3

  Refer to help document including this package for details.


======================
 2. Ver 5.0.2 Changes
======================

  [StarIO]
    - Fixed an issue where the connected property and getOnlineStatus method does not work
      in the mobile printer that is set to StarPRNT emulation.


=============
 3. Contents
=============

  StarPRNT_iOS_SDK_V5_0_2
  |- Readme_En.txt                          // Release Notes (English)
  |- Readme_Jp.txt                          // Release Notes (Japanese)
  |- SoftwareLicenseAgreement.pdf           // Software License Agreement (English)
  |- SoftwareLicenseAgreement_jp.pdf        // Software License Agreement (Japanese)
  |
  +- Document
  |  |- StarPRNT_iOS_SDK_En.pdf                // StarPRNT SDK Document (English)
  |  +- StarPRNT_iOS_SDK_Jp.pdf                // StarPRNT SDK Document (Japanese)
  |
  +- Documents_V3
  |  |- Readme_V3_En.txt                                     // V3 Release Notes (English)
  |  |- Readme_V3_Jp.txt                                     // V3 Release Notes (Japanese)
  |  |- StarIO_ESCPOS_PortablePrinter_iOS_SDK.pdf            // ESC/POS Portable Printer SDK Document (English)
  |  |- StarIO_ESCPOS_PortablePrinter_iOS_SDK_Jp.pdf         // ESC/POS Portable Printer SDK Document (Japanese)
  |  |- StarIO_POSPrinter_iOS_SDK.pdf                        // Desktop Printer SDK Document (English)
  |  |- StarIO_POSPrinter_iOS_SDK_Jp.pdf                     // Desktop Printer SDK Document (Japanese)
  |  |- StarIO_StarLinePortablePrinter_iOS_SDK.pdf           // StarPRNT Portable Printer SDK Document (English)
  |  |- StarIO_StarLinePortablePrinter_iOS_SDK_Jp.pdf        // StarPRNT Portable Printer SDK Document (Japanese)
  |  |- StarIO_DK-AirCash_iOS_SDK.pdf                        // DK-AirCash SDK Document (English)
  |  |- StarIO_DK-AirCash_iOS_SDK_Jp.pdf                     // DK-AirCash SDK Document (Japanese)
  |  |- StarIO_ProxiPRNT_iOS_SDK.pdf                         // ProxiPRNT SDK Document (English)
  |  |- ProxiPRNT_UsersGuide_en.pdf                          // ProxiPRNT Users Guide (English)
  |  +- StarMicronics_POSPrinters_Mac_Ethernet.pdf           // Desktop Printer Mac OS X Document (English)
  |
  +- Software
     +- Distributables
     |   |- StarIO.framework                  // StarIO.framework (Ver 2.2.5)
     |   |- StarIO_Extension.framework        // StarIO_Extension.framework (Ver 1.4.0)
     |   +- SMCloudServices.framework         // SMCloudServices.framework (Ver 1.3.0)
     |
     +- StarPRNT SDK
         |- IOS SDK                         // Samples (Ver 3.16.1)
         |- ObjectiveC SDK                  // Samples (Ver 5.0.2)
         |- Swift SDK                       // Samples (Ver 5.0.2)
         +- StarPRNT SDK.xcworkspace        // Xcode workspace

==========
 4. Scope
==========

  Works with these Emulation:
     - StarPRNT Mode
     - Star Line Mode
     - Star Graphic Mode
     - ESC/POS
     - ESC/POS Mobile
     - Star Dot Impact

       Please refer to each command specification for details.
       You can download this manual from Star web site.


===============
 5. Limitation
===============



==============
 6. Copyright
==============

  Copyright 2016 Star Micronics Co., Ltd. All rights reserved.

====================
 7. Release History
====================
  Ver.5.0.2
   2016/08/25 : [StarIO]
                  - Fixed an issue where the connected property and getOnlineStatus method does not work
                    in the mobile printer that is set to StarPRNT emulation.

  Ver.5.0.1
   2016/08/11 : [Objective-C SDK and Swift SDK]
                  - Add Sample Code.
                    * Printing of camera and photo library.
                    * Bluetooth connection and disconnection.
                    * Manual input of the port name and port settings.
                    * Selection of the opening and closing sensor of the cash drawer.
                    * Confirmation of device status.
                    * Sample print of German.
                    * Implementation of the application state transition.

                [StarIO.framework]
                  - Version up.
                    * Modification API.

                [StarIO_Extension.framework]
                  - Bug Fix.
                    * Measures to the repeated calls of the connection and disconnection.

                [SMCloudServices.framework]
                  - Version up.
                    * Modification API.

  Ver.5.0.0
   2016/03/28 : First release.

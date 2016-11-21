//
//  FrenchReceiptsImpl.swift
//  Swift SDK
//
//  Created by Yuji on 2016/**/**.
//  Copyright © 2016年 Star Micronics. All rights reserved.
//

import Foundation

class FrenchReceiptsImpl: ILocalizeReceipts {
    override init() {
        super.init()
        
        languageCode = "Fr"
    }
    
    override func append2inchTextReceiptData(builder: ISCBBuilder, utf8: Bool) {
        let encoding: NSStringEncoding
        
        if utf8 == true {
            encoding = NSUTF8StringEncoding
            
            builder.appendCodePage(SCBCodePageType.UTF8)
        }
        else {
            encoding = NSWindowsCP1252StringEncoding
            
            builder.appendCodePage(SCBCodePageType.CP1252)
        }
        
        builder.appendInternational(SCBInternationalType.France)
        
        builder.appendCharacterSpace(0)
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendDataWithMultiple("ORANGE\n".dataUsingEncoding(encoding), width: 2, height: 2)
        
        builder.appendData((
            "36 AVENUE LA MOTTE PICQUET\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Left)
        
        builder.appendData((
            "--------------------------------\n" +
            "Date   : MM/DD/YYYY\n" +
            "Heure  : HH:MM\n" +
            "Boutique: OLUA23    Caisse: 0001\n" +
            "Conseiller: 002970  Ticket: 3881\n" +
            "--------------------------------\n" +
            "\n" +
            "Vous avez été servi par : Souad\n" +
            "\n" +
            "CAC IPHONE ORANGE\n" +
            "3700615033581 1 X 19.99€  19.99€\n" +
            "\n" +
            "dont contribution\n" +
            " environnementale :\n" +
            "CAC IPHONE ORANGE          0.01€\n" +
            "--------------------------------\n" +
            "1 Piéce(s) Total :        19.99€\n" +
            "Mastercard Visa  :        19.99€\n" +
            "\n" +
            "Taux TVA    Montant H.T.   T.V.A\n" +
            "  20%          16.66€      3.33€\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendData((
            "Merci de votre visite et.\n" +
            "à bientôt.\n" +
            "Conservez votre ticket il\n" +
            "vous sera demandé pour\n" +
            "tout échange.\n" +
            "\n").dataUsingEncoding(encoding))
        
//      builder.appendBarcodeData("{BStar.".dataUsingEncoding(encoding),              symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
        builder.appendBarcodeData("{BStar.".dataUsingEncoding(NSASCIIStringEncoding), symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
    }
    
    override func append3inchTextReceiptData(builder: ISCBBuilder, utf8: Bool) {
        let encoding: NSStringEncoding
        
        if utf8 == true {
            encoding = NSUTF8StringEncoding
            
            builder.appendCodePage(SCBCodePageType.UTF8)
        }
        else {
            encoding = NSWindowsCP1252StringEncoding
            
            builder.appendCodePage(SCBCodePageType.CP1252)
        }
        
        builder.appendInternational(SCBInternationalType.France)
        
        builder.appendCharacterSpace(0)
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
//      builder.appendData("[If loaded.. Logo1 goes here]\n").dataUsingEncoding(encoding))
//
//      builder.appendLogo(SCBLogoSize.Normal, number: 1)
        
        builder.appendDataWithMultiple("ORANGE\n".dataUsingEncoding(encoding), width: 2, height: 2)
        
        builder.appendData((
            "36 AVENUE LA MOTTE PICQUET\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Left)
        
        builder.appendData((
            "------------------------------------------------\n" +
            "Date: MM/DD/YYYY    Heure: HH:MM\n" +
            "Boutique: OLUA23    Caisse: 0001\n" +
            "Conseiller: 002970  Ticket: 3881\n" +
            "------------------------------------------------\n" +
            "\n" +
            "Vous avez été servi par : Souad\n" +
            "\n" +
            "CAC IPHONE ORANGE\n" +
            "3700615033581   1    X     19.99€         19.99€\n" +
            "\n" +
            "dont contribution environnementale :\n" +
            "CAC IPHONE ORANGE                          0.01€\n" +
            "------------------------------------------------\n" +
            "1 Piéce(s) Total :                        19.99€\n" +
            "Mastercard Visa  :                        19.99€\n" +
            "\n" +
            "Taux TVA    Montant H.T.   T.V.A\n" +
            "  20%          16.66€      3.33€\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendData((
            "Merci de votre visite et. à bientôt.\n" +
            "Conservez votre ticket il\n" +
            "vous sera demandé pour tout échange.\n").dataUsingEncoding(encoding))
        
//      builder.appendBarcodeData("{BStar.".dataUsingEncoding(encoding),              symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
        builder.appendBarcodeData("{BStar.".dataUsingEncoding(NSASCIIStringEncoding), symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
    }
    
    override func append4inchTextReceiptData(builder: ISCBBuilder, utf8: Bool) {
        let encoding: NSStringEncoding
        
        if utf8 == true {
            encoding = NSUTF8StringEncoding
            
            builder.appendCodePage(SCBCodePageType.UTF8)
        }
        else {
            encoding = NSWindowsCP1252StringEncoding
            
            builder.appendCodePage(SCBCodePageType.CP1252)
        }
        
        builder.appendInternational(SCBInternationalType.France)
        
        builder.appendCharacterSpace(0)
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
//      builder.appendData("[If loaded.. Logo1 goes here]\n".dataUsingEncoding(encoding))
//
//      builder.appendLogo(SCBLogoSize.Normal, number: 1)
        
        builder.appendDataWithMultiple("ORANGE\n".dataUsingEncoding(encoding), width: 2, height: 2)
        
        builder.appendData((
            "36 AVENUE LA MOTTE PICQUET\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Left)
        
        builder.appendData((
            "---------------------------------------------------------------------\n" +
            "Date: MM/DD/YYYY    Heure: HH:MM\n" +
            "Boutique: OLUA23    Caisse: 0001\n" +
            "Conseiller: 002970  Ticket: 3881\n" +
            "---------------------------------------------------------------------\n" +
            "\n" +
            "Vous avez été servi par : Souad\n" +
            "\n" +
            "CAC IPHONE ORANGE\n" +
            "3700615033581   1    X     19.99€                              19.99€\n" +
            "\n" +
            "dont contribution environnementale :\n" +
            "CAC IPHONE ORANGE                                               0.01€\n" +
            "---------------------------------------------------------------------\n" +
            "1 Piéce(s) Total :                                             19.99€\n" +
            "Mastercard Visa  :                                             19.99€\n" +
            "\n" +
            "Taux TVA    Montant H.T.   T.V.A\n" +
            "  20%          16.66€      3.33€\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendData((
            "Merci de votre visite et. à bientôt.\n" +
            "Conservez votre ticket il\n" +
            "vous sera demandé pour tout échange.\n").dataUsingEncoding(encoding))
        
//      builder.appendBarcodeData("{BStar.".dataUsingEncoding(encoding),              symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
        builder.appendBarcodeData("{BStar.".dataUsingEncoding(NSASCIIStringEncoding), symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
    }
    
    override func create2inchRasterReceiptImage() -> UIImage {
        let textToPrint: String =
        "          ORANGE\n" +
        "    36 AVENUE LA MOTTE\n" +
        " PICQUET City, State 12345\n" +
        "\n" +
        "--------------------------\n" +
        "Date: MM/DD/YYYY\n" +
        "Time:HH:MM PM\n" +
        "Boutique: OLUA23\n" +
        "Caisse: 0001\n" +
        "Conseiller: 002970\n" +
        "Ticket: 3881\n" +
        "--------------------------\n" +
        "Vous avez été servi par :\n" +
        "                     Souad\n" +
        "CAC IPHONE ORANGE\n" +
        "3700615033581 1 X   19.99€\n" +
        "                    19.99€\n" +
        "dont contribution\n" +
        " environnementale :\n" +
        "CAC IPHONE ORANGE    0.01€\n" +
        "--------------------------\n" +
        " 1 Piéce(s) Total : 19.99€\n" +
        "\n" +
        "  Mastercard Visa : 19.99€\n" +
        "Taux TVA Montant H.T.\n" +
        "     20%       16.66€\n" +
        "T.V.A\n" +
        "3.33€\n" +
        "Merci de votre visite et.\n" +
        "à bientôt.\n" +
        "Conservez votre ticket il\n" +
        "vous sera demandé pour\n" +
        "tout échange.\n"
        
        let font: UIFont = UIFont(name: "Menlo", size: 12 * 2)!
        
        return ILocalizeReceipts.imageWithString(textToPrint, font: font, width: 384)     // 2inch(384dots)
    }
    
    override func create3inchRasterReceiptImage() -> UIImage {
        let textToPrint: String =
        "                ORANGE\n" +
        "           36 AVENUE LA MOTTE\n" +
        "        PICQUET City, State 12345\n" +
        "\n" +
        "--------------------------------------\n" +
        "     Date: MM/DD/YYYY    Time:HH:MM PM\n" +
        "        Boutique: OLUA23  Caisse: 0001\n" +
        "      Conseiller: 002970  Ticket: 3881\n" +
        "--------------------------------------\n" +
        "Vous avez été servi par : Souad\n" +
        "CAC IPHONE ORANGE\n" +
        "3700615033581   1 X 19.99€      19.99€\n" +
        "dont contribution environnementale :\n" +
        "CAC IPHONE ORANGE                0.01€\n" +
        "--------------------------------------\n" +
        "  1 Piéce(s)    Total :         19.99€\n" +
        "\n" +
        "        Mastercard Visa  :      19.99€\n" +
        "          Taux TVA  Montant H.T. T.V.A\n" +
        "               20%       16.66€  3.33€\n" +
        "  Merci de votre visite et. à bientôt.\n" +
        "   Conservez votre ticket il vous sera\n" +
        "            demandé pour tout échange.\n"
        
        let font: UIFont = UIFont(name: "Menlo", size: 12 * 2)!
        
        return ILocalizeReceipts.imageWithString(textToPrint, font: font, width: 576)     // 3inch(576dots)
    }
    
    override func create4inchRasterReceiptImage() -> UIImage {
        let textToPrint: String =
        "                        ORANGE\n" +
        "     36 AVENUE LA MOTTE PICQUET City, State 12345\n" +
        "\n" +
        "-------------------------------------------------------\n" +
        "                      Date: MM/DD/YYYY    Time:HH:MM PM\n" +
        "                  Boutique: OLUA23         Caisse: 0001\n" +
        "                Conseiller: 002970         Ticket: 3881\n" +
        "-------------------------------------------------------\n" +
        "Vous avez été servi par : Souad\n" +
        "CAC IPHONE ORANGE\n" +
        "3700615033581      1  X  19.99€                  19.99€\n" +
        "dont contribution environnementale :\n" +
        "CAC IPHONE ORANGE                                 0.01€\n" +
        "-------------------------------------------------------\n" +
        "        1 Piéce(s)    Total :                    19.99€\n" +
        "\n" +
        "        Mastercard Visa  :                       19.99€\n" +
        "                           Taux TVA  Montant H.T. T.V.A\n" +
        "                              20%         16.66€  3.33€\n" +
        "                   Merci de votre visite et. à bientôt.\n" +
        " Conservez votre ticket il vous sera demandé pour\n" +
        " tout échange.\n"
        
        let font: UIFont = UIFont(name: "Menlo", size: 12 * 2)!
        
        return ILocalizeReceipts.imageWithString(textToPrint, font: font, width: 832)     // 4inch(832dots)
    }
    
    override func createCouponImage() -> UIImage {
        return UIImage(named: "FrenchCouponImage.png")!
    }
    
    override func createEscPos3inchRasterReceiptImage() -> UIImage {
        let textToPrint: String =
        "              ORANGE\n" +
        "         36 AVENUE LA MOTTE\n" +
        "      PICQUET City, State 12345\n" +
        "\n" +
        "-----------------------------------\n" +
        "  Date: MM/DD/YYYY    Time:HH:MM PM\n" +
        "     Boutique: OLUA23  Caisse: 0001\n" +
        "   Conseiller: 002970  Ticket: 3881\n" +
        "-----------------------------------\n" +
        "Vous avez été servi par : Souad\n" +
        "CAC IPHONE ORANGE\n" +
        "3700615033581  1 X 19.99€    19.99€\n" +
        "dont contribution environnementale:\n" +
        "CAC IPHONE ORANGE             0.01€\n" +
        "-----------------------------------\n" +
        "  1 Piéce(s)    Total :      19.99€\n" +
        "\n" +
        "     Mastercard Visa  :      19.99€\n" +
        "       Taux TVA  Montant H.T. T.V.A\n" +
        "            20%       16.66€  3.33€\n" +
        "Merci de votre visite et.\n" +
        "à bientôt.\n" +
        "Conservez votre ticket il vous sera\n" +
        "demandé pour tout échange.\n"
        
        let font: UIFont = UIFont(name: "Menlo", size: 12 * 2)!
        
        return ILocalizeReceipts.imageWithString(textToPrint, font: font, width: 512)     // EscPos3inch(512dots)
    }
    
    override func appendEscPos3inchTextReceiptData(builder: ISCBBuilder, utf8: Bool) {
        let encoding: NSStringEncoding
        
        if utf8 == true {
            encoding = NSUTF8StringEncoding
            
            builder.appendCodePage(SCBCodePageType.UTF8)
        }
        else {
            encoding = NSWindowsCP1252StringEncoding
            
            builder.appendCodePage(SCBCodePageType.CP1252)
        }
        
        builder.appendInternational(SCBInternationalType.France)
        
        builder.appendCharacterSpace(0)
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
//      builder.appendData("[If loaded.. Logo1 goes here]\n").dataUsingEncoding(encoding))
//
//      builder.appendLogo(SCBLogoSize.Normal, number: 1)
        
        builder.appendDataWithMultiple("ORANGE\n".dataUsingEncoding(encoding), width: 2, height: 2)
        
        builder.appendData((
            "36 AVENUE LA MOTTE PICQUET\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Left)
        
        builder.appendData((
            "------------------------------------------\n" +
            "Date: MM/DD/YYYY    Heure: HH:MM\n" +
            "Boutique: OLUA23    Caisse: 0001\n" +
            "Conseiller: 002970  Ticket: 3881\n" +
            "------------------------------------------\n" +
            "\n" +
            "Vous avez été servi par : Souad\n" +
            "\n" +
            "CAC IPHONE ORANGE\n" +
            "3700615033581   1    X   19.99€     19.99€\n" +
            "\n" +
            "dont contribution environnementale :\n" +
            "CAC IPHONE ORANGE                    0.01€\n" +
            "------------------------------------------\n" +
            "1 Piéce(s) Total :                  19.99€\n" +
            "Mastercard Visa  :                  19.99€\n" +
            "\n" +
            "Taux TVA    Montant H.T.   T.V.A\n" +
            "  20%          16.66€      3.33€\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendData((
            "Merci de votre visite et. à bientôt.\n" +
            "Conservez votre ticket il\n" +
            "vous sera demandé pour tout échange.\n").dataUsingEncoding(encoding))
        
//      builder.appendBarcodeData("{BStar.".dataUsingEncoding(encoding),              symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
        builder.appendBarcodeData("{BStar.".dataUsingEncoding(NSASCIIStringEncoding), symbology: SCBBarcodeSymbology.Code128, width: SCBBarcodeWidth.Mode2, height: 40, hri: true)
    }
    
    override func appendDotImpact3inchTextReceiptData(builder: ISCBBuilder, utf8: Bool) {
        let encoding: NSStringEncoding
        
        if utf8 == true {
            encoding = NSUTF8StringEncoding
            
            builder.appendCodePage(SCBCodePageType.UTF8)
        }
        else {
            encoding = NSWindowsCP1252StringEncoding
            
            builder.appendCodePage(SCBCodePageType.CP1252)
        }
        
        builder.appendInternational(SCBInternationalType.France)
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
//      builder.appendData("[If loaded.. Logo1 goes here]\n".dataUsingEncoding(encoding))
//
//      builder.appendLogo(SCBLogoSize.Normal, number: 1)
        
        builder.appendDataWithMultiple("ORANGE\n".dataUsingEncoding(encoding), width: 2, height: 2)
        
        builder.appendData((
            "36 AVENUE LA MOTTE PICQUET\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Left)
        
        builder.appendData((
            "------------------------------------------\n" +
            "Date: MM/DD/YYYY    Heure: HH:MM\n" +
            "Boutique: OLUA23    Caisse: 0001\n" +
            "Conseiller: 002970  Ticket: 3881\n" +
            "------------------------------------------\n" +
            "\n" +
            "Vous avez été servi par : Souad\n" +
            "\n" +
            "CAC IPHONE ORANGE\n" +
            "3700615033581 1 X 19.99€            19.99€\n" +
            "\n" +
            "dont contribution environnementale :\n" +
            "CAC IPHONE ORANGE                    0.01€\n" +
            "------------------------------------------\n" +
            "1 Piéce(s) Total :                  19.99€\n" +
            "Mastercard Visa  :                  19.99€\n" +
            "\n" +
            "Taux TVA    Montant H.T.   T.V.A\n" +
            "  20%          16.66€      3.33€\n" +
            "\n").dataUsingEncoding(encoding))
        
        builder.appendAlignment(SCBAlignmentPosition.Center)
        
        builder.appendData((
            "Merci de votre visite et. à bientôt.\n" +
            "Conservez votre ticket il\n" +
            "vous sera demandé pour tout échange.\n").dataUsingEncoding(encoding))
    }
}

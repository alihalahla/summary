//
//  UIColorToHex.swift
//  TestApp
//
//  Created by עלי חלאחלה on 02/11/2023.
//

import Foundation
import UIKit

extension UIColor {
    static var logInGreen = hexStringToUIColor(hex: "#00A2AE")
    static var mainRed = hexStringToUIColor(hex: "#e31c24")
    static var mainBlack = hexStringToUIColor(hex: "#353535")
    static var mainGray = hexStringToUIColor(hex: "#757575")
    static var mainGreen = hexStringToUIColor(hex: "#38ABB6")
    static var mainWhite = hexStringToUIColor(hex: "#FFFFFF")
    static var mainDark = hexStringToUIColor(hex: "#707070")
    static var mainYellow = hexStringToUIColor(hex: "#FFC300")
    static var mainBlue = hexStringToUIColor(hex: "#0A66AE")
    static var topViewAlert = hexStringToUIColor(hex: "#D0212F")
    static var borderButton = hexStringToUIColor(hex: "#0D66AE")
    static var blueDrak = hexStringToUIColor(hex: "#0A3150")
    static var navTitle = hexStringToUIColor(hex: "#126CB3")
    static var recordingCompletedNextBtn = hexStringToUIColor(hex: "#016167")
    static var codeRegistrationGray = hexStringToUIColor(hex: "#616161")
    static var toastBackground = hexStringToUIColor(hex: "#F0F0F0")
    static var invalidCode = hexStringToUIColor(hex: "#FF3A4A")
    static var welcomeView = hexStringToUIColor(hex: "#2D95E8")
    static var welcomeYellow = hexStringToUIColor(hex: "#FFF035")
    static var homeBackground = hexStringToUIColor(hex: "#F5F5F5")
    static var pagerGray = hexStringToUIColor(hex: "#BFBFBF")
    static var splashBackground = hexStringToUIColor(hex: "#126CB3")
    static var progressBarBackground = hexStringToUIColor(hex: "#71b9f4")
    static var logout = hexStringToUIColor(hex: "#BC2729")
    static var separatorColor = hexStringToUIColor(hex: "#E0E0E0")
    static var logoutAlert = hexStringToUIColor(hex: "#147AFC")
    static var joinToFamely = hexStringToUIColor(hex: "#191919")
    static var joinToFamelyLink = hexStringToUIColor(hex: "#548DFF")
    static var fullTavBackground = hexStringToUIColor(hex: "#DC1B20")
    static var fullTavLine = hexStringToUIColor(hex: "#BDBDBD")
    static var fullTavNotUsed = hexStringToUIColor(hex: "#9E9E9E")
    static var filterViewSelected = hexStringToUIColor(hex: "#0B5591")
    static var paymentHistoryActivated = hexStringToUIColor(hex: "#D5ECFF")
    static var paymentHistoryCanceled = hexStringToUIColor(hex: "#A1A1A1")
    static var paymentHistoryNotSubmited = hexStringToUIColor(hex: "#FF8D8E")
    static var dateSelected = hexStringToUIColor(hex: "#FF453A")
    static var submitdateSelecte = hexStringToUIColor(hex: "#007AFF")
    static var dateSelectedBg = hexStringToUIColor(hex: "#F9F9F9")
    static var sendReason = hexStringToUIColor(hex: "#919191")
    static var showCode = hexStringToUIColor(hex: "#727272")
    static var updateDetailesTitle = hexStringToUIColor(hex: "#CBCBCB")
    static var securityLine = hexStringToUIColor(hex: "#EAEAEA")
    static var updatePersonalToast = hexStringToUIColor(hex: "#525252")
    static var addCreditCardAlert = hexStringToUIColor(hex: "#572375")
    static var addCreditCardAlertTitle = hexStringToUIColor(hex: "#FBED34")
    static var dotJ5 = hexStringToUIColor(hex: "#FFDD77")
    static var refunded = hexStringToUIColor(hex: "#87CEEB")
    
    static var mianShadow = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.29).cgColor
    static var disableButton = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 0.33)
    static var disableButtonText = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.38)
    static var disableLine = UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 0.16)
    static var alertLine = UIColor(red: 61/255, green: 61/255, blue: 66/255, alpha: 0.29)
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

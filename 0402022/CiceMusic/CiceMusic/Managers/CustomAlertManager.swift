//
//  CustomAlertManager.swift
//  CiceMusic
//
//  Created by CICE on 15/02/2022.
//

import Foundation

enum DefaultAlertType: Int {
    case none
    case successLogin
    case failureLogin
}

struct CustomAlertManager {

    var type: DefaultAlertType?
    
    // Success Login
    var successLoginTitle = LocalizedKeys.Login.titleAlertLoginSuccess
    var successLoginMessage = LocalizedKeys.Login.messageAlertLoginSuccess
    
    // Failure Login
    var failureLoginTitle = LocalizedKeys.Login.titleAlertLoginFailure
    var failureLoginMessage = LocalizedKeys.Login.messageAlertLoginFailure
    
    // General Title Buttons
    var primaryButton = LocalizedKeys.General.generalAcccept
    var secondButton = LocalizedKeys.General.generalCancel
    
    init(type: DefaultAlertType) {
        self.type = type
    }
}

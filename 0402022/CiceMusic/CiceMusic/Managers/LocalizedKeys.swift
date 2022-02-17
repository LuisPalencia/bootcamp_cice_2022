//
//  LocalizedKeys.swift
//  CiceMusic
//
//  Created by CICE on 15/02/2022.
//

import Foundation

struct LocalizedKeys {
    
    // GENERAL
    struct General {
        static let generalAcccept = "general_accept".localized
        static let generalCancel = "general_cancel".localized
    }
    
    // LOGIN
    struct Login {
        static let titleAlertLoginSuccess = "title_my_alert_login_success".localized
        static let messageAlertLoginSuccess = "message_my_alert_login_success".localized
        static let titleAlertLoginFailure = "title_my_alert_login_failure".localized
        static let messageAlertLoginFailure = "message_my_alert_login_failure".localized
    }
    
    // MAIL
    struct Mail {
        static let titleAlertMailSuccess = "title_my_alert_login_success".localized
        static let messageAlertMailSuccess = "message_my_alert_login_success".localized
        static let titleAlertMailFailure = "title_my_alert_login_failure".localized
        static let messageAlertMailFailure = "message_my_alert_login_failure".localized
    }
    
    // CONFIRMATION
    struct Confirmation {
        static let titleAlertConfirmation = "title_my_alert_login_success".localized
        static let messageAlertMailConfirmation = "message_my_alert_login_success".localized
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

//
//  LoginViewModel.swift
//  CiceTmdbApp
//
//  Created by CICE on 03/03/2022.
//

import Foundation

enum LoginOption{
    case sessionWithApple
    case emailAndPassword(email: String, password: String)
}

enum AuthenticationType: String {
    
    case signIn
    case signUp
    
    var text: String {
        rawValue.capitalized
    }
    
    var footterText: String {
        switch self{
        case .signIn:
            return "You aren't member yet, sign up"
        case .signUp:
            return "Are yu ready for Cice TMDB App?"
        }
    }
}

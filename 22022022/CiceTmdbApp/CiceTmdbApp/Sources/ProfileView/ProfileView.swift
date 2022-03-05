//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by CICE on 04/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        if self.viewModelSession.userLogged != nil{
            Form{
                Section(header: Text("Profile data")) {
                    Button(action: {
                        self.viewModelSession.logoutSession()
                    }, label: {
                        Text("Logout")
                    })
                    .buttonStyleH1()
                    //.font(.title3)
                }
            }
        }else{
            ContentView()
        }

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

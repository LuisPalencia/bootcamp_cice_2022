//
//  ProfileView.swift
//  CiceTmdbApp
//
//  Created by CICE on 04/03/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModelSession: LoginViewModel
    @State private var isPresented = false
    
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
                
                Section(header: Text("Mis favoritos")) {
                    Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Text("Favourites")
                    })
                    .buttonStyleH1()
                    .sheet(isPresented: self.$isPresented, content: {
                        FavouritesCoordinator.navigation()
                    })
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

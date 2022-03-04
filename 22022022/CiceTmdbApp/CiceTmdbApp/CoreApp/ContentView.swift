//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by CICE on 22/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    @EnvironmentObject var viewModelSession: LoginViewModel
    
    var body: some View {
        VStack{
            //MoviesCoordinator.navigation().environment(\.colorScheme, .dark)
            if currentPage > Constants.totalPages{
                if self.viewModelSession.userLogged != nil {
                    HomeView()
                }else{
                    LoginView(authType: .signUp)
                }
                
                
            }else{
                OnBoardingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

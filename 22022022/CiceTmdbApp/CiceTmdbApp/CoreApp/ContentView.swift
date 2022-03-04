//
//  ContentView.swift
//  CiceTmdbApp
//
//  Created by CICE on 22/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack{
            //MoviesCoordinator.navigation().environment(\.colorScheme, .dark)
            if currentPage > Constants.totalPages{
                //HomeView()
                LoginView(authType: .signIn)
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

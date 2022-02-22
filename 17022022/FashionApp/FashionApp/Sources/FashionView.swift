//
//  FashionView.swift
//  FashionApp
//
//  Created by CICE on 21/02/2022.
//

import SwiftUI

struct FashionView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    CustomNavigationView(showAlertTres: self.$showCustomAlertView)
                    CustomBodyMainView()
                }
                .blur(radius: self.showCustomAlertView ? 3 : 0)
                .animation(.easeInOut, value: self.showCustomAlertView)
                
                if showCustomAlertView {
                    CustomAlertView(title: "Esta es una Custom Alert View",
                                    message: "Este es una alerta personalizada y se colocará encima de la vista principal y se añadirá un efecto de blur y el fondo medio opaco",
                                    hideCustomAlertView: self.$showCustomAlertView)
                        
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}

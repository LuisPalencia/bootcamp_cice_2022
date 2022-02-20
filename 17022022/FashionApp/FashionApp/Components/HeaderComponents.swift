//
//  HeaderComponents.swift
//  FashionApp
//
//  Created by CICE on 17/02/2022.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack{
            titleView(title: "Header Component")
            subtitleView(subtitle: "Estamos aprendiendo SwiftUIb, con Xcode 12 y 13 para mejorar nuestra compresión del mundo Apple")
            descriptionView(descriptionString: "Estamos con la base de la gestion de subcomponentes que hace que SwiftUI sea super ligero de entender")
        }
    }
}

struct titleView: View {
    
    var title: String
    
    var body: some View{
        Text(title)
            .padding(20)
            .font(.title)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
}

struct subtitleView: View {
    
    var subtitle: String
    
    var body: some View{
        Text(subtitle)
            .padding(.horizontal, 20)
            .font(.title3)
            .foregroundColor(.black)
    }
}

struct descriptionView: View {
    
    var descriptionString: String
    
    var body: some View{
        Text(descriptionString)
            .padding([.horizontal, .top], 20)
            .font(.callout)
            .foregroundColor(.black)
            .background(Color.orange)
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
    }
}

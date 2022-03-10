//
//  DetalleContactoView.swift
//  Contactos
//
//  Created by CICE on 10/03/2022.
//

import SwiftUI

struct DetalleContactoView: View {
    
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    var data: Contacto
    
    var body: some View {
        VStack{
            Text("LP")
                .circularButton(fontFamily: "Arial",
                                fontSize: 100,
                                foregroundColor: .white,
                                background: .gray,
                                padding: 50)
            Text(self.data.nombre)
                .font(.title)
                .bold()
            Text(self.data.apellido)
                .font(.headline)
            Text("Tel: \(self.data.telefono)")
                .font(.largeTitle)
            
            HStack {
                Button(action: {
                    // La llamada de telefono
                    guard let numero = URL(string: "tel://" + self.data.telefono) else { return }
                        UIApplication.shared.open(numero, options: [:], completionHandler: nil)
                }, label: {
                    Image(systemName: "phone.fill")
                        .circularButton(fontFamily: "Arial",
                                        fontSize: 30,
                                        foregroundColor: .white,
                                        background: .green,
                                        padding: 30)
                })
                
                NavigationLink(
                    destination: AgregarContactoView(esEdicion: true, data: self.data),
                    label: {
                        Image(systemName: "pencil")
                            .circularButton(fontFamily: "Arial",
                                            fontSize: 30,
                                            foregroundColor: .white,
                                            background: .blue,
                                            padding: 30)
                    })
            }
        }
    }
}

struct DetalleContactoView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleContactoView(data: Contacto())
    }
}

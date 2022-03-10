//
//  ContactosCell.swift
//  Contactos
//
//  Created by CICE on 09/03/2022.
//

import SwiftUI

struct ContactosCell: View {
    
    var contacto: Contacto
    
    var body: some View {
        HStack{
            Text(contacto.iniciales)
                .padding(20)
                .background(Color.gray)
                .clipShape(Circle())
                .foregroundColor(.white)
                .font(.title)
            
            VStack(alignment: .leading, content: {
                Text(contacto.nombre)
                    .font(.title)
                    .bold()
                Text(contacto.apellido)
                    .font(.headline)
                Text(contacto.telefono)
                    .font(.caption)
                    .foregroundColor(.gray)
            })
        }
    }
}

struct ContactosCell_Previews: PreviewProvider {
    static var previews: some View {
        ContactosCell(contacto: Contacto())
    }
}

//
//  AgregarContactoView.swift
//  Contactos
//
//  Created by CICE on 09/03/2022.
//

import SwiftUI

struct AgregarContactoView: View {
    
    // MARK: - ICD
    @Environment(\.managedObjectContext) private var viewContext
    @SwiftUI.Environment(\.presentationMode) var presentedMode
    
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var direccion = ""
    @State private var edad = ""
    @State private var email = ""
    @State private var genero = ""
    @State private var telefono = ""
    @State private var iniciales = ""
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                TextField("Nombre", text: self.$nombre)
                    .textFieldStyle()
                TextField("Apellido", text: self.$apellido)
                    .textFieldStyle()
                TextField("Direccion", text: self.$direccion)
                    .textFieldStyle()
                TextField("Edad", text: self.$edad)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                TextField("Email", text: self.$email)
                    .textFieldStyle()
                    .keyboardType(.emailAddress)
                TextField("Genero", text: self.$genero)
                    .textFieldStyle()
                TextField("Telefono", text: self.$telefono)
                    .textFieldStyle()
                    .keyboardType(.phonePad)
                
                Button(action: {
                    self.salvarContacto()
                }, label: {
                    HStack(spacing: 20){
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Guardar contacto")
                            .foregroundColor(.white)
                            .font(.title2)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                })
            }
            .padding(10)
        }
        .onAppear(
            
        )
        .navigationTitle("Agregar Contacto")
    }
    
    // MARK: - Private methods
    private func salvarContacto() {
        //Accedemos a la entidad que contiene la BBDD
        let nuevoContacto = Contacto(context: self.viewContext)
        let inicialN = String(self.nombre.first ?? "A")
        let inicialA = String(self.apellido.first ?? "A")
        
        nuevoContacto.nombre = self.nombre
        nuevoContacto.apellido = self.apellido
        nuevoContacto.telefono = self.direccion
        nuevoContacto.email = self.email
        nuevoContacto.telefono = self.telefono
        nuevoContacto.genero = self.genero
        nuevoContacto.edad = self.edad
        nuevoContacto.iniciales = inicialN + inicialA
        
        do{
            try self.viewContext.save()
            print("Salvado correctamente")
            self.presentedMode.wrappedValue.dismiss()
        }catch let error as NSError {
            print("Error al salvar los datos", error.localizedDescription)
        }
    }
}

struct AgregarContactoView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarContactoView()
    }
}

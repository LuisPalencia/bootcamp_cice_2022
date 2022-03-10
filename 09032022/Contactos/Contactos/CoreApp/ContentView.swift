//
//  ContentView.swift
//  Contactos
//
//  Created by CICE on 09/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    //@SwiftUI.Environment(\.presentationMode) var presenterMode
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: Contacto.mostrarContactos()) var contactos: FetchedResults<Contacto>
    
    //@FetchRequest(entity: Contacto.entity(),
    //              sortDescriptors: [NSSortDescriptor(keyPath: \Contacto.nombre, ascending: true)]) var contactos: FetchedResults<Contacto>
    
    // SQL: SELECT * FROM CONTACTOS WHERE APELLIDO = 'PALENCIA' ORDER BY ASC
    /*@FetchRequest(entity: Contacto.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Contacto.nombre, ascending: true)], predicate: NSPredicate(format: "apellido = %@", "Palencia")) var contactos: FetchedResults<Contacto>
 */
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(self.contactos){ item in
                        NavigationLink(
                            destination: DetalleContactoView(data: item),
                            label: {
                                ContactosCell(contacto: item)
                            })
                    }.onDelete(perform: { indexSet in
                        self.borrarRegistros(data: indexSet)
                    })
                }
                
                NavigationLink(
                    destination: AgregarContactoView(),
                    label: {
                        HStack(spacing: 20){
                            Image(systemName: "plus.app.fill")
                                .foregroundColor(.white)
                                .font(.title)
                            Text("Guardar contacto")
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                        .background(Color.green)
                        .clipShape(Capsule())
                    })
            }
            .onAppear(perform: {
                //contactos.
            })
            .navigationBarItems(leading: EditButton())
            .navigationTitle("Contactos")
        }
    }
    
    private func borrarRegistros(data: IndexSet){
        guard let indexUnw = data.first else { return }
        let borrarRegistro = self.contactos[indexUnw]
        self.viewContext.delete(borrarRegistro)
        do {
            try self.viewContext.save()
        }catch let error as NSError {
            print("Error al borrar registros", error.localizedDescription)
        }
    }
    
    func getCoreDataDBPath(){
        let path = FileManager
            .default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)
            .last?
            .absoluteString
            .replacingOccurrences(of: "file://", with: "")
            .removingPercentEncoding
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

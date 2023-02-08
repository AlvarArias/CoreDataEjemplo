//
//  ContentView.swift
//  CoreDataEjemplo
//
//  Created by Alvar Arias on 2022-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var mylist
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.nombre, order: .reverse)
    ]
    ) var products: FetchedResults<Producto>
    
    var body: some View {
        NavigationView {
        VStack {
            List {
                
            ForEach(products) { producto in
                Text(producto.nombre ?? "Sin Nombre")
                
                    
                    }
                .onDelete(perform: removeLanguages)
                }
            }
        
        .navigationTitle("Core DAta Items")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            EditButton()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button("Add") {
                    let Bateria = ["Bateria AAA", "Bateria AA", "Bateria 9V", "Bateria 12V"]
                    let Marca = ["Duracell", "RadioVac", "MyBrand", "NEC"]

                    let chosenBateria = Bateria.randomElement()!
                    let chosenMarca = Marca.randomElement()!

                    let product = Producto(context: mylist)
                    product.id = UUID()
                    product.nombre = "\(chosenBateria) \(chosenMarca)"
                    
                    try? mylist.save()
                
                    }
                    
                  Spacer()
                    Button("Delete") {
                        print("Delete")
                        
                    }
                  Spacer()
                    
                }
            }
        }
    }
    
    func removeLanguages(at offsets: IndexSet) {
        for index in offsets {
            let producto = products[index]
            mylist.delete(producto)
        }
        do {
            try mylist.save()
        } catch {
            print("error to save object")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

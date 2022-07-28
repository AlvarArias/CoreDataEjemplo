//
//  ContentView.swift
//  CoreDataEjemplo
//
//  Created by Alvar Arias on 2022-07-28.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var mylist
    
    @FetchRequest(sortDescriptors: []) var products: FetchedResults<Producto>
    
    var body: some View {
    
        VStack {
            List(products) { producto in
                Text(producto.nombre ?? "Sin Nombre")
                }
                
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

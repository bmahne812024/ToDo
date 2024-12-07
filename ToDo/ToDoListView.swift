//
//  ContentView.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    
    @Query var toDos: [ToDo]
    @State private var isSheetPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    ForEach(toDos) { toDo in
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }

                    }
                }
                .fullScreenCover(isPresented: $isSheetPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo()) 
                    }
                }
            }
            .navigationTitle("To Do List")
            .toolbar() {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        isSheetPresented.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ToDoListView()
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}

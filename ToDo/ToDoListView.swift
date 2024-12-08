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
                        HStack {
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                    guard let _ = try? modelContext.save() else {
                                        print("Error saving")
                                        return
                                    }
                                }
                            NavigationLink {
                                DetailView(toDo: toDo)
                                
                                
                            } label: {
                                Text(toDo.item)
                            }
                        }
                        .font(.title2)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach({modelContext.delete(toDos[$0])})
                        guard let _ = try? modelContext.save() else {
                            print("Error saving")
                            return
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

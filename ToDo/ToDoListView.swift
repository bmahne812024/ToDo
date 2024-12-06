//
//  ContentView.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Go to work",
                 "Get better at Swift",
                 "Get a better job"]
    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    ForEach(toDos, id:\.self) { toDo in
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo)
                        }

                    }
                }
            }
            .navigationTitle("To Do List")
        }
    }
}

#Preview {
    ToDoListView()
}

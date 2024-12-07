//
//  DetailView.swift
//  ToDo
//
//  Created by Brian Mahne on 12/6/24.
//

import SwiftUI
import SwiftData
struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var item = ""
    @State private var isReminderOn = false
    @State private var isCompleted = false
    @State private var notes = ""
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date.now)!
    @State var toDo: ToDo
    
    var body: some View {
        List {
            TextField("Enter To Do Item:", text: $item)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
                .font(.title)
            Toggle("Set Reminder:", isOn: $isReminderOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            DatePicker("Date:", selection: $dueDate)
                .padding(.top)
                .listRowSeparator(.hidden)
            Text("Notes:")
                .listRowSeparator(.hidden)
            TextField(text: $notes, axis: .vertical) {
                Text("Notes")
            }
            .listRowSeparator(.hidden)
            .textFieldStyle(.roundedBorder)
            Toggle("Completed:", isOn: $isCompleted)
                
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .onAppear() {
            dueDate = toDo.dueDate
            item = toDo.item
            isReminderOn = toDo.isReminderOn
            isCompleted = toDo.isCompleted
            notes = toDo.notes
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    toDo.dueDate = dueDate
                    toDo.item = item
                    toDo.isReminderOn = isReminderOn
                    toDo.isCompleted = isCompleted
                    toDo.notes = notes
                    modelContext.insert(toDo)
                    guard let _ = try? modelContext.save() else {
                        print("Could not save data")
                        return
                    }
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}

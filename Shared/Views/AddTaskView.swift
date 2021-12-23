//
//  AddTaskView.swift
//  ToDo
//
//  Created by Liam Percy on 23/12/21.
//

import SwiftUI

struct AddTaskView: View {
    @State private var name: String = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
    }
    
    func handleSubmit() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.name = name
            newTask.complete = false

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
        dismiss()
    }

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Task Name", text: $name).submitLabel(.done).onSubmit {
                        handleSubmit()
                    }
                }.padding(.top)

                Button {
                    handleSubmit()
                } label: {
                    Text("Create")
                        .foregroundColor(.blue)
                        .padding().frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(20)
                }.padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.blue)
            
            .navigationTitle("Add Task")
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

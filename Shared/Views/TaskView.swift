//
//  TaskView.swift
//  ToDo
//
//  Created by Liam Percy on 23/12/21.
//

import SwiftUI

struct TaskView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.complete, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack {
                ForEach(tasks.indices) { i in
                    TaskCard(
                        name: tasks[i].name!,
                        completed: tasks[i].complete,
                        index: i)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .navigationTitle("Tasks")
            
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) private var viewContext
    static var previews: some View {
        TaskView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

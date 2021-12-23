//
//  Task.swift
//  ToDo
//
//  Created by Liam Percy on 23/12/21.
//

import SwiftUI

struct TaskCard: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.complete, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    var name: String
    var completed: Bool
    var index: Int

    func handleComplete() {
        withAnimation {
            tasks[index].complete.toggle()
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    var body: some View {
        HStack(spacing: 30) {
            Button(action: {
                handleComplete()
            }) {
                Image(systemName: completed ? "checkmark" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
            }.foregroundColor(.black).padding(10)
            Text(name)
            Spacer()
        }.padding().frame(maxWidth: .infinity).background(.white).cornerRadius(10)
    }
}

struct Task_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) private var viewContext

    static var previews: some View {
        TaskCard(name: "Do shit", completed: true, index: 0).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

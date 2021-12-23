//
//  AddButton.swift
//  ToDo
//
//  Created by Liam Percy on 23/12/21.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Circle().frame(width: 80).foregroundColor(.white)
            Image(systemName: "plus")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
        }
        .frame(height: 80)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}

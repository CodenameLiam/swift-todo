//
//  ProfileView.swift
//  ToDo
//
//  Created by Liam Percy on 23/12/21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("firstName") var firstName = ""
    @AppStorage("lastName") var lastName = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Name"), content: {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                    })
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

//
//  AccountView.swift
//  Appetizy (iOS)
//
//  Created by Christian Arlt on 13.11.20.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var model: AppertizyModel

    var body: some View {
        Form {
            Section(header: Text("Personal Info:")) {
                TextField("First Name", text: $model.account.firstname)
                TextField("Last Name", text: $model.account.lastname)
                TextField("E-Mail", text: $model.account.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                DatePicker("Birthdate", selection: $model.account.birthdate, displayedComponents: .date)
                Button(action: { }) {
                    Text("Save changes")
                }
            }
            Section(header: Text("Request")) {
                Toggle("Extra Napkins", isOn: $model.account.extraNapkins)
                Toggle("Frequent Refills", isOn: $model.account.frequentRefills)
            }
            .toggleStyle(SwitchToggleStyle(tint: .accentColor))

        }
        .navigationTitle("🤷‍♂️ Account")
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountView()
                .environmentObject(AppertizyModel())
        }
    }
}

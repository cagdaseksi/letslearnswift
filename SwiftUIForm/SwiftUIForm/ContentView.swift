//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by MAC on 12.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    @State private var people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Login")) {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                    Button(action: {
                        print("username: \(self.username), password: \(self.password)")
                        self.people.append(self.username)
                        
                    }, label: {
                        Text("Sign in")
                    })
                }
                
                Section {
                    List(people, id: \.self) {
                        Text($0)
                    }
                }
                
            }.navigationBarTitle(Text("SwiftUI Form"), displayMode: .inline).navigationBarItems(trailing:
                Button(action: barButton) {
                    Text("Bar Button")
                }
            )
        }
        
    }
    
    func barButton() {
        print("OK")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SwiftUIExamples
//
//  Created by MAC on 6.05.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Merhaba SwiftUI!").bold()
            Text("SwiftUI öğreniyorum.")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

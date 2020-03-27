//
//  Navigation.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        NavigationView {
            List(0...100, id: \.self) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row: \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}

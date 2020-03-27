//
//  ScrollView.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

struct Scroll: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("tyemtee")
                .resizable()
                .scaledToFit()
                .padding()
                ForEach(0...100, id: \.self) {
                    CustomText("\($0)")
                        .font(.title)
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}

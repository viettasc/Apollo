//
//  ContentView.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var name: String
    var street: String
}

// Codable: Json decode
// Indentifiable: ForEach

struct ContentView: View {
    @State var address: String = ""
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var launch = false
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.launch {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing: Button("Launch") {
                self.launch.toggle()
            })
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//VStack {
//            Button("Decode JSON \(address)") {
//                let input = """
//                    {
//                        "name": "Tyemtee",
//                        "address": {
//                            "name": "Lomonoxop",
//                            "street": "Tran Van Can"
//                        }
//                    }
//                """
//                let data = Data(input.utf8)
//                let decoder = JSONDecoder()
//                if let user = try? decoder.decode(User.self, from: data) {
//                    print(user.address.street)
//                    self.address = user.address.street
//                }
////                self.address = "Phan Dinh Phung"
//            }
//            Text("address: \(address)")
//        }

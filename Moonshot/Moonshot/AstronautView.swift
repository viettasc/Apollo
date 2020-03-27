//
//  AstronautView.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions: [Mission] = []
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(self.astronaut.description)
                    .padding()
                    .layoutPriority(1)
                Spacer(minLength: 25)
                ForEach(self.missions, id: \.id) { item in
                    Text("Mission: \(item.displayName)")
                }
                Spacer(minLength: 25)
            }
        }
            // mission
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        .foregroundColor(Color.pink.opacity(0.6))
    }
    // looking for astronauts
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        var matches = [Mission]()
        for mission in missions {
            if mission.crew.first(where: {$0.name == astronaut.id}) != nil {
                matches.append(mission)
            }
        }
        self.missions = matches

    }
}

struct AstronautView_Previews: PreviewProvider {
    static var astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: [])
    }
}

//            for crew in mission.crew {
//                if crew.name == astronaut.id {
//                    matches.append(mission)
//                    break
//                }
//            }

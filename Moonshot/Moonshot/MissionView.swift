//
//  MissionView.swift
//  Moonshot
//
//  Created by Viettasc Doan on 3/27/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

// codeable unreach

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]
    @State var crew = false
    var body: some View {
        ScrollView {
            VStack {
                Image(self.mission.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                Text(self.mission.formattedLaunchDate)
                Text(self.mission.description)
                    .padding()
                Spacer(minLength: 25)
                if self.crew {
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: [])) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Capsule())
                                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .frame(height: 60)
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
        .navigationBarItems(trailing: Button("Crew") {
            self.crew.toggle()
        })
        .foregroundColor(Color.pink.opacity(0.6))
    }
    
    // looking for astronauts
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}

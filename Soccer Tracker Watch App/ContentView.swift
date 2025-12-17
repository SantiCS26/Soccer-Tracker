//
//  ContentView.swift
//  Soccer Tracker Watch App
//
//  Created by Santiago Rivera on 12/16/25.
//

import SwiftUI

enum Item: String, CaseIterable, Identifiable {
    case score = "Score"
    case teamA = "TeamA"
    case teamB = "TeamB"
    
    var id: String { self.rawValue }
    var title: String { self.rawValue }
}

struct ContentView: View {
    @State private var selected: Item = .score
    
    var body: some View {
        TabView(selection: $selected) {

            ScoreView()
                .tag(Item.score)
            
            TeamListView(teamName: "Team A", color: .red)
                .tag(Item.teamA)
            
            TeamListView(teamName: "Team B", color: .blue)
                .tag(Item.teamB)
        }
        .tabViewStyle(.verticalPage)
    }
}

struct ScoreView: View {
    var body: some View {
        VStack(spacing: 0) {

            VStack {
                Image(systemName: "figure.soccer")
                    .font(.title)
                Text("Team A: ")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
                .overlay(.white)
            
            VStack {
                Image(systemName: "figure.soccer")
                    .font(.title)
                Text("Team B: ")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .containerBackground(for: .tabView) {
            VStack(spacing: 0) {
                Rectangle().fill(.blue.gradient).ignoresSafeArea()
                Rectangle().fill(.red.gradient).ignoresSafeArea()
            }
        }
    }
}

struct TeamListView: View {
    let teamName: String
    let color: Color
    
    let players = ["Santiago", "Meet", "Dylan", "Daniel", "Egli"]
    
    var body: some View {
        List {
            Section(header: Text(teamName)) {
                ForEach(players, id: \.self) { player in
                    Text(player)
                }
            }
        }
        .containerBackground(color.gradient, for: .tabView)
    }
}

#Preview {
    ContentView()
}

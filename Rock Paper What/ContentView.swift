//
//  ContentView.swift
//  Rock Paper What
//
//  Created by Joel Groomer on 6/7/21.
//

import SwiftUI

struct ContentView: View {
    let choices = ["octagon", "doc", "scissors"]    // rock, paper, scissors
    @State private var turn = 0
    @State private var score = 0
    @State private var appChoice = Int.random(in: 0...2)
    @State private var objectiveWin = Bool.random()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\nIf I choose")
                Image(systemName: choices[appChoice])
                    .font(.largeTitle)
                    .padding()
                Text("and you want to \(objectiveWin ? "win" : "lose"),")
                Text("you'd choose...")
                HStack {
                ForEach(choices, id: \.self) { choice in
                        Button(action: {
                            userTapped(choice: choice, appChoice: appChoice)
                        }) {
                            Image(systemName: choice)
                        }
                        .font(.largeTitle)
                        .padding()
                    }
                }
                Text("Your score:")
                    .font(.title)
                Text("\(score) out of \(turn)")
                Spacer()
            }
            .font(.title)
            .navigationBarTitle(Text("Rock, Paper, ...What??"))
        }
    }
    
    func userTapped(choice: String, appChoice: Int) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

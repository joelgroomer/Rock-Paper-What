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
    @State private var showingAlert = false
    @State private var alertText = ""
    
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
                    ForEach(choices.indices) { i in
                        Button(action: {
                            userTapped(choice: i)
                        }) {
                            Image(systemName: choices[i])
                                .font(.largeTitle)
                                .frame(width: 60, height: 60, alignment: .center)
                                .padding()
                                .border(Color.secondary)
                                .padding()
                        }
                    }
                }
                Text("Your score:")
                    .font(.title)
                Text("\(score) out of \(turn)")
                Spacer()
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text(""), message: Text(alertText), dismissButton: .default(Text("OK")))
                    })
            }
            .font(.title)
            .navigationBarTitle(Text("Rock, Paper, ...What??"))
        }
    }
    
    func userTapped(choice: Int) {
        var won: Bool
        var lost: Bool
        
        switch appChoice - choice {
        case 0:
            won = false
            lost = false
        case 1, -2:
            won = false
            lost = true
        case -1, 2:
            won = true
            lost = false
        default:
            fatalError("Impossible outcome")
        }
        
        if won && objectiveWin || lost && !objectiveWin {
            score += 1
            alertText = "That's right!"
        } else {
            alertText = "No! You were trying to \(objectiveWin ? "win" : "lose")!"
        }
        
        showingAlert = true
        turn += 1
        appChoice = Int.random(in: 0...2)
        objectiveWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

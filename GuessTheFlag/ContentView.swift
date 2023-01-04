//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by vsay on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingEndGame = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var numberOfPlay = 0
    
    /// Reset the game
    ///
    /// Reset the parameters and call `askQuestion()` to generate a new question
    func reset() {
        showingScore = false
        showingEndGame = false
        scoreTitle = ""
        score = 0
        numberOfPlay = 0
        askQuestion()
    }
    
    /// Triggered when user tap on the flag
    ///
    /// Increase the score when user guess correct
    /// Increase number of play - user can guess 8 times per game
    ///
    /// - Parameters:
    ///    - number: correspond to the flag that tapped
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
        }

        numberOfPlay += 1
        if(numberOfPlay >= 8) {
            showingScore = false
            showingEndGame = true
        } else {
            showingScore = true
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .red, location: 0.2),
                .init(color: .blue, location: 0.2),
            ], center: .bottom, startRadius: 300, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                
                Spacer()
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                VStack (spacing: 15){
                    Text("Tap the flag of")
                        .titleStyle()
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold)) //Dynamic Type
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number]) //if we use countries var directly inside FlagImage it won't update the view.
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding()
            
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            
            .alert("Game Ended", isPresented: $showingEndGame) {
                Button("Restart", action: reset)
            } message: {
                Text("You final score is \(score)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

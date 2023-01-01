//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by vsay on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
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
                Text("Score: ???")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                VStack (spacing: 15){
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold)) //Dynamic Type
                    
                    ForEach(0..<3) { number in
                        Button {
                           flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original) // render the original image pixels rather than trying to recolor them as a button.
                                .clipShape(Capsule()) // ensures the corners of the shortest edges are fully rounded, while the longest edges remain straight
                                .shadow(radius: 5) // apply a shadow effect around each flag, making them really stand out from the background.
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
                Text("Your score is ???")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

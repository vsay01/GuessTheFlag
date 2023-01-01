//
//  Data.swift
//  GuessTheFlag
//
//  Created by vsay on 1/1/23.
//

import Foundation

var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled() // automatically takes care of randomizing the array order
var correctAnswer = Int.random(in: 0...2) // automatically picks a random number

func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
}

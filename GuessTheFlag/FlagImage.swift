//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by vsay on 1/4/23.
//

import SwiftUI

struct FlagImage: View {
    
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original) // render the original image pixels rather than trying to recolor them as a button.
            .clipShape(Capsule()) // ensures the corners of the shortest edges are fully rounded, while the longest edges remain straight
            .shadow(radius: 5) // apply a shadow effect around each flag, making them really stand out from the background.
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(country: "France")
    }
}

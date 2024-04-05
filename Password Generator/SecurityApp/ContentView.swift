//
//  ContentView.swift
//  SecurityApp
//
//  Created by Kareem Khalife on 3/21/24.
//

import SwiftUI

struct ContentView: View {
    // This state will hold the generated password and update the view when changed
    @State private var generatedPassword = ""
    
    var body: some View {
        VStack {
            HStack {
                Image("securityPic")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .aspectRatio(contentMode: .fit)
                Spacer() // Pushes the image to the left
            }
            .padding()
            .padding(.leading) // Add padding to the leading edge of the image
            .ignoresSafeArea(edges: .top) // Ignore safe area for the top edge to allow the image to move to the top

//Spacer() // This will push everything below it to the middle
            
            Text("Generate random password below")
                .padding()

// Display the generated password
            Text(generatedPassword)
                .padding()
                .border(Color.black, width: 2)
               

// Button to generate a new password
           Button("Generate Password")
            {
               
// Call the generatePassphrase function and store the result in the state variable
                generatedPassword = generatePassphrase()
                
            }
            //            .foregroundColor(.black)
            //            .padding()
            //            .background(Color(.gray))
            //            .clipShape(Capsule())
            
  //Style of the button
            .buttonStyle(.borderedProminent)
            
            Spacer() // This will push everything above it to the middle
        }
    }
    
    func generatePassphrase() -> String {
        let consonants = "bcdfghjklmnpqrstvwxyz"
        let vowels = "aeiou"
        let specialCharacters = ["@", "!"]
        let length = Int(arc4random_uniform(5) + 3) // Word length between 3 and 7
        
        var word = ""
        for i in 0..<length {
            word += String(Array(i % 2 == 0 ? consonants : vowels).randomElement()!)
        }
        
        // Append a random special character
        word += specialCharacters.randomElement()!
        
        // Append a three-digit random number
        let randomNumber = Int(arc4random_uniform(900) + 100)
        word += String(randomNumber)
        
        return word
    }

}

// Preview provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

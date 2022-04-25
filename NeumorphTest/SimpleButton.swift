//
//  SimpleButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct SimpleButton: View {
    @State var isPressed = false
    var action: () -> ()
    let title: String
    
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    
    var body: some View {
        Button(action: { self.isPressed.toggle() }) {
        Text("\(title)")
            .foregroundColor(blueColor)
            .fontWeight(.medium)
            .padding()
    }
    .scaledToFit()
    .buttonStyle(SimpleButtonStyle(isPressed: $isPressed))
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        SimpleButton(action: {}, title: "")
    }
}

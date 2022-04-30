//
//  ExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 17.04.2022.
//

import SwiftUI

struct ExerciseButton: View {
    @State var notTapped = true
    @Binding var title: String
    @Binding var image: String
    @State var test = ""
    @State var changeColorButton = true
    @State var setCount = 3
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    let redColor = Color(red: 142/255, green: 51/255, blue: 46/255)
    @State var backgroundHeight: CGFloat = 270
    
    var body: some View {
        if notTapped {
                NotPressedButtonView(
                    pressed: $notTapped,
                    changeColorButton: $changeColorButton,
                    image: image,
                    title: title
                )
            .buttonStyle(ExerciseButtonStyle())
        } else {
            PressedButtonView(
                backgroundHeight: $backgroundHeight,
                pressed: $notTapped,
                setCount: $setCount,
                test: $test,
                changeColorButton: $changeColorButton,
                image: image,
                title: title
            )
        }
    }
}

struct ExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseButton(title: .constant("Exercise for example"), image: .constant("legs"))
    }
}

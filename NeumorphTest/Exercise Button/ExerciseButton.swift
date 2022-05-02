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
    @State var changeColorButton = false
    @State var setCount = 3

    @State var backgroundHeight: CGFloat = 270
    @Binding var choosenExercises: [String]
    
    var body: some View {
        if notTapped {
                NotPressedButtonView(
                    pressed: $notTapped,
                    choosenExercises: $choosenExercises,
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
                choosenExercises: $choosenExercises,
                image: image,
                title: title
            )
        }
    }
}

struct ExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseButton(title: .constant("Exercise for example"), image: .constant("legs"), choosenExercises: .constant([]))
    }
}

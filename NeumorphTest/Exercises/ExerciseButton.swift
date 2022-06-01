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
    @State var changeColorButton = false
    @Binding var realmChoosenExerises: [RealmChoosenExercise]

    @State var sets: [Set] = [Set(id: 1, repeats: "", weight: ""),
                              Set(id: 2, repeats: "", weight: ""),
                              Set(id: 3, repeats: "", weight: "")]
    @State var note: String = "..."
    
    @State var backgroundHeight: CGFloat = 263
    
    var body: some View {
        if notTapped {
                NotPressedButtonView(
                    pressed: $notTapped,
                    changeColorButton: $changeColorButton,
                    sets: $sets, realmChoosenExerises: $realmChoosenExerises,
                    image: image,
                    title: title,
                    note: $note
                )
            .buttonStyle(ExerciseButtonStyle())
        } else {
            PressedButtonView(
                backgroundHeight: $backgroundHeight,
                pressed: $notTapped,
                changeCheckmarkColor: $changeColorButton,
                sets: $sets,
                realmChoosenExerises: $realmChoosenExerises,
                image: image,
                title: title,
                note: $note
            )
        }
    }
}

struct ExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseButton(
            title: .constant("Exercise for example"),
            image: .constant("legs"),
            realmChoosenExerises: .constant([]))
    }
}

//
//  PreviousExercises.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 31.05.2022.
//

import SwiftUI

struct PreviousExercises: View {
    @Binding var choosenExercises: [RealmChoosenExercise]
    
    var body: some View {

            ScrollView {
                ForEach($choosenExercises, id: \.id) {exercise in
                    PreviousExercisesButton(choosenExercise: exercise)
                }
                .padding()
        }
    }
}

struct PreviousExercises_Previews: PreviewProvider {
    static var previews: some View {
        PreviousExercises(choosenExercises: .constant([]))
    }
}

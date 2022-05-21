//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @Binding var choosenExercises: [RealmChoosenExercise]
    
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                ForEach($choosenExercises, id: \.id) {exercise in
                        ChoosenExerciseButton(choosenExercise: exercise)
                }
                .padding()
        }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(choosenExercises: .constant([]))
    }
}

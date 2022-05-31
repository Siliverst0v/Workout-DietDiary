//
//  PreviousExercises.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 31.05.2022.
//

import SwiftUI

struct PreviousExercises: View {
    @State var previousExercises: [PreviousExercise]
    
    var body: some View {

            ScrollView {
                ForEach(previousExercises, id: \.self) {exercise in
                    Text(exercise.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(.top)
                    PreviousExercisesButton(choosenExercise: exercise.previousExercise)
                }
                .padding()
        }
    }
}

struct PreviousExercises_Previews: PreviewProvider {
    static var previews: some View {
        PreviousExercises(previousExercises: [])
    }
}

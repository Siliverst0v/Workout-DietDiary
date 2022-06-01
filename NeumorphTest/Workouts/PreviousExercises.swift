//
//  PreviousExercises.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 31.05.2022.
//

import SwiftUI

struct PreviousExercises: View {
    @State var previousExercises: [RealmChoosenExercise]
    
    var body: some View {

            ScrollView {
                if !previousExercises.isEmpty {
                ForEach(previousExercises, id: \.self) {exercise in
                    Text(exercise.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(.top)
                    PreviousExercisesButton(choosenExercise: exercise)
                        }
                    } else {
                    Text("Тренировки с таким упражнением не найдены")
                        .foregroundColor(.customRed)
                        .font(.title)
                        .padding()
            }
        }
    }
}

struct PreviousExercises_Previews: PreviewProvider {
    static var previews: some View {
        PreviousExercises(previousExercises: [])
    }
}

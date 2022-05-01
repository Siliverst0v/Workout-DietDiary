//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ExercisesView: View {
    @Binding var exercises: [ExerciseGroup]
    
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exercises, id: \.id) {exerciseGroup in
                    TextField("", text: exerciseGroup.header)
                        .font(.title)
                        .foregroundColor(.customRed)
                        .disabled(true)
                        .padding()
                    ForEach(exerciseGroup.exercises, id: \.self) {exercise in
                        ExerciseButton(title: exercise, image: exerciseGroup.icon)
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(exercises: .constant(ExerciseGroup.getExercises()))
    }
}

//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @Binding var exerciseGroupNames: [String]
    @Binding var choosenExercises: [String]
        
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                ForEach($exerciseGroupNames, id: \.self) {exerciseGroup in

                    TextField("", text: exerciseGroup)
                        .font(.title)
                        .foregroundColor(.customRed)
                        .disabled(true)
                        .padding()
                    
                    ForEach($choosenExercises, id: \.self) {exercise in
                        ExerciseButton(
                            title: exercise,
                            image: exerciseGroup.icon,
                            choosenExercises: $choosenExercises)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        workouts.workouts.append(Workout(
                            date: date,
                            exerciseGroupNames: exerciseGroupsNames,
                            choosenExercises: choosenExercises))
                        workoutsIsActive = false
                    } label: {
                        Text("Готово")
                    }

                }
            }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView()
    }
}

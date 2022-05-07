//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @Binding var choosenExercises: [ChoosenExercise]
    @Binding var workoutsIsPresented: Bool
//    @State var detailWorkoutIsActive = false
    
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach($choosenExercises, id: \.id) {exercise in
                        ExerciseButton(
                            title: exercise.exercise,
                            image: exercise.icon,
                            choosenExercises: $choosenExercises)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                     print(choosenExercises)
                    } label: {
                        Text("Готово")
                    }

                }
            }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(choosenExercises: .constant([]), workoutsIsPresented: .constant(false))
    }
}

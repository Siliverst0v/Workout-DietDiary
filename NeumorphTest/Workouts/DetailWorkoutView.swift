//
//  DetailWorkoutView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct DetailWorkoutView: View {
    @Binding var workoutsIsPresented: Bool
    @EnvironmentObject var choosenExercises: ChoosenExercises
    
    var body: some View {

            ScrollView(.vertical, showsIndicators: false) {
                    
                ForEach($choosenExercises.exercises, id: \.id) {exercise in
                    ChoosenExerciseButton(title: exercise.exercise, image: exercise.icon)
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                    } label: {
                        Text("Готово")
                    }

                }
            }
    }
}

struct DetailWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        DetailWorkoutView(workoutsIsPresented: .constant(false))
            .environmentObject(ChoosenExercises.init(choosenExercises: []))
    }
}

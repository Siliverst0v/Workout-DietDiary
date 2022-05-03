//
//  Workouts.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.05.2022.
//

import SwiftUI

struct WorkoutsView: View {
    @State var workouts: [Workout]
    @Environment(\.dismiss) var dismiss
//    @Binding var isNavigationBarHidden: Bool

    var body: some View {
        ScrollView(showsIndicators: false) {
        ForEach(workouts, id: \.id) {workout in
            WorkoutButton(workout: workout)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("+") {
                    ChooseExercisesView()
                }
                .onTapGesture {
                    dismiss.callAsFunction()
                }
               
        }
    }
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView(workouts: Workout.getWorkout())
    }
}

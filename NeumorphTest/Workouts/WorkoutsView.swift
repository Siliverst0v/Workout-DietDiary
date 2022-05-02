//
//  Workouts.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.05.2022.
//

import SwiftUI

struct Workouts: View {
    @State var workouts: [Workout]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
        ForEach(workouts, id: \.id) {workout in
            WorkoutButton(workout: workout)
            }
        .padding()
        }
        .navigationBarHidden(true)
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        Workouts(workouts: Workout.getWorkout())
    }
}

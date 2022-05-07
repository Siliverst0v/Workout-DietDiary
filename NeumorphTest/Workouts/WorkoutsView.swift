//
//  Workouts.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.05.2022.
//

import SwiftUI

struct WorkoutsView: View {
    @EnvironmentObject var workouts: Workouts
    @State var workoutsIsActive = false
    @State var workoutsIsPresented = false
    @State var choosenExercises: [ChoosenExercise] = []
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(workouts.workouts, id: \.id) {workout in
                    WorkoutButton(workout: workout, workoutsIsPresented: $workoutsIsActive)
                }
                .padding()
                .background(
                    NavigationLink("", isActive: $workoutsIsPresented) {
                        DetailWorkoutView(choosenExercises: $choosenExercises, workoutsIsPresented: $workoutsIsPresented)
                    }
                    .isDetailLink(false)
                    )
                }
            .background(
                NavigationLink("", isActive: $workoutsIsActive) {
                    ChooseExercisesView(workoutsIsActive: $workoutsIsActive)
                }
                .isDetailLink(false)
            )
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            workoutsIsActive = true
                        } label: {
                            Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(Workouts.init(workouts: []))
    }
}

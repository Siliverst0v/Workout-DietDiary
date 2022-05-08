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
    @State private var selection: String? = nil
    @State var choosenExercises: [ChoosenExercise] = []

        
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(workouts.workouts, id: \.id) {workout in
                    WorkoutButton(
                        workout: workout,
                        input: $choosenExercises,
                        output: workout.choosenExercises)
                    
                }
                .simultaneousGesture(TapGesture().onEnded{
                    self.selection = "DetailWorkoutView"
                })
                .padding()
                }
                .background(
                Group {
                    NavigationLink("", tag: workoutsIsActive ? "ChooseExerciseView" : "", selection: $selection) {
                        ChooseExercisesView(workoutsIsActive: $workoutsIsActive)
                    }
                    NavigationLink("", tag: "DetailWorkoutView", selection: $selection) {
                        DetailWorkoutView(choosenExercises: $choosenExercises)
                    }
                }
            )
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            workoutsIsActive = true
                            self.selection = "ChooseExerciseView"
                        } label: {
                            Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(Workouts.init(workouts: []))
    }
}

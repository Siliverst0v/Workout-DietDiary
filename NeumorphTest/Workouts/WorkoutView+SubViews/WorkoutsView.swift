//
//  Workouts.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.05.2022.
//

import SwiftUI
import RealmSwift

struct WorkoutsView: View {
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    @StateObject var realmManager = RealmManager()
    
    @ObservedResults(Workout.self) var workouts
    @State var workoutsIsActive = false
    @State var selection: String? = nil
    @State var workoutSelection: ObjectId? = ObjectId()
        
    var body: some View {
        NavigationView {
                ScrollView {
                    ForEach(workouts.sorted(byKeyPath: "date"), id: \.id) {workout in
                            NavigationLink(tag: workout.id, selection: $workoutSelection) {
                                
                                DetailWorkoutView(workout: workout)
                                    .environmentObject(realmManager)
                            } label: {
                    
                                WorkoutButtonView(
                                    workout: workout,
                                    workoutSelection: $workoutSelection)
                                .environmentObject(realmManager)
                            }
                    }
                }
                .navigationTitle("Дневник тренировок")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            workoutsIsActive = true
                            self.selection = "ChooseExerciseView"
                            
                        } label: {
                            Image(systemName: "plus.circle")
                            NavigationLink("",
                                           tag: workoutsIsActive ? "ChooseExerciseView" : "",
                                           selection: $selection) {
                                ChooseExercisesView(workoutsIsActive: $workoutsIsActive)
                                    .environmentObject(realmManager)
                            }
                    }
                }
            }
        }
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(RealmManager())
    }
}

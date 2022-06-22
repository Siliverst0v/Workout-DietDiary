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
                List {
                    ForEach(workouts.sorted(byKeyPath: "date"), id: \.id) {workout in
                            NavigationLink(tag: workout.id, selection: $workoutSelection) {
                                
                                DetailWorkoutView(workout: workout)
                            } label: {
                    
                                WorkoutButtonView(
                                    workout: workout,
                                    workoutSelection: $workoutSelection)
                                .environmentObject(realmManager)
                                .listRowSeparator(.hidden)
                            }
                    }
                    .onDelete(perform: delete)
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Дневник тренировок")
                .listStyle(.plain)
                .background(
                    NavigationLink("",
                                   tag: workoutsIsActive ? "ChooseExerciseView" : "",
                                   selection: $selection) {
                        ChooseExercisesView(workoutsIsActive: $workoutsIsActive)
                            .environmentObject(realmManager)
                    }
                )
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button {
                            workoutsIsActive = true
                            self.selection = "ChooseExerciseView"
                        } label: {
                            Image(systemName: "plus.circle")
                    }
                }
            }
        }
    }
}

extension WorkoutsView {
    private func delete(at offsets: IndexSet) {

        $workouts.remove(atOffsets: offsets)
        
    }
    
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(RealmManager())
    }
}

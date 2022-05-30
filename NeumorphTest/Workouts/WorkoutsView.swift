//
//  Workouts.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 03.05.2022.
//

import SwiftUI
import RealmSwift

struct WorkoutsView: View {
    @StateObject var realmManager = RealmManager()
    @State private var workouts: [RealmWorkout] = []
    @State var choosenExercises: [RealmChoosenExercise] = []
    @State var workoutsIsActive = false
    @State var selection: String? = nil
    @State var showingAlert: Bool = false

        
    var body: some View {
        NavigationView {
                List {
                    ForEach(workouts, id: \.id) {workout in
                    WorkoutButton(
                        workout: workout,
                        output: $choosenExercises)
                    .environmentObject(realmManager)
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: delete)
                .simultaneousGesture(TapGesture().onEnded({ _ in
                    self.selection = "DetailWorkoutView"
                }))
                }
                .listStyle(.plain)
                .onAppear(perform: fetchWorkouts)
                .background(
                Group {
                    NavigationLink("", tag: workoutsIsActive ? "ChooseExerciseView" : "", selection: $selection) {
                        ChooseExercisesView(workoutsIsActive: $workoutsIsActive)
                    }
                    NavigationLink("", tag: "DetailWorkoutView", selection: $selection) {
                        DetailWorkoutView(choosenExercises: $choosenExercises)
                            .environmentObject(realmManager)
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

extension WorkoutsView {
    private func delete(at offsets: IndexSet) {
        workouts.remove(atOffsets: offsets)
        let result = realmManager.workouts.filter { !workouts.contains($0) }
        result.forEach { workout in
        workout.choosenExercises.forEach { exercise in
            exercise.sets.forEach { sett in
                realmManager.delete(set: sett)
            }
            realmManager.deleteChoosenExercise(id: exercise.id)
        }
        realmManager.deleteWorkout(
            id: workout.id)
        }
    }
    
    private func fetchWorkouts() {
        realmManager.getWorkouts()
        let result = realmManager.workouts.filter { !workouts.contains($0) }
        result.forEach { workout in
            workouts.append(workout)
        }
        workouts.sort(by: {$0.date.compare($1.date) == .orderedAscending})
    }
}

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(RealmManager())
    }
}

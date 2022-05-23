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
    @State var workoutsIsActive = false
    @State private var selection: String? = nil
    @State var choosenExercises: [RealmChoosenExercise] = []
    @State var showingAlert: Bool = false

        
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(realmManager.workouts, id: \.id) {workout in
                    WorkoutButton(
                        workout: workout,
                        input: $choosenExercises)
                    .environmentObject(realmManager)
                    .simultaneousGesture(LongPressGesture().onEnded { _ in
                        showingAlert = true
                    })
                    .alert(isPresented: $showingAlert) { () -> Alert in
                    Alert(
                        title: Text("Выберите действие"),
                        message: Text(""),
                        primaryButton: .default(Text("Редактировать"), action: {
                                }),
                        secondaryButton: .default(Text("Удалить"), action: {
                            deleteWorkout(workout: workout)
                            realmManager.getWorkouts()
                                }))
                        }
                }
                .simultaneousGesture(TapGesture().onEnded{
                    self.selection = "DetailWorkoutView"
                })
                .padding()
                }
            .onAppear(perform: realmManager.getWorkouts)
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
    
    func delete(at index: Int) {
            let deletes = saving[index]
            self.moc.delete(deletes)
        try! self.moc.save()
    }
}

extension WorkoutsView {
    private func deleteWorkout(workout: RealmWorkout) {
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

struct Workouts_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
            .environmentObject(RealmManager())
    }
}

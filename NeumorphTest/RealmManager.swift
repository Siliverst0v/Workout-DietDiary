//
//  RealmManager.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 16.05.2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var workouts: [RealmWorkout] = []
    @Published private(set) var choosenExercises: [RealmChoosenExercise] = []
    
    init() {
        openRealm()
        getWorkouts()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            getWorkouts()
            
        } catch {
            print(error)
        }
    }
    
    func addWorkout(date: Date, exerciseGroups: List<String>, choosenExercises: List<RealmChoosenExercise>) {
        if let localRealm = localRealm {
            
        do {
            try localRealm.write {
                let newWorkout = RealmWorkout(value: ["date" : date, "exerciseGroups": exerciseGroups, "choosenExercises": choosenExercises ])
                localRealm.add(newWorkout)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func getWorkouts() {
        if let localRealm = localRealm {
            let allWorkouts = localRealm.objects(RealmWorkout.self).sorted(byKeyPath: "date")
            workouts = []
            allWorkouts.forEach { workout in
                workouts.append(workout)
            }
        }
    }
    
    func updateWorkout(id: ObjectId, date: Date, exerciseGroups: List<String>) {
        if let localRealm = localRealm {
            do {
                let workoutToUpdate = localRealm.objects(RealmWorkout.self).filter(NSPredicate(format: "id == %@", id))
                guard !workoutToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    workoutToUpdate[0].date = date
                    workoutToUpdate[0].exerciseGroups = exerciseGroups
                    getWorkouts()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteWorkout(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let workoutToDelete = localRealm.objects(RealmWorkout.self).filter(NSPredicate(format: "id == %@", id))
                guard !workoutToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(workoutToDelete)
                    getWorkouts()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func getChoosenExercises() {
        if let localRealm = localRealm {
            let allChoosenExercises = localRealm.objects(RealmChoosenExercise.self).sorted(byKeyPath: "icon")
            choosenExercises = []
            allChoosenExercises.forEach { exercise in
                choosenExercises.append(exercise)
            }
        }
    }
    
    func addChoosenExercise(icon: String, title: String, sets: List<RealmSet>) {
        if let localRealm = localRealm {

        do {
            try localRealm.write {
                let newChoosenExercise = RealmChoosenExercise(value: ["icon" : icon, "title": title, "sets": sets])
                localRealm.add(newChoosenExercise)
                print(newChoosenExercise)
                }
            } catch {
                print(error)
            }
        }
    }
//
//    func addSet(id: Int, repeats: String, weight: String) {
//        if let localRealm = localRealm {
//
//        do {
//            try localRealm.write {
//                let newSet = RealmSet(value: ["id" : id, "repeats": repeats, "weight": weight])
//                localRealm.add(newSet)
//                print(newSet)
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }
}

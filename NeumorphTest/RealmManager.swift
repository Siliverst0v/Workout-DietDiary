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
    
}

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
    @Published private(set) var workouts = RealmSwift.List<RealmWorkout>()
    @Published private(set) var choosenExercises = RealmSwift.List<RealmChoosenExercise>()
    @Published private(set) var sets = RealmSwift.List<RealmSet>()

    
    init() {
        openRealm()
        getWorkouts()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 4) { migration, oldSchemaVersion in

            }
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
            workouts.removeAll()
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
            choosenExercises.removeAll()
            allChoosenExercises.forEach { exercise in
                choosenExercises.append(exercise)
            }
        }
    }
    
    func addChoosenExercise(icon: String, title: String, note: String, date: Date, sets: List<RealmSet>) {
        if let localRealm = localRealm {

        do {
            try localRealm.write {
                let newChoosenExercise = RealmChoosenExercise(value: ["icon" : icon, "title": title, "note": note, "date": date, "sets": sets])
                localRealm.add(newChoosenExercise)
                print(newChoosenExercise)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func updateChoosenExercise(id: ObjectId, sets: [RealmSet]) {
        if let localRealm = localRealm {
            do {
                let exerciseToUpdate = localRealm.objects(RealmChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !exerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    sets.forEach { newSet in
                        exerciseToUpdate[0].sets.append(newSet)
                    }
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteChoosenExercise(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let choosenExerciseToDelete = localRealm.objects(RealmChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !choosenExerciseToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(choosenExerciseToDelete)
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func getSets() {
        if let localRealm = localRealm {
            let allSets = localRealm.objects(RealmSet.self).sorted(byKeyPath: "id")
            sets.removeAll()
            allSets.forEach { sett in
                sets.append(sett)
            }
        }
    }
    
    
    func addSet(id: ObjectId, choosenExercise: RealmChoosenExercise) {
        if let localRealm = localRealm {
            do {
                let choosenExerciseToUpdate = localRealm.objects(RealmChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !choosenExerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    choosenExercise.sets.append(RealmSet(id: choosenExercise.sets.count + 1, repeats: "", weight: ""))
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteSet(id: ObjectId, choosenExercise: RealmChoosenExercise) {
        if let localRealm = localRealm {
            do {
                let choosenExerciseToUpdate = localRealm.objects(RealmChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !choosenExerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func delete(set: RealmSet) {
        if let localRealm = localRealm {
            do {

                try localRealm.write {
                    localRealm.delete(set)
                    getSets()
                }
            } catch  {
                print(error)
            }
        }
    }
}

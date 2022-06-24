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
    @Published private(set) var workouts = RealmSwift.List<Workout>()
    @Published private(set) var choosenExercises = RealmSwift.List<ChoosenExercise>()
    @Published private(set) var sets = RealmSwift.List<Set>()
    @Published private(set) var foods = RealmSwift.List<Food>()
    
    init() {
        openRealm()
        getWorkouts()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 10) { migration, oldSchemaVersion in

            }
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
            getWorkouts()
            
        } catch {
            print(error)
        }
    }
    
    //MARK: - Workout
    
    func getWorkouts() {
        if let localRealm = localRealm {
            let allWorkouts = localRealm.objects(Workout.self).sorted(byKeyPath: "date")
            workouts.removeAll()
            allWorkouts.forEach { workout in
                workouts.append(workout)
            }
        }
    }
    
    func addWorkout(date: Date, exerciseGroups: [String], choosenExercises: [ChoosenExercise]) {
        if let localRealm = localRealm {
            
        do {
            try localRealm.write {
                let newWorkout = Workout(value: ["date" : date, "exerciseGroups": exerciseGroups, "choosenExercises": choosenExercises ])
                localRealm.add(newWorkout)
                }
            } catch {
                print(error)
            }
        }
    }
    
    
    func updateWorkout(id: ObjectId, date: Date, exerciseGroups: List<String>) {
        if let localRealm = localRealm {
            do {
                let workoutToUpdate = localRealm.objects(Workout.self).filter(NSPredicate(format: "id == %@", id))
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
                let workoutToDelete = localRealm.objects(Workout.self).filter(NSPredicate(format: "id == %@", id))
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
    
    //MARK: - ChoosenExercise
    func getChoosenExercises() {
        if let localRealm = localRealm {
            let allChoosenExercises = localRealm.objects(ChoosenExercise.self).sorted(byKeyPath: "icon")
            choosenExercises.removeAll()
            allChoosenExercises.forEach { exercise in
                choosenExercises.append(exercise)
            }
        }
    }
    
    func addChoosenExercise(icon: String, title: String, note: String, date: Date, sets: List<Set>) {
        if let localRealm = localRealm {

        do {
            try localRealm.write {
                let newChoosenExercise = ChoosenExercise(value: ["icon" : icon, "title": title, "note": note, "date": date, "sets": sets])
                localRealm.add(newChoosenExercise)
                print(newChoosenExercise)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func deleteChoosenExercise(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let choosenExerciseToDelete = localRealm.objects(ChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
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
    
    //MARK: - Sets
    func getSets() {
        if let localRealm = localRealm {
            let allSets = localRealm.objects(Set.self).sorted(byKeyPath: "id")
            sets.removeAll()
            allSets.forEach { sett in
                sets.append(sett)
            }
        }
    }
    
    
    func addSet(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let choosenExerciseToUpdate = localRealm.objects(ChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !choosenExerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    let set = Set(id: choosenExerciseToUpdate[0].sets.count + 1, repeats: "", weight: "")
                    localRealm.add(set)
                    choosenExerciseToUpdate[0].sets.append(set)
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteLastSet(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let exerciseToUpdate = localRealm.objects(ChoosenExercise.self).filter(NSPredicate(format: "id == %@", id))
                guard !exerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    guard let setToDelete = exerciseToUpdate[0].sets.last else {return}
                    localRealm.delete(setToDelete)
                    
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteAllSets(choosenExerciseId: ObjectId) {
        if let localRealm = localRealm {
            do {
                let exerciseToUpdate = localRealm.objects(ChoosenExercise.self).filter(NSPredicate(format: "id == %@", choosenExerciseId))
                guard !exerciseToUpdate.isEmpty else {return}
                
                try localRealm.write {
//                    guard let setToDelete = exerciseToUpdate[0].sets.last else {return}
                    exerciseToUpdate[0].sets.forEach { setToDelete in
                        
                        localRealm.delete(setToDelete)
                    }
                    
                    getChoosenExercises()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func deleteSet(set: Set) {
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
    
    //MARK: - Food
    
    func getFoods() {
        if let localRealm = localRealm {
            let allFood = localRealm.objects(Food.self).sorted(byKeyPath: "date")
            foods.removeAll()
            allFood.forEach { food in
                foods.append(food)
            }
        }
    }
    
    func addFood(name: String, calories: Double) {
        if let localRealm = localRealm {
            
        do {
            try localRealm.write {
                let newFood = Food(value: ["name" : name, "calories": calories ])
                localRealm.add(newFood)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func deleteFood(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let foodToDelete = localRealm.objects(Food.self).filter(NSPredicate(format: "id == %@", id))
                guard !foodToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(foodToDelete)
                    getFoods()
                }
            } catch  {
                print(error)
            }
        }
    }
    
    func editFood(id: ObjectId, name: String, calories: Double) {
        if let localRealm = localRealm {
            do {
                let foodToUpdate = localRealm.objects(Food.self).filter(NSPredicate(format: "id == %@", id))
                guard !foodToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    foodToUpdate[0].name = name
                    foodToUpdate[0].calories = calories
                    getFoods()
                }
            } catch  {
                print(error)
            }
        }
    }
}




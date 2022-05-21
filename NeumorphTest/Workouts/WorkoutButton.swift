//
//  WorkoutsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import SwiftUI

struct WorkoutButton: View {
    @State var workout: RealmWorkout
    @Binding var input: [RealmChoosenExercise]
    
    var body: some View {
        Button(action: { replaceChoosenExercises() }) {
            HStack {
                VStack{
                    Text(workout.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(5)
                    ForEach(workout.exerciseGroups, id: \.self) { exerciseGroupName in
                    Text(exerciseGroupName)
                        .foregroundColor(.customBlue)
                        .font(.headline)
                        .padding(5)
                    }
                }
                .padding()
                ZStack {
                    Image("Body")
                        .resizable()
                    Image("BackBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Спина") ? 1 : 0)
                    Image("ChestBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Грудь") ? 1 : 0)
                    Image("BicepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Бицепс") ? 1 : 0)
                    Image("TricepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Трицепс") ? 1 : 0)
                    Image("AbsBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Пресс") ? 1 : 0)
                    Image("ForeArmsBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Предплечья") ? 1 : 0)
                    Image("LegsBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Ноги") ? 1 : 0)
                    Image("ShouldersBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Плечи") ? 1 : 0)
                    Image("CardioBody")
                        .resizable()
                        .opacity(workout.exerciseGroups.contains("Кардио") ? 1 : 0)
                }
                .frame(height: 160)
                .padding()
            }
        }
        .scaledToFit()
        .buttonStyle(WorkoutButtonStyle())
    }
    
    func replaceChoosenExercises() {
        input = []
        workout.choosenExercises.forEach { exercise in
            input.append(exercise)
        }
        
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutButton(
            workout: RealmWorkout(), input: .constant([])
        )
    }
}

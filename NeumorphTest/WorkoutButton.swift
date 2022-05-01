//
//  WorkoutsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import SwiftUI

struct WorkoutButton: View {
    let workout: Workout
    
    var body: some View {
        Button(action: {}) {
            HStack {
                VStack{
                    Text(workout.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(5)
                    ForEach(workout.exerciseGroupName, id: \.self) { muscleGroups in
                    Text(muscleGroups)
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
                        .opacity(workout.exerciseGroupName.contains("Спина") ? 1 : 0)
                    Image("ChestBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Грудь") ? 1 : 0)
                    Image("BicepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Бицепс") ? 1 : 0)
                    Image("TricepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Трицепс") ? 1 : 0)
                    Image("AbsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Пресс") ? 1 : 0)
                    Image("ForeArmsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Предплечья") ? 1 : 0)
                    Image("LegsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Ноги") ? 1 : 0)
                    Image("ShouldersBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Плечи") ? 1 : 0)
                    Image("CardioBody")
                        .resizable()
                        .opacity(workout.exerciseGroupName.contains("Кардио") ? 1 : 0)
                }
                .frame(height: 160)
                .padding()
            }
        }
        .scaledToFit()
        .buttonStyle(WorkoutButtonStyle())
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutButton(workout: Workout.getWorkout())
    }
}

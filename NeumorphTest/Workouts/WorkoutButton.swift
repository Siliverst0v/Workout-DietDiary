//
//  WorkoutsView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 01.05.2022.
//

import SwiftUI

struct WorkoutButton: View {
    let workout: Workout
    @Binding var workoutIsActive: Bool
    
    var body: some View {
        Button(action: { workoutIsActive = true }) {
            HStack {
                VStack{
                    Text(workout.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(5)
                    ForEach(workout.exerciseGroupNames, id: \.self) { exerciseGroupName in
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
                        .opacity(workout.exerciseGroupNames.contains("Спина") ? 1 : 0)
                    Image("ChestBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Грудь") ? 1 : 0)
                    Image("BicepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Бицепс") ? 1 : 0)
                    Image("TricepsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Трицепс") ? 1 : 0)
                    Image("AbsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Пресс") ? 1 : 0)
                    Image("ForeArmsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Предплечья") ? 1 : 0)
                    Image("LegsBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Ноги") ? 1 : 0)
                    Image("ShouldersBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Плечи") ? 1 : 0)
                    Image("CardioBody")
                        .resizable()
                        .opacity(workout.exerciseGroupNames.contains("Кардио") ? 1 : 0)
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
        WorkoutButton(workout: Workout(date: Date(), exerciseGroupNames: []), workoutIsActive: .constant(false))
    }
}

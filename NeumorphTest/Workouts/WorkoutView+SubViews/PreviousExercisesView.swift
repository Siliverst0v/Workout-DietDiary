//
//  PreviousExercises.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 31.05.2022.
//

import SwiftUI

struct PreviousExercisesView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var previousExercises: [ChoosenExercise]
    
    var body: some View {
        if !previousExercises.isEmpty {
            ScrollView {
                ForEach(previousExercises, id: \.self) {exercise in
                    Text(exercise.date, style: .date)
                        .environment(\.locale, Locale.init(identifier: "ru"))
                        .foregroundColor(.customRed)
                        .font(.headline)
                        .padding(5)
                        .background(
                            RoundedRectangle(cornerRadius: 11)
                                .fill(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 0.1)
                                )
                        )
                        .padding(.top)
                    PreviousExercisesButton(choosenExercise: exercise)
                        }
                    }
            .padding()
        }
        else {
            VStack {
                Spacer()
                Text("Тренировки с таким упражнением не найдены")
                .multilineTextAlignment(.center)
                .foregroundColor(.customRed)
                .font(.title)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 11)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.2),
                                radius: 10, x: 5, y: 5)
                        .shadow(color: .white.opacity(0.7),
                                radius: 10, x: -5, y: -5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 11)
                                .stroke(Color.gray, lineWidth: 0.1)
                        )
                )
                Spacer()
                Button { dismiss() } label: {
                    Text("Назад")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 11)
                                .fill(.white)
                                .shadow(color: .black.opacity(0.2),
                                        radius: 10, x: 5, y: 5)
                                .shadow(color: .white.opacity(0.7),
                                        radius: 10, x: -5, y: -5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 0.1)
                                )
                        )
                }
                Spacer()
            }
        }
    }
}

struct PreviousExercises_Previews: PreviewProvider {
    static var previews: some View {
        PreviousExercisesView(previousExercises: [Exercises.shared.getMocExercise()])
    }
}

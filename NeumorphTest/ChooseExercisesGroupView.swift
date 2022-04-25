//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesGroupView: View {
    var body: some View {
        VStack {
            ForEach(Exercises.shared.exerciseGroups, id: \.self) { group in
            Button(action: {}) {
                Text("\(group)")
            }
            .scaledToFit()
            .background(
                RoundedRectangle(cornerRadius: 11)
                .fill(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
                .overlay(
                    RoundedRectangle(cornerRadius: 11)
                        .stroke(Color.gray, lineWidth: 0.1)
                )
        )
            }
            Image("Body")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
                .offset(y: 160)
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesGroupView()
    }
}

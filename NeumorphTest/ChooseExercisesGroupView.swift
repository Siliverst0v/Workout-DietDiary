//
//  ChooseExercisesGroupView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI

struct ChooseExercisesGroupView: View {
    let columns = [GridItem(.adaptive(minimum: 130))]
    let blueColor = Color(red: 46/255, green: 74/255, blue: 142/255)
    @State var pressed = false
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 30) {
            ForEach(Exercises.shared.exerciseGroups, id: \.self) { group in
                Button(action: { pressed.toggle() }) {
                Text("\(group)")
                    .foregroundColor(blueColor)
                    .fontWeight(.medium)
                    .padding()
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
            }
            Image("Body")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
                .padding(50)
        }
    }
}

struct ChooseExercisesGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseExercisesGroupView()
    }
}

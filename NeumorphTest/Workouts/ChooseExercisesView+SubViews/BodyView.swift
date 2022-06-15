//
//  BodyView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.05.2022.
//

import SwiftUI

struct BodyView: View {
    @Binding var exercisesToDisplay: [ExerciseGroup]
    
    var body: some View {
        ZStack {
            Image("Body")
                .resizable()
            Image("BackBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Спина") ? 1 : 0)
            Image("ChestBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Грудь") ? 1 : 0)
            Image("BicepsBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Бицепс") ? 1 : 0)
            Image("TricepsBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Трицепс") ? 1 : 0)
            Image("AbsBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Пресс") ? 1 : 0)
            Image("ForeArmsBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Предплечья") ? 1 : 0)
            Image("LegsBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Ноги") ? 1 : 0)
            Image("ShouldersBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Плечи") ? 1 : 0)
            Image("CardioBody")
                .resizable()
                .opacity(showIcons(muscleGroupName: "Кардио") ? 1 : 0)
        }
        .frame(width: UIScreen.main.bounds.size.width - 40, height: 314, alignment: .center)
        .padding(30)
    }
}

extension BodyView {
    
    func showIcons(muscleGroupName: String) -> Bool {
        if exercisesToDisplay.filter({$0.title == muscleGroupName}).first != nil {
            return true
        }
        return false
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(exercisesToDisplay: .constant([
                ExerciseGroup(
                    date: Date(),
                    title: "Кардио",
                    icon: "cardio",
                    exercisesToDisplay: Exercises.shared.cardio)])
        )
    }
}

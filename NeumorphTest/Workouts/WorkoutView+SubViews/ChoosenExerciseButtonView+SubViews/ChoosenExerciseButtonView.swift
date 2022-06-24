//
//  ChoosenExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 08.05.2022.
//

import SwiftUI
import RealmSwift

struct ChoosenExerciseButtonView: View {
    @EnvironmentObject var realmManager: RealmManager
    @FocusState var isFocused: Bool?
    
    @State private var showingSheet = false
    @State private var buttonIsNotPressed = true
    @State private var backgroundHeight: CGFloat = 263
    @State var previousExercises: [ChoosenExercise] = []
    
    @ObservedRealmObject var choosenExercise: ChoosenExercise
    
    var deleteAction: () -> Void
    
    @State var showConfirm: Bool = false
    
    var body: some View {
        if buttonIsNotPressed {
            NotPressedChoosenExerciseButtonView(
                buttonIsNotPressed: $buttonIsNotPressed,
                icon: choosenExercise.icon,
                title: choosenExercise.title,
                action: self.deleteAction,
                showConfirm: $showConfirm)
        } else {
            ZStack {
                Image("TappedCell")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width - 40,
                           height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 46)))
                GeometryReader { geometry in
                    let width = geometry.size.width
                    HStack {
                        Image(choosenExercise.icon)
                            .resizable()
                            .frame(width: 70, height: 40)
                        Text(choosenExercise.title)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .foregroundColor(.customBlue)
                            .lineLimit(3)
                            .frame(width: width - 130,
                                   height: 60,
                                   alignment: .leading)
                            .padding(.leading)
                    }
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                    ChoosenSetsView(choosenExercise: choosenExercise,
                                  buttonIsNotPressed: $buttonIsNotPressed,
                                  width: width)
                    Button(action: { self.fetchPreviousExercises() }) {
                        Image(systemName: "memories")
                            .padding(.trailing, 1)
                            .frame(width: 30,
                                   height: changeMemoryButtonSize(),
                                   alignment: .center )
                            .font(.system(size: 17))
                            .foregroundColor(.customBlue)
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
                    .sheet(isPresented: $showingSheet, content: {
                        PreviousExercisesView(previousExercises: previousExercises)
                    })
                    .offset(x: width - 40, y: changeMemoryButtonPosition())
                }
                .frame(width: UIScreen.main.bounds.size.width - 40,
                       height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 46)))
            }
        }
    }
}

extension ChoosenExerciseButtonView {
    
    private func fetchPreviousExercises() {
        realmManager.getChoosenExercises()
        let title = choosenExercise.title
        previousExercises = []
        let result = realmManager.choosenExercises.sorted(by: {$0.date.compare($1.date) == .orderedDescending})
        result.forEach { exercise in
            if exercise.title == title && exercise.id != choosenExercise.id {
                previousExercises.append(exercise)
            }
        }
        showingSheet.toggle()
    }
    
    private func changeMemoryButtonSize() -> CGFloat {
        var buttonSize: CGFloat = 127
        if choosenExercise.sets.count < 3 && choosenExercise.sets.count > 1 {
            buttonSize = 83
        } else if choosenExercise.sets.count == 1 {
            buttonSize = 44
        }
        return buttonSize
    }
    
    private func changeMemoryButtonPosition() -> CGFloat {
        var buttonPosition: CGFloat = backgroundHeight * 0.32
        if choosenExercise.sets.count < 3 && choosenExercise.sets.count > 1 {
            buttonPosition = backgroundHeight * 0.32
        } else if choosenExercise.sets.count == 1 {
            buttonPosition = backgroundHeight * 0.30
        }
        return buttonPosition
    }
}



struct ChoosenExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenExerciseButtonView(
            choosenExercise: Exercises.shared.getMocExercise(),
            deleteAction: {})
        .environmentObject(RealmManager())
    }
}


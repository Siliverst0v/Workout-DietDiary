//
//  PressedButtonView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 25.04.2022.
//

import SwiftUI
import RealmSwift

struct PressedButtonView: View {
    @EnvironmentObject var realmManager: RealmManager

    @State private var showingSheet = false
    @State var previousExercises: [ChoosenExercise] = []
    
    @Binding var backgroundHeight: CGFloat
    @Binding var buttonNotPressed: Bool
    @Binding var exerciseAdded: Bool
    @Binding var sets: [MocSet]
    @Binding var choosenExercises: [ChoosenExercise]
    @Binding var date: Date
    
    @Binding var image: String
    @Binding var title: String
    @Binding var note: String
    
    var body: some View {
        ZStack {
        Image("TappedCell")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight + CGFloat(((sets.count - 1) * 46)))
            GeometryReader { geometry in
                let width = geometry.size.width
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 40)
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                        .foregroundColor(.customBlue)
                        .lineLimit(3)
                        .frame(width: width - 160, height: 60, alignment: .leading)
                        .padding(.leading)
                    }
                    .padding(.init(top: 5, leading: 16, bottom: 0, trailing: 0))
                SetsView(sets: $sets,
                              note: $note,
                              buttonNotPressed: $buttonNotPressed,
                              width: width)
                Button(action: { self.fetchPreviousExercises() }) {
                        Image(systemName: "memories")
                        .padding(.trailing, 1)
                        .frame(width: 30, height: changeMemoryButtonSize(), alignment: .center )
                        .font(.system(size: 17))
                        .foregroundColor(.customBlue)
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
                .sheet(isPresented: $showingSheet, content: {
                    PreviousExercisesView(previousExercises: previousExercises)
                })
                .offset(x: width - 40, y: changeMemoryButtonPosition())
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight + CGFloat(((sets.count - 1) * 46)))
        }
    }
}

extension PressedButtonView {
    
    private func fetchPreviousExercises() {
        realmManager.getChoosenExercises()
        previousExercises = []
        let result = realmManager.choosenExercises.sorted(by: {$0.date.compare($1.date) == .orderedDescending})
        result.forEach { exercise in
                if exercise.title == title {
                    previousExercises.append(exercise)
            }
        }
        showingSheet.toggle()
    }
    
    private func addExercise() {
        exerciseAdded.toggle()
        
        let choosenExercise = ChoosenExercise(icon: image, title: title, note: note, date: date)
        sets.forEach { setToAppend in
            choosenExercise.sets.append(Set(id: setToAppend.id, repeats: setToAppend.repeats, weight: setToAppend.weight))
        }
        
        if exerciseAdded {
            choosenExercises.append(choosenExercise)
        } else {
            choosenExercises.removeAll(where: {$0.title == choosenExercise.title})
        }
    }
    
    private func changeMemoryButtonSize() -> CGFloat {
        var buttonSize: CGFloat = 127
        if sets.count < 3 && sets.count > 1 {
            buttonSize = 83
        } else if sets.count == 1 {
            buttonSize = 44
        }
        return buttonSize
    }
    
    private func changeMemoryButtonPosition() -> CGFloat {
        var buttonPosition: CGFloat = backgroundHeight * 0.32
        if sets.count < 3 && sets.count > 1 {
            buttonPosition = backgroundHeight * 0.32
        } else if sets.count == 1 {
            buttonPosition = backgroundHeight * 0.30
        }
        return buttonPosition
    }
}

struct PressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PressedButtonView(
            backgroundHeight: .constant(270),
            buttonNotPressed: .constant(true),
            exerciseAdded: .constant(false),
            sets: .constant([MocSet(id: 1, repeats: "", weight: ""),
                             MocSet(id: 2, repeats: "", weight: ""),
                             MocSet(id: 3, repeats: "", weight: "")]),
            choosenExercises: .constant([]),
            date: .constant(Date()),
            image: .constant("chest"),
            title: .constant("Exercise for example"),
            note: .constant("...")
        )
        .environmentObject(RealmManager())
    }
}



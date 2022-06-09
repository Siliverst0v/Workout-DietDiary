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

    @Binding var backgroundHeight: CGFloat
    @Binding var pressed: Bool    
    @Binding var exerciseAdded: Bool
    @Binding var sets: [Set]
    @Binding var realmChoosenExerises: [ChoosenExercise]
    @State private var showingSheet = false
    @State var previousExercises: [ChoosenExercise] = []
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
                Button(action: { addExercise() }) {
                    Image(systemName: exerciseAdded ? "checkmark.square" : "square")
                    .font(.system(size: 20))
                    .foregroundColor(.customBlue)
                    .frame(width: 40, height: 40, alignment: .center)
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
                .offset(x: width - 45, y: 15)
                VStack(alignment: .leading) {
                HStack {
                    if width < 370 {
                Text("Подходы")
                    .fontWeight(.semibold)
                    .foregroundColor(.customRed)
                    .padding(.leading, 20)
                    } else {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(.customRed)
                            .padding(.init(top: 0,
                                           leading: 20,
                                           bottom: 0,
                                           trailing: 30))
                    }
                    Text("Повторения")
                        .fontWeight(.semibold)
                        .foregroundColor(.customRed)
                        .padding(.leading, 8)
                    Text("Вес(Кг)")
                        .fontWeight(.semibold)
                        .foregroundColor(.customRed)
                        .padding(.leading, 15)
                }
                .font(.system(size: 14))
                .padding(.top, 60)
                    ForEach($sets, id: \.id) { setNumber in
                        HStack(alignment: .center) {
                            if width < 370 {
                                Text("\(setNumber.id)")
                                .fontWeight(.semibold)
                                .frame(width: 64)
                                .font(.system(size: 17))
                                .foregroundColor(.customBlue)
                                .padding(.leading, 20)

                            } else {
                                Text("\(setNumber.id)")
                                    .fontWeight(.semibold)
                                    .frame(width: 64)
                                    .font(.system(size: 17))
                                    .foregroundColor(.customBlue)
                                    .padding(.init(top: 0,
                                                   leading: 20,
                                                   bottom: 0,
                                                   trailing: 30))
                            }
                            TextField("0", text: setNumber.repeats)
                                .frame(width: 84, alignment: .center)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 8)
                            TextField("0", text: setNumber.weight)
                                .frame(width: 60, alignment: .center)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.leading, 10)
                        }
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Button(action: { addSet() }) {
                                Text("+")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.customBlue)
                                    .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
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
                            .disabled(sets.count >= 10)
                            Button(action: { deleteSet() }) {
                                Text("-")
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.customRed)
                                    .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
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
                            .disabled(sets.count <= 1)
                            .padding(.trailing, 20)
                            Button(action: { pressed.toggle() }) {
                                Image(systemName: "chevron.up")
                                    .frame(width: 140, height: 28, alignment: .center )
                                    .font(.system(size: 20))
                                    .foregroundColor(.customRed)
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
                        .padding(.leading, 5)
                        TextEditor(text: $note)
                            .foregroundColor(.customBlue)
                            .lineLimit(2)
                            .frame(width: UIScreen.main.bounds.size.width - 60, height: 80)
                            .cornerRadius(10)
                            .offset(x: 10)
                    }
                }
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
        
        let choosenExerciseRealm = ChoosenExercise(icon: image, title: title, note: note, date: date)
        sets.forEach { sett in
            choosenExerciseRealm.sets.append(RealmSet(id: sett.id, repeats: sett.repeats, weight: sett.weight))
        }
        
        if exerciseAdded {
            realmChoosenExerises.append(choosenExerciseRealm)
        } else {
            realmChoosenExerises.removeAll(where: {$0.title == choosenExerciseRealm.title})
        }
    }
    
    private func addSet() {
        let newSet = Set(
                    id: sets.count + 1,
                    repeats: "",
                    weight: "")
        if sets.count <= 9 {
        sets.append(newSet)
        }
    }
    
    private func deleteSet() {
        sets.removeLast()
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
            buttonPosition = backgroundHeight * 0.38
        } else if sets.count == 1 {
            buttonPosition = backgroundHeight * 0.46
        }
        return buttonPosition
    }
}

struct PressedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PressedButtonView(
            backgroundHeight: .constant(270),
            pressed: .constant(true),
            exerciseAdded: .constant(false),
            sets: .constant([Set(id: 1, repeats: "", weight: ""),
                   Set(id: 2, repeats: "", weight: ""),
                   Set(id: 3, repeats: "", weight: "")]),
            realmChoosenExerises: .constant([]),
            date: .constant(Date()),
            image: .constant("chest"),
            title: .constant("Exercise for example"),
            note: .constant("...")
        )
        .environmentObject(RealmManager())
    }
}

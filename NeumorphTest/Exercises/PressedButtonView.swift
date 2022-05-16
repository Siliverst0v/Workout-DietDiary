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
    @Binding var changeCheckmarkColor: Bool
    @Binding var choosenExercises: [ChoosenExercise]
    @Binding var sets: [Set]
//    @EnvironmentObject var choosenExerciseRealm: RealmChoosenExercise
    
    let image: String
    let title: String
    
    var body: some View {
        ZStack {
        Image("TappedCell")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight)
            GeometryReader { geometry in
                let width = geometry.size.width
            Image(image)
                .resizable()
                .frame(width: 70, height: 40)
                .offset(x: 10, y: 15)
            Text(title)
            .fontWeight(.semibold)
            .font(.system(size: 14))
            .foregroundColor(.customBlue)
            .lineLimit(3)
            .frame(width: width - 130, height: 60, alignment: .leading)
            .offset(x: 85, y: 5)
                Button(action: { addExercise() }) {
                Image(systemName: "checkmark.square")
                    .font(.system(size: 20))
                    .foregroundColor(changeCheckmarkColor ? .customBlue : .gray)
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
                            .padding(.leading, 20)
                            .padding(.trailing, 30)
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
                                    .padding(.leading, 20)
                                    .padding(.trailing, 30)
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
                    HStack {
                        Button(action: { addSet() }) {
                            Text("+")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.customBlue)
                        }
                        .font(.system(size: 17))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        .disabled(sets.count >= 10)
                        Button(action: { deleteSet() }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.customRed)
                        }
                        .font(.system(size: 17))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        .disabled(sets.count <= 1)
                        .padding(.trailing, 20)
                        Button(action: { pressed.toggle() }) {
                            Image(systemName: "chevron.up")
                        }
                        .frame(width: 100, height: 28, alignment: .center )
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                    .padding(.leading, 5)
                }
                Button(action: {}) {
                        Image(systemName: "memories")
                        .padding(.trailing, 1)
                }
                .frame(width: 30, height: changeButtonSize(), alignment: .center )
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
                .offset(x: width - 40, y: changeMemoryButtonPosition())
            }
            .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight)
        }
    }
}

extension PressedButtonView {
    
    private func addExercise() {
        changeCheckmarkColor.toggle()
        
        let choosenExercise = ChoosenExercise(
            icon: image,
            title: title,
            sets: sets)
        
        let choosenExerciseRealm = RealmChoosenExercise(icon: image, title: title)
        sets.forEach { sett in
            choosenExerciseRealm.sets.append(RealmSet(id: sett.id, repeats: sett.repeats, weight: sett.weight))
        }
        
        if changeCheckmarkColor {
            choosenExercises.append(choosenExercise)
        } else {
            choosenExercises.removeAll(where: {$0.title == choosenExercise.title})
        }
    }
    
    private func addSet() {
        let newSet = Set(
                    id: sets.count + 1,
                    repeats: "",
                    weight: "")
        if sets.count <= 9 {
        sets.append(newSet)
        backgroundHeight += 46
        }
    }
    
    private func deleteSet() {
        sets.removeLast()
        backgroundHeight -= 46
    }
    
    private func changeButtonSize() -> CGFloat {
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
            changeCheckmarkColor: .constant(false),
            choosenExercises: .constant([]),
            sets: .constant([Set(id: 1, repeats: "", weight: ""),
                   Set(id: 2, repeats: "", weight: ""),
                   Set(id: 3, repeats: "", weight: "")]),
//            choosenExerciseRealm: RealmChoosenExercise(),
            image: "chest",
            title: "Exercise for example"
        )
    }
}

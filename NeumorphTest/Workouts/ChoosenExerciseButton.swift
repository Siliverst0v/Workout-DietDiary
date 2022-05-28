//
//  ChoosenExerciseButton.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 08.05.2022.
//

import SwiftUI
import RealmSwift

struct ChoosenExerciseButton: View {
    @EnvironmentObject var realmManager: RealmManager
    
    @State private var notTapped = true
    @Binding var choosenExercise: RealmChoosenExercise
    var action: () -> Void
    
    @State var backgroundHeight: CGFloat = 178
    
    var body: some View {
        if notTapped {
            ZStack{
            Button( action: { notTapped.toggle() } ) {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    Image(choosenExercise.icon)
                    .resizable()
                    .frame(width: 70, height: 40)
                    .offset(x: 10, y: 15)
                    Text(choosenExercise.title)
                .fontWeight(.semibold)
                .lineLimit(3)
                .frame(width: width - 130, height: 60, alignment: .leading)
                .offset(x: 85, y: 5)
                    Button(action: { self.action() }) {
                    Image(systemName: "clear")
                        .font(.system(size: 20))
                        .foregroundColor(.customRed)
                        .frame(width: 40, height: 40, alignment: .center)
                    }
                    .offset(x: width - 45, y: 15)
                }
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 70, alignment: .center)
                }
            .buttonStyle(ExerciseButtonStyle())
            }
        } else {
            ZStack {
            Image("TappedCell")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 46)))
                GeometryReader { geometry in
                    let width = geometry.size.width
                    Image(choosenExercise.icon)
                    .resizable()
                    .frame(width: 70, height: 40)
                    .offset(x: 10, y: 15)
                    Text(choosenExercise.title)
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .foregroundColor(.customBlue)
                .lineLimit(3)
                .frame(width: width - 130, height: 60, alignment: .leading)
                .offset(x: 85, y: 5)
                    Button(action: { self.action() }) {
                    Image(systemName: "clear")
                        .font(.system(size: 20))
                        .foregroundColor(.customRed)
                        .frame(width: 40, height: 40, alignment: .center)
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
                        ForEach($choosenExercise.sets, id: \.id) { setNumber in
                            HStack(alignment: .center) {
                                if width < 370 {
                                    Text("\(setNumber.id.wrappedValue)")
                                    .fontWeight(.semibold)
                                    .frame(width: 64)
                                    .font(.system(size: 17))
                                    .foregroundColor(.customBlue)
                                    .padding(.leading, 20)

                                } else {
                                    Text("\(setNumber.id.wrappedValue)")
                                        .fontWeight(.semibold)
                                        .frame(width: 64)
                                        .font(.system(size: 17))
                                        .foregroundColor(.customBlue)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 30)
                                }
                                TextField("0", text: setNumber.repeats)
                                    .frame(width: 84, alignment: .center)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.leading, 8)
                                TextField("0", text: setNumber.weight)
                                    .frame(width: 60, alignment: .center)
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
                            .disabled(choosenExercise.sets.count >= 10)
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
                            .disabled(choosenExercise.sets.count <= 1)
                            .padding(.trailing, 20)
                            Button(action: { notTapped.toggle() }) {
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
                .frame(width: UIScreen.main.bounds.size.width - 40, height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 46)))
            }
            .onAppear(perform: realmManager.getSets)
        }
    }
    
    
    private func addSet() {
        if choosenExercise.sets.count <= 9 {
            realmManager.addSet(
                id: choosenExercise.id,
                choosenExercise: choosenExercise)
        }
    }
    
    private func deleteSet() {
        realmManager.deleteSet(
            id: choosenExercise.id,
            choosenExercise: choosenExercise)
        
        guard let setToDelete = choosenExercise.sets.last else {return}
        realmManager.delete(set: setToDelete)
        
    }
    
    private func changeButtonSize() -> CGFloat {
        var buttonSize: CGFloat = 127
        if choosenExercise.sets.count < 3 && choosenExercise.sets.count > 1 {
            buttonSize = 83
        } else if choosenExercise.sets.count == 1 {
            buttonSize = 44
        }
        return buttonSize
    }
    
    private func changeMemoryButtonPosition() -> CGFloat {
        var buttonPosition: CGFloat = backgroundHeight * 0.48
        if choosenExercise.sets.count < 3 && choosenExercise.sets.count > 1 {
            buttonPosition = backgroundHeight * 0.48
        } else if choosenExercise.sets.count == 1 {
            buttonPosition = backgroundHeight * 0.46
        }
        return buttonPosition
    }
}

struct ChoosenExerciseButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenExerciseButton(choosenExercise: .constant(RealmChoosenExercise(
            icon: "chest",
            title: "Exercise for example")), action: {})
        .environmentObject(RealmManager())
    }
}

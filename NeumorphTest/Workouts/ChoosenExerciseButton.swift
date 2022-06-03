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
    @StateObject var testSets = TestSets()
    @State private var showingSheet = false
    @State private var showingNote = false
    @State var previousExercises: [RealmChoosenExercise] = []
    
    @State var backgroundHeight: CGFloat = 263
    
    var body: some View {
        if notTapped {
            ZStack{
            Button( action: { notTapped.toggle() } ) {
                GeometryReader { geometry in
                    let width = geometry.size.width
                    HStack {
                    Image(choosenExercise.icon)
                    .resizable()
                    .frame(width: 70,
                           height: 40)
                    Text(choosenExercise.title)
                            .fontWeight(.semibold)
                            .lineLimit(3)
                            .frame(width: width - 160,
                                   height: 60,
                                   alignment: .leading)
                            .padding(.leading)
                    }
                    .padding(.init(top: 5,
                                   leading: 16,
                                   bottom: 0,
                                   trailing: 0))
                    Button(action: { self.action() }) {
                    Image(systemName: "trash")
                        .font(.system(size: 20))
                        .foregroundColor(.customRed)
                        .frame(width: 40,
                               height: 40,
                               alignment: .center)
                    }
                    .offset(x: width - 45,
                            y: 15)
                }
                .frame(width: UIScreen.main.bounds.size.width - 40,
                       height: 70, alignment: .center)
                }
            .buttonStyle(ExerciseButtonStyle())
            }
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
                        ForEach($testSets.sets, id: \.id) { setNumber in
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
                                        .padding(.init(top: 0,
                                                       leading: 20,
                                                       bottom: 0,
                                                       trailing: 30))
                                }
                                TextField("0", text: setNumber.repeats)
                                    .frame(width: 84,
                                           alignment: .center)
                                    .keyboardType(.decimalPad)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding(.leading, 8)
                                TextField("0", text: setNumber.weight)
                                    .frame(width: 60,
                                           alignment: .center)
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
                                        .frame(width: 50,
                                               height: 28,
                                               alignment: .init(horizontal: .center,
                                                                vertical: .bottom) )
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
                                .disabled(choosenExercise.sets.count >= 10)
                                Button(action: { deleteSet() }) {
                                    Text("-")
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.customRed)
                                        .frame(width: 50,
                                               height: 28,
                                               alignment: .init(horizontal: .center,
                                                                vertical: .bottom) )
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
                                .disabled(choosenExercise.sets.count <= 1)
                                .padding(.trailing, 20)
                                Button(action: { saveSets() }) {
                                    Image(systemName: "chevron.up")
                                    .frame(width: 140,
                                           height: 28,
                                           alignment: .center )
                                    .font(.system(size: 20))
                                    .foregroundColor(.customRed)
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
                            }
                            .padding(.leading, 5)
                            TextEditor(text: $choosenExercise.note)
                                .foregroundColor(.customBlue)
                                .lineLimit(2)
                                .frame(width: UIScreen.main.bounds.size.width - 60,
                                       height: 80)
                                .cornerRadius(10)
                                .offset(x: 10)
                        }
                    }
                    Button(action: { self.fetchPreviousExercises() }) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                            .frame(width: 30,
                                   height: changeButtonSize(),
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
                    .offset(x: width - 40,
                            y: changeMemoryButtonPosition())
                }
                .frame(width: UIScreen.main.bounds.size.width - 40,
                       height: backgroundHeight + CGFloat(((choosenExercise.sets.count - 1) * 46)))
            }
            .onAppear(perform: fetchSets)
        }
    }
}

extension ChoosenExerciseButton {
    
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
    
    private func saveSets() {
        notTapped.toggle()
        var test: [RealmSet] = []
            choosenExercise.sets.forEach { setToDelete in
                        realmManager.delete(set: setToDelete)
                }
        testSets.sets.forEach { sett in
            let newRealmSet = RealmSet(id: sett.id,
                                       repeats: sett.repeats,
                                       weight: sett.weight)
            test.append(newRealmSet)
        }
        realmManager.updateChoosenExercise(id: choosenExercise.id,
                                           sets: test)
    }
    
    private func fetchSets() {
        testSets.sets = []
        choosenExercise.sets.forEach { sett in
            let newTestSet = TestSet(id: sett.id,
                                     repeats: sett.repeats,
                                     weight: sett.weight)
                testSets.sets.append(newTestSet)
        }
    }
    
    private func addSet() {
        let newSet = TestSet(
            id: choosenExercise.sets.count + 1,
                    repeats: "",
                    weight: "")
        if choosenExercise.sets.count <= 9 {
            realmManager.addSet(
                id: choosenExercise.id,
                choosenExercise: choosenExercise)
            testSets.sets.append(newSet)
        }
    }
    
    private func deleteSet() {
        
        guard let setToDelete = choosenExercise.sets.last else {return}
        realmManager.delete(set: setToDelete)
        testSets.sets.removeLast()
        
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
        ChoosenExerciseButton(choosenExercise: .constant(Exercises.shared.getMocExercise()),
                              action: {})
        .environmentObject(RealmManager())
    }
}

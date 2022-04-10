//
//  TappedCellTest.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 10.04.2022.
//

import SwiftUI

struct OriginalTappedCell: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @State var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 270)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("3")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount += 1 }) {
                            Text("+")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        .hidden()
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellMinus2: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 192)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                        }
                        .disabled(true)
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellMinus1: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 231)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellPlus1: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 309)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("3")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack(alignment: .center) {
                            Text("4")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellPlus2: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 348)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("3")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack(alignment: .center) {
                            Text("4")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("5")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellPlus3: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 387)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("3")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack(alignment: .center) {
                            Text("4")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("5")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("6")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct TappedCellPlus4: View {
    @State var image = "CellChest"
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var test = ""
    @Binding var tap: Bool
    @Binding var setsCount: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("TappedCell")
                .resizable()
                .frame(width: 360, height: 416)
                HStack(alignment: .top, spacing: 0) {
                    VStack(spacing: 5) {
                        HStack(spacing: 0) {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                        .padding(.trailing, 5)
                    Text(title)
                        .fontWeight(.semibold)
                        .frame(width: 220)
                        .lineLimit(3)
                        .scaledToFill()
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                    }
                    .padding(.vertical, 10)
                    HStack(alignment: .center) {
                        Text("Подходы")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                        Text("Повторения")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                            .padding(.leading, 20)
                        Text("Вес(Кг)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
                    }
                        HStack(alignment: .center) {
                        Text("1")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 33)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("2")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                    HStack(alignment: .center) {
                        Text("3")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal, 50)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.leading, 30)
                        TextField("0", text: $test)
                            .frame(width: 60, alignment: .center)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                            .padding(.horizontal)
                    }
                        HStack(alignment: .center) {
                            Text("4")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("5")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("6")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack(alignment: .center) {
                            Text("7")
                                .font(.system(size: 17))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal, 50)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.leading, 30)
                            TextField("0", text: $test)
                                .frame(width: 60, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                                .padding(.horizontal)
                        }
                        HStack {
                        Button(action: { setsCount += 1 }) {
                        Text("+")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                    .disabled(true)
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
                        Button(action: { setsCount -= 1 }) {
                            Text("-")
                                .font(.system(size: 25))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
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
                        .padding(.trailing, 35)
                    Button(action: { tap.toggle() }) {
                                Image(systemName: "arrowtriangle.up.fill")
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
                        .padding(.top, 10)
                }
                    VStack(alignment: .center, spacing: 33) {
                        Button(action: { tap.toggle() }) {
                        Image(systemName: "checkmark")
                    }
                    .frame(width: 40, height: 40, alignment: .center )
                    .font(.system(size: 20))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    Button(action: {}) {
                            Image(systemName: "memories")
                            .padding(.trailing, 1)
                    }
                    .frame(width: 30, height: 105, alignment: .center )
                    .font(.system(size: 17))
                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
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
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                }
            }
    }
}

struct OriginalTappedCell_Previews: PreviewProvider {
    @State var tap = true
    static var previews: some View {
        OriginalTappedCell(image: "CellChest", title: "Exercise for example to add to Workout Diary App", test: "", tap: true, setsCount: .constant(3))
    }
}

//
//  ButtonContent.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 10.04.2022.
//

import SwiftUI

//struct ButtonContent: View {
//
//    @Binding var tapValue: Bool
//    @Binding var image: String
//    @Binding var title: String
//    @Binding var test: String
//
//    var body: some View {
//        if tapValue {
//            HStack(alignment: .center, spacing: 5) {
//            Image(image)
//                .resizable()
//                .frame(width: 70, height: 36)
//                .padding(.trailing, 1)
//            Text(title)
//            .fontWeight(.semibold)
//            .lineLimit(3)
//            .frame(width: 220)
//            .padding(.trailing, 2)
//            Button(action: {}) {
//                Image(systemName: "checkmark")
//                    .font(.system(size: 20))
//                    .frame(width: 40, height: 40, alignment: .center)
//                    .padding(.trailing, 10)
//            }
//        }
//        } else {
//            HStack {
//            VStack {
//                HStack(alignment: .center, spacing: 1) {
//                Image(image)
//                    .resizable()
//                    .frame(width: 70, height: 36)
//                Text(title)
//                    .fontWeight(.semibold)
//                    .frame(width: 200)
//
//            }
//                HStack {
//                    Text("Подходы")
//                        .fontWeight(.semibold)
//                        .padding(.trailing, 10)
//                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//                    Text("Повторения")
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//                        .padding(.horizontal)
//                    Text("Вес(Кг)")
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//                        .padding(.horizontal, 1)
//                }
//                Spacer(minLength: 1)
//                HStack {
//                    Text("1")
//                        .font(.system(size: 17))
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal, 50)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                        .disabled(false)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                        .disabled(false)
//                }
//                Spacer(minLength: 3)
//                HStack {
//                    Text("2")
//                        .font(.system(size: 17))
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal, 50)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                }
//                Spacer(minLength: 3)
//                HStack {
//                    Text("3")
//                        .font(.system(size: 17))
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal, 50)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                    TextField("0", text: $test)
//                        .frame(width: 60, alignment: .center)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                        .padding(.horizontal)
//                }
//                HStack {
//                Button(action: {  }) {
//                    Text("+")
//                        .font(.system(size: 25))
//                        .fontWeight(.semibold)
//                        .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                }
//                .font(.system(size: 17))
//                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                .frame(width: 50, height: 28, alignment: .init(horizontal: .center, vertical: .bottom) )
//                .background(
//                            RoundedRectangle(cornerRadius: 11)
//                                    .fill(.white)
//                            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 11)
//                                    .stroke(Color.gray, lineWidth: 0.1)
//                            )
//
//                    )
//
//                .padding(.leading, 30)
//                    Button(action: {}) {
//                        Image(systemName: "arrowtriangle.up.fill")
//                            .font(.system(size: 20))
//                            .foregroundColor(Color(red: 142/255, green: 51/255, blue: 46/255))
//                    }
//                    .frame(width: 88, height: 28 )
//                    .font(.system(size: 17))
//                    .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                    .background(
//                                RoundedRectangle(cornerRadius: 11)
//                                .fill(.white)
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                                .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 11)
//                                        .stroke(Color.gray, lineWidth: 0.1)
//                                )
//                        )
//                    .padding(.leading, 80)
//                    Spacer()
//                }
//            }
//                VStack {
//                Button(action: {}) {
//                    Image(systemName: "checkmark")
//                }
//                .frame(width: 40, height: 40, alignment: .center )
//                .font(.system(size: 20))
//                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                .background(
//                            RoundedRectangle(cornerRadius: 11)
//                            .fill(.white)
//                            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 11)
//                                    .stroke(Color.gray, lineWidth: 0.1)
//                            )
//                    )
//                .padding(.trailing, 10)
//                Button(action: {}) {
//                        Image(systemName: "memories")
//                        .padding(.trailing, 1)
//                }
//                .frame(width: 30, height: 105, alignment: .center )
//                .font(.system(size: 17))
//                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
//                .background(
//                            RoundedRectangle(cornerRadius: 11)
//                            .fill(.white)
//                            .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
//                            .shadow(color: .white.opacity(0.7), radius: 10, x: -5, y: -5)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 11)
//                                    .stroke(Color.gray, lineWidth: 0.1)
//                            )
//                    )
//                .padding(.trailing, 10)
//                .padding(.top, 25)
//                    Spacer()
//
//                }
//            }
//        }
//    }
//}

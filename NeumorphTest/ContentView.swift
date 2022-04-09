//
//  ContentView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 07.04.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ZStack{
            VStack{
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            NeuromorphicRectangleCell()
            }
        }
        .ignoresSafeArea()
    }
}



struct NeuromorphicRectangleCell: View {
    @State var notTapped = true
    @State var title = "Exercise for example to add to Workout Diary App"
    @State var image = "CellChest"
    
    var body: some View {
        ZStack{
            Button( action: {
                if notTapped {
                    notTapped.toggle()
                    
                } else {
                    notTapped.toggle()
                }
            })
            {
                if notTapped {
                HStack {
                    Image(image)
                        .resizable()
                        .frame(width: 70, height: 36)
                    Text(title)
                    .fontWeight(.bold)
                    Button(action: {}) {
                        Image(systemName: "pencil")
                    }
                }
                } else {
                    HStack {
                        Image(image)
                            .resizable()
                            .frame(width: 70, height: 36)
                        Text(title)
                        .fontWeight(.bold)
                        Button(action: {}) {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .buttonStyle(CustomButtonStyle(didTapped: $notTapped))
        }
    }
}


struct ButtonContent: View {
    
    @Binding var tapValue: Bool
    @Binding var image: String
    @Binding var title: String
    
    var body: some View {
        if tapValue {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 70, height: 36)
            Text(title)
            .fontWeight(.bold)
            Button(action: {}) {
                Image(systemName: "stop")
            }
        }
        } else {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 70, height: 36)
                Text(title)
                .fontWeight(.bold)
                Button(action: {}) {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}


struct CustomButtonStyle: ButtonStyle {
    @Binding var didTapped: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        if didTapped {
        configuration.label
            .font(.system(size: 17))
            .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
            .frame(width: 390, height: 50)
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
                .padding(.vertical, 5)
        } else {
            configuration.label
                .font(.system(size: 17))
                .foregroundColor(Color(red: 46/255, green: 74/255, blue: 142/255))
                .padding(.vertical, 10)
                .frame(width: 390, height: 222, alignment: .top)
                    .background(
                        RoundedRectangle(cornerRadius: 11)
                            .fill(.white)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 4)
                                        .blur(radius: 8)
                                        .offset(x: 2, y: 2)
                                        .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.black, Color.clear)))
                                )
                            .overlay(
                                    RoundedRectangle(cornerRadius: 11)
                                        .stroke(Color.gray, lineWidth: 4)
                                        .blur(radius: 8)
                                        .offset(x: -2, y: -2)
                                        .mask(RoundedRectangle(cornerRadius: 11).fill(LinearGradient(Color.clear, Color.black)))
                                )
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color.gray, lineWidth: 0.1)
                            )
                            
                    )
                    .padding(.vertical, 5)
            
        }
    }
}


extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

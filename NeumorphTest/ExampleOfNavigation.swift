//
//  ExampleOfNavigation.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 06.05.2022.
//

import SwiftUI

struct ExampleOfNavigation: View {
    @State var array: [String] = []
    @State var workoutsIsActive = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(array, id: \.self) { element in
                    Text(element)
                }
            }
            .background(
                NavigationLink(isActive: $workoutsIsActive, destination: {
                    Details(array: $array, workoutsIsActive: $workoutsIsActive)
                }, label: {
                    EmptyView()
                })
                .isDetailLink(false)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        workoutsIsActive = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct Details: View {
    @Binding var array: [String]
    @Binding var workoutsIsActive: Bool
    
    @State var choosenIsActive = false
    
    var body: some View {
        Button(action: { array.append("First Element") }) {
            Text("Append First Element")
        }
        .background(
            NavigationLink(isActive: $choosenIsActive, destination: {
                MoreDetails(array: $array, workoutsIsActive: $workoutsIsActive)
            }, label: {
                EmptyView()
            })
            .isDetailLink(false)
        )
        .toolbar {
            Button {
                choosenIsActive = true
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

struct MoreDetails: View {
    @Binding var array: [String]
    @Binding var workoutsIsActive: Bool

    var body: some View {
        Button(action: { array.append("Second Element") }) {
            Text("Append Second Element")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    workoutsIsActive = false
                } label: {
                    Text("Original")
                }

            }
        }
    }
}

struct ExampleOfNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ExampleOfNavigation()
    }
}

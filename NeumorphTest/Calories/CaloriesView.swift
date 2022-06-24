//
//  CaloriesView.swift
//  NeumorphTest
//
//  Created by Анатолий Силиверстов on 10.06.2022.
//

import SwiftUI
import RealmSwift

struct CaloriesView: View {
    @EnvironmentObject var realmManager: RealmManager
    @Environment(\.dismiss) var dismiss
    @ObservedResults(Food.self) var foods
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Ккал (Сегодня)")
                    .foregroundColor(.customRed)
                    .padding(.horizontal)
                List {
                    ForEach(foods, id: \.id) { food in
                        NavigationLink(destination: EditFoodView(food: food)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(food.name)
                                        .bold()
                                    
                                    Text("\(Int(food.calories))") +
                                    Text(" калорий")
                                        .foregroundColor(Color.customRed)
                                }
                                Spacer()
                                Text(calcTimeSince(date: food.date))
                                    .foregroundColor(.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .foregroundColor(.customBlue)
                .listStyle(.plain)
            }
            .navigationTitle("Дневник калорий")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddFoodView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

extension CaloriesView {
    private func totalCaloriesToday() -> Double {
        var caloriesToday: Double = 0
        for item in foods {
            if Calendar.current.isDateInToday(item.date) {
                caloriesToday += item.calories
            }
        }
        return caloriesToday
    }
    
    private func deleteFood(offSets: IndexSet) {
        offSets.forEach { index in
            realmManager.deleteFood(id: foods[index].id)
        }
        realmManager.getFoods()
    }
}

struct CaloriesView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesView()
            .environmentObject(RealmManager())
    }
}

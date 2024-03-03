//
//  ManagerEndView.swift
//  something
//
//  Created by Charles Blue on 2024/3/3.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    private var resort = "Tomamu"
    
    // 数据模型，用于表示分类和子项
    struct Category: Identifiable, Equatable, Hashable {
        var id = UUID()
        var name: String
        var items: [String]
        var isExpanded: Bool
    }
    
    @State private var categories: [Category] = [
        Category(name: "Overview", items: ["⛷️ Lesson", "📍 Duty", "🎿 Service", "👨‍🔧 Other"], isExpanded: true),
        Category(name: "Scheduling", items: ["📇 Attendance", "👶 Private Lesson", "👯 Group Lesson", "💃 Duty & Service"], isExpanded: true),
        Category(name: "Management", items: ["📊 Database", "🧮 Analysis", "🗂 Timesheet", "🪪 Miscellaneous"], isExpanded: true)
    ]
    @State private var selectedCategory: Category?
    
    var body: some View {
        NavigationView {
            HStack {
                // 左侧导航栏
                List(selection: $selectedCategory) {
                    ForEach(categories.indices, id: \.self) { index in
                        Section(header: HStack {
                            Text(categories[index].name)
                            Spacer()
                            Image(systemName: categories[index].isExpanded ? "chevron.down" : "chevron.right")
                        }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    categories[index].isExpanded.toggle()
                                }
                            }
                        ) {
                            if categories[index].isExpanded {
                                ForEach(categories[index].items, id: \.self) { item in
                                    NavigationLink(
                                        destination: Text("Selected Item: \(item)"),
                                        label: {
                                            Text(item)
                                        }
                                    )
                                }
                            }
                        }
                        .textCase(nil)
                    }
                }
                .listStyle(SidebarListStyle())
            }.navigationTitle(resort)
            .onAppear {
                // 设置默认选中第一项
                selectedCategory = categories.first
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

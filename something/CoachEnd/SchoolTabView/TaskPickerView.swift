//
//  LessonPickerView.swift
//  something
//
//  Created by Charles Blue on 2024/3/3.
//

import SwiftUI

struct TaskPickerView: View{
    var tasks: [TaskItem]

    // Group lessons by category
    var categorizedLessons: [String: [TaskItem]] {
        Dictionary(grouping: tasks, by: { $0.category })
    }

    var body: some View {
        List {
            // Use a ForEach to iterate over categories
            ForEach(categorizedLessons.keys.sorted(), id: \.self) { category in
                Section(header: Text(category).foregroundColor(.primary).font(.headline).fontWeight(.bold)) {
                    // Layer another ForEach to iterate over lessons in this category
                    ForEach(categorizedLessons[category]!, id: \.id) { lesson in
                        TaskRowView(item: lesson)
                    }
                }
                .listRowBackground(Color(UIColor.secondarySystemGroupedBackground))
            }
        }
    }
}

struct TaskPickerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskPickerView(tasks: duties)
    }
}

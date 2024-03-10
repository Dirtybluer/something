import SwiftUI

struct DatePickerView: View {
    @Binding var selectedDate: Date
    @State private var isDatePickerVisible = false
    
    var body: some View {
        HStack {
            // 步长日期选择器
            Button(action: { updateDate(by: -1) }) {
                Image(systemName: "chevron.left")
            }
            Text(dateFormatter.string(from: selectedDate))
                .font(.title3)
                .fontWeight(.bold)
            Button(action: { updateDate(by: 1) }) {
                Image(systemName: "chevron.right")
            }
            
            Spacer()
            
            // 日历日期选择器
            Image(systemName: "calendar")
                .font(.title2)
                .foregroundColor(.blue)
                .onTapGesture {
                    withAnimation {
                        isDatePickerVisible.toggle()
                    }
                }
                .overlay {
                    if isDatePickerVisible {
                        DatePicker(
                            "",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .blendMode(.destinationOver)
                        .onChange(of: selectedDate) { _ in
                            withAnimation(Animation.smooth(duration: 0.05)) {
                                isDatePickerVisible = false
                            }
                        }
                    }
                }
        }
        .padding(.horizontal, 20)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }
    
    private func updateDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
        }
    }
}

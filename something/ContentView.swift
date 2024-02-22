import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "Schedule"

    var body: some View {
        TabView(selection: $selectedTab) {
            ScheduleTabView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Schedule")
                }
                .tag("Schedule")
            
            SchoolTabView()
                .tabItem {
                    Image(systemName: "house")
                    Text("School")
                }
                .tag("School")
            
        // todo: 替换成实际的个人视图
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag("Profile")
        }
    }
}

struct ScheduleTabView: View {

    @State private var selectedDate: Date = Date()

    struct ScheduleItem: Identifiable {
        let id = UUID()
        let timeRange: String
        let name: String
        let numberOfParticipants: Int
        let location: String
        let imageName: String
    }

    struct ScheduleRow: View {
        var item: ScheduleItem
        
        var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text(item.timeRange)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                HStack {
                    Image(systemName: item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding(12)
                        .background(Color.orange.opacity(0.2))
                        .clipShape(Circle())
                        .foregroundColor(.orange)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(item.location)
                            .font(.caption)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "person.2.fill")
                            .font(.caption)
                        Text("\(item.numberOfParticipants) Kids")
                            .font(.caption)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.horizontal, 8)
        }
    }
    
    private let schedule: [ScheduleItem] = [
        ScheduleItem(timeRange: "9:00 - 11:00", name: "Small - AM", numberOfParticipants: 5, location: "Kids Room", imageName: "sun.min.fill"),
        ScheduleItem(timeRange: "13:00 - 15:00", name: "Bigger 3 - PM", numberOfParticipants: 3, location: "Big Kids Room", imageName: "snow"),
        ScheduleItem(timeRange: "16:00 - 17:00", name: "Tea Time", numberOfParticipants: 0, location: "Theatre", imageName: "cup.and.saucer.fill"),
        ScheduleItem(timeRange: "20:15 - 22:30", name: "Night Shift", numberOfParticipants: 0, location: "Theatre", imageName: "moon.fill"),
    ]

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Sammy")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                Spacer()
            }
            
            HStack {
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
                
                Button(action: {
                    // todo: 跳转查看日历
                }) {
                    Image(systemName: "calendar")
                        .font(.title3)
                }
            }
            .padding(.horizontal, 16)
            
            List {
                ForEach(schedule) { item in
                    ScheduleRow(item: item)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
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

struct SchoolTabView: View  {
    @State private var selectedDate: Date = Date()

    @State private var selectedCategory: String = "Lessons"
    let categories = ["Lessons", "Duty", "Services", "Others"]

    // Lesson data model
    struct Lesson: Identifiable {
        var id = UUID()
        var category: String
        var level: String
        var time: String
        var coach: String
        var guests: Int
    }
    
    // Sample lesson data
    let lessons: [Lesson] = [
        Lesson(category: "Adult Ski Lessons", level: "Club Beginner", time: "9:00 - 11:00 AM", coach: "Sammy", guests: 60),
        Lesson(category: "Adult Ski Lessons", level: "Club 1", time: "9:00 - 11:00 AM", coach: "Ben", guests: 15),
        Lesson(category: "Adult Ski Lessons", level: "Club 2", time: "1:00 - 3:00 PM", coach: "David", guests: 60),
        Lesson(category: "Adult Snowboard Lessons", level: "SB Beginner", time: "9:00 - 11:00 AM", coach: "Kaleb", guests: 9),
    ]

    // Group lessons by category
    var categorizedLessons: [String: [Lesson]] {
        Dictionary(grouping: lessons, by: { $0.category })
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Tomamu")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 16)
                Spacer()
            }

            HStack {
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
                
                Button(action: {
                    // todo: 跳转查看日历
                }) {
                    Image(systemName: "calendar")
                        .font(.title3)
                }
            }
            .padding(.horizontal, 16)

            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            if selectedCategory == "Lessons" {
                List {
                    // Use a ForEach to iterate over categories
                    ForEach(categorizedLessons.keys.sorted(), id: \.self) { category in
                        Section(header: Text(category).foregroundColor(.primary).font(.subheadline).fontWeight(.bold)) {
                            // Layer another ForEach to iterate over lessons in this category
                            ForEach(categorizedLessons[category]!, id: \.id) { lesson in
                                HStack {
                                    Image(systemName: "snow").resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .background(Circle().fill(Color.gray.opacity(0.2)))
                                    .clipShape(Circle())

                                    VStack(alignment: .leading, spacing: 2) {
                                        HStack{
                                            Text(lesson.level)
                                                .font(.headline)
                                            Spacer()
                                            Text("\(lesson.guests) Guests")
                                                .font(.subheadline)
                                        }
                                        Text(lesson.time)
                                            .font(.subheadline)
                                        Text("Coach: \(lesson.coach)")
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                Text("todo")
            }
        }
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

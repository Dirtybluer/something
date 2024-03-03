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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

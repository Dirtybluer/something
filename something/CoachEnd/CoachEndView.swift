import SwiftUI

struct CoachEndView: View {
    
    @State private var selectedTab = "Schedule"
    @State private var viewingInstructorName = "Sammy"

    var body: some View {
        TabView(selection: $selectedTab) {
            ScheduleTabView(viewingInstructorName: viewingInstructorName)
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
            ProfileTabView(viewingInstructorName: $viewingInstructorName)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag("School")
        }
    }
}


struct CoachEndView_Previews: PreviewProvider {
    static var previews: some View {
        CoachEndView()
    }
}

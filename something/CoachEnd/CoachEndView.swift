import SwiftUI

struct CoachEndView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var selectedTab = "Schedule"

    var body: some View {
        TabView(selection: $selectedTab) {
            ScheduleTabView(context: viewContext)
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


struct CoachEndView_Previews: PreviewProvider {
    static var previews: some View {
        CoachEndView().environment(\.managedObjectContext, CoreDataStack.preview.persistentContainer.viewContext)
    }
}

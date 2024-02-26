import SwiftUI

struct DashboardView: View {
    // For demo purposes, let's assume these are some example data variables
    @State private var workoutsCompleted = 3
    @State private var upcomingEvents = 2
    @State private var studySessions = 4
    @State private var hydrationGoalMet = true
    @State private var mealPreps = 5
    @State private var sleepQuality = "Good"
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Welcome, Athlete")
                        .font(.title)
                        .padding(.top)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        DashboardStatView(title: "Workouts Completed", value: "\(workoutsCompleted)", color: .blue)
                        
                        DashboardStatView(title: "Upcoming Events", value: "\(upcomingEvents)", color: .green)
                        
                        DashboardStatView(title: "Study Sessions", value: "\(studySessions)", color: .purple)
                        
                        DashboardStatView(title: "Hydration Goal Met", value: hydrationGoalMet ? "Yes" : "No", color: hydrationGoalMet ? .green : .red)
                        
                        DashboardStatView(title: "Meal Preps", value: "\(mealPreps)", color: .orange)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                        DashboardStatView(title: "Sleep Quality", value: sleepQuality, color: .yellow)
                        
                    }
                    
                    .padding(.horizontal)
                    
                    
                    Text("Today's To-Dos")
                        .font(.title2)
                        .padding(.top, 20)
                    
                    DashboardTaskView(taskName: "Complete Workout Plan", isCompleted: false)
                    
                    DashboardTaskView(taskName: "Review Game Strategy", isCompleted: true)
                    
                    DashboardTaskView(taskName: "Attend Team Meeting", isCompleted: false)
                    
                    DashboardTaskView(taskName: "Study for Chemistry Exam", isCompleted: false)
                    
                    DashboardTaskView(taskName: "Meal Prep for Tomorrow", isCompleted: true)
                }
                .padding()
            }
            
            Divider()
            
            NavigationView {
                VStack {
                    // Other content
                    
                    NavigationBarButton(imageName: "person.circle", label: "Profile") {
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitle("Navigation Button Example")
            }
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

import SwiftUI

struct ProfileDataView: View {
    let title: String
    let value: String
    let tintColor: Color
    let editable: Bool 
    @State private var showingSheet = false
    var displayValue: String {
            if value.isEmpty {
                return ""
//                return "Enter \(title.lowercased())"
            } else {
                return value
            }
        }
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text(displayValue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if editable{
                Button(action: {
                    showingSheet.toggle()
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .imageScale(.medium)
                        .font(.title)
                        .foregroundColor(tintColor)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .background(
            Button(action: {
                // This action is empty, it's just here to capture the tap
                // and prevent it from triggering the sheet
            }) {
                EmptyView()
            }
            .buttonStyle(PlainButtonStyle())
        )
        .sheet(isPresented: $showingSheet) {
            EditProfileSheetView()
        }
    }
}

struct ProfileDataView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDataView(title: "Version", value: "", tintColor: Color(.systemGray), editable: true)
    }
}

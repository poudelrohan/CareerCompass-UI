import SwiftUI

struct UniversityPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var schoolName: String = "Bethune-Cookman University"
    @State private var showMajorAskPage = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Use the TitleBarView component
            TitleBarView()
            
            // Content area
            VStack {
                // Centered white box
                VStack(spacing: 24) {
                    // University Icon
                    Image(systemName: "building.columns.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    // Question Text
                    Text("Which school do you attend?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // School Name TextField
                    TextField("School Name", text: $schoolName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    // Buttons
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Text("Back")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            showMajorAskPage = true
                        }) {
                            Text("Next")
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 12)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding(40)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: 0)
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showMajorAskPage) {
            MajorAskPage()
        }
    }
}

#Preview {
    UniversityPage()
} 
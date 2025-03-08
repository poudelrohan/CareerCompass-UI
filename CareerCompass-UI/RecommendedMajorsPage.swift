import SwiftUI

struct RecommendedMajor: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}

struct RecommendedMajorsPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedMajor: UUID? = nil
    @State private var showSelectedMajorPage = false
    
    let recommendedMajors = [
        RecommendedMajor(
            name: "Computer Science",
            description: "Focus on software development, algorithms, and computing theory"
        ),
        RecommendedMajor(
            name: "Data Science",
            description: "Combine statistics, programming, and analytics"
        ),
        RecommendedMajor(
            name: "Information Technology",
            description: "Study networks, cybersecurity, and system administration"
        )
    ]
    
    var selectedMajorName: String {
        recommendedMajors.first { $0.id == selectedMajor }?.name ?? ""
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TitleBarView()
            
            ScrollView {
                VStack {
                    // Centered white box
                    VStack(spacing: 24) {
                        // Company Logo
                        Image(systemName: "briefcase.fill") // Replace with your company logo
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        // Title
                        Text("Here are your recommended majors:")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        // Major Options
                        VStack(spacing: 16) {
                            ForEach(recommendedMajors) { major in
                                Button(action: {
                                    selectedMajor = major.id
                                }) {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text(major.name)
                                            .font(.headline)
                                        Text(major.description)
                                            .font(.subheadline)
                                            .foregroundColor(selectedMajor == major.id ? .white : .gray)
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                                    .background(selectedMajor == major.id ? Color.blue : Color.gray.opacity(0.1))
                                    .foregroundColor(selectedMajor == major.id ? .white : .black)
                                    .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.vertical)
                        
                        // Back and Next Buttons
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
                                if selectedMajor != nil {
                                    showSelectedMajorPage = true
                                }
                            }) {
                                Text("Next")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(selectedMajor != nil ? Color.blue : Color.gray)
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
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showSelectedMajorPage) {
            SelectedMajorPage(majorName: selectedMajorName)
        }
    }
}

#Preview {
    RecommendedMajorsPage()
} 
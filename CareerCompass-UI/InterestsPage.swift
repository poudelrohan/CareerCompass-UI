import SwiftUI

struct Interest: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct InterestsPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var interests: [Interest] = [
        Interest(name: "Technology & Computing"),
        Interest(name: "Science & Research"),
        Interest(name: "Arts & Design"),
        Interest(name: "Business & Finance"),
        Interest(name: "Healthcare & Medicine"),
        Interest(name: "Education & Teaching"),
        Interest(name: "Engineering"),
        Interest(name: "Social Sciences"),
        Interest(name: "Environmental Studies"),
        Interest(name: "Communication & Media"),
        Interest(name: "Law & Legal Studies"),
        Interest(name: "Sports & Fitness"),
        Interest(name: "Music & Performance"),
        Interest(name: "Psychology & Counseling"),
        Interest(name: "Mathematics")
    ]
    @State private var showRecommendedMajors = false
    
    var body: some View {
        VStack(spacing: 0) {
            TitleBarView()
            
            // Content area
            ScrollView {
                VStack {
                    // Centered white box
                    VStack(spacing: 24) {
                        // Interest Icon
                        Image(systemName: "star.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.blue)
                        
                        // Question Text
                        Text("What interests you?")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Text("Select all that spark your curiosity")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        // Interests Grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 12) {
                            ForEach($interests) { $interest in
                                Button(action: {
                                    interest.isSelected.toggle()
                                }) {
                                    Text(interest.name)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(interest.isSelected ? Color.blue : Color.gray.opacity(0.1))
                                        .foregroundColor(interest.isSelected ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.vertical)
                        
                        // Navigation Buttons
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
                                showRecommendedMajors = true
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
                .frame(maxWidth: .infinity)
                .padding(.vertical)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor.systemGray6))
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $showRecommendedMajors) {
            RecommendedMajorsPage()
        }
    }
}

#Preview {
    InterestsPage()
} 
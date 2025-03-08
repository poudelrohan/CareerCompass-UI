import SwiftUI

struct MajorAskPage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedOption: String? = nil
    @State private var showInterestsPage = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Use the TitleBarView component
            TitleBarView()
            
            // Content area
            VStack {
                // Centered white box
                VStack(spacing: 24) {
                    // Major Icon
                    Image(systemName: "book.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    // Question Text
                    Text("Do you know your major?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    // Option Buttons
                    VStack(spacing: 16) {
                        Button(action: {
                            selectedOption = "yes"
                        }) {
                            Text("Yes, I know my major")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedOption == "yes" ? Color.blue : Color.gray.opacity(0.1))
                                .foregroundColor(selectedOption == "yes" ? .white : .black)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            selectedOption = "no"
                        }) {
                            Text("No, I would like to explore options")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(selectedOption == "no" ? Color.blue : Color.gray.opacity(0.1))
                                .foregroundColor(selectedOption == "no" ? .white : .black)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
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
                            if selectedOption == "no" {
                                showInterestsPage = true
                            }
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
        .navigationDestination(isPresented: $showInterestsPage) {
            InterestsPage()
        }
    }
}

#Preview {
    MajorAskPage()
} 
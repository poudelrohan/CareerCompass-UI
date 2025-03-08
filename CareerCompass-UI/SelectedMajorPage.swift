import SwiftUI

struct SelectedMajorPage: View {
    @Environment(\.dismiss) private var dismiss
    let majorName: String
    
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
                        
                        // Checkmark symbol
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.green)
                        
                        // Success Message
                        Text("You are all set!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        // Selected Major Box
                        VStack(alignment: .leading) {
                            Text("Your selected Major:")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text(majorName)
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        
                        // Description
                        Text("Get ready to explore your academic journey! We will help you navigate your path in \(majorName) with personalized resources and guidance.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        
                        // Start Journey Button
                        Button(action: {
                            // Action for starting journey
                        }) {
                            Text("Start Your Journey")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 32)
                                .padding(.vertical, 16)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                        
                        // Back Button
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
    }
}

#Preview {
    SelectedMajorPage(majorName: "Computer Science")
} 
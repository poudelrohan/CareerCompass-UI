import SwiftUI

struct TitleBarView: View {
    var body: some View {
        HStack {
            // Logo space
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 75)  // Adjust this value to make logo bigger/smaller
                //.padding(.leading)
            
            Spacer()
            
            // Navigation items
            HStack(spacing: 20) {
                NavigationLink("Home") {
                    // Destination view
                }
                
                NavigationLink("About") {
                    // Destination view
                }
                
                NavigationLink("Contact") {
                    // Destination view
                }
                
                Button(action: {
                    // Sign in action
                }) {
                    Text("Sign In")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding(.trailing)
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .shadow(radius: 2)
    }
}

#Preview {
    TitleBarView()
} 

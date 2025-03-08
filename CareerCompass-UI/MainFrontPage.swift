//
//  MainFrontPage.swift
//  CareerCompass-UI
//
//  Created by Rohan Poudel on 3/4/25.
//

import SwiftUI

struct MainFrontPage: View {
    @State private var showUniversityPage = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Use the TitleBarView component
                TitleBarView()
                
                // Content area
                VStack {
                    // Centered white box
                    VStack(spacing: 24) {
                        // Logo
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200) // Adjust this value to make logo bigger/smaller
                        
                        // Title
                        Text("Find Your Path")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                        
                        // Button
                        Button(action: {
                            showUniversityPage = true
                        }) {
                            Text("Begin Your Journey")
                                .font(.headline)
                                .padding(.horizontal, 32)
                                .padding(.vertical, 16)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding(40)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10, x: 0, y: 0)
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(UIColor.systemGray6)) // Light gray background
            }
            .navigationDestination(isPresented: $showUniversityPage) {
                UniversityPage()
            }
        }
    }
}

#Preview {
    MainFrontPage()
}

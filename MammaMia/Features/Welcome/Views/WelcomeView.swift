import SwiftUI

struct WelcomeView: View {
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Logo and App Name
            VStack(spacing: 16) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text("MAMMA")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                Text("MIA!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
            }
            
            Spacer()
            
            // Sign in buttons
            VStack(spacing: 16) {
                Button(action: {
                    // Google sign in would go here
                    isAuthenticated = true
                }) {
                    HStack {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Continue with Google")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
                }
                
                Button(action: {
                    // Apple sign in would go here
                    isAuthenticated = true
                }) {
                    HStack {
                        Image(systemName: "apple.logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        Text("Continue with Apple")
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
                }
                
                Text("Or")
                    .foregroundColor(.gray)
                    .padding(.vertical, 8)
                
                Button(action: {
                    // Create account would go here
                    isAuthenticated = true
                }) {
                    Text("Create account")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.customAccent)
                        .cornerRadius(30)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
                .frame(height: 40)
        }
        .background(Color(.systemBackground))
    }
}

#Preview {
    WelcomeView(isAuthenticated: .constant(false))
} 
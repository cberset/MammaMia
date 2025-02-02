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
            
            // Create Account Button
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
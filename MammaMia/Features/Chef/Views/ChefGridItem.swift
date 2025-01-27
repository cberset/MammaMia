import SwiftUI

struct ChefGridItem: View {
    let chef: Chef
    @State private var showProfile = false
    
    var body: some View {
        Button {
            showProfile = true
        } label: {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
                
                Text(chef.name)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 2)
            )
        }
        .sheet(isPresented: $showProfile) {
            ChefProfileView(profile: ChefProfile.from(chef))
        }
    }
}

#Preview {
    ChefGridItem(chef: Chef.sampleChefs[0])
        .padding()
        .background(Color(.systemGroupedBackground))
} 
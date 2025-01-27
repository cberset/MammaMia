import SwiftUI

struct ChefListView: View {
    let chefs: [Chef]
    @ObservedObject var viewModel: FindChefsViewModel
    
    var body: some View {
        List(chefs) { chef in
            ChefRow(chef: chef, viewModel: viewModel)
        }
        .listStyle(.plain)
    }
}

struct ChefRow: View {
    let chef: Chef
    @ObservedObject var viewModel: FindChefsViewModel
    @State private var showProfile = false
    
    var body: some View {
        Button {
            showProfile = true
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(chef.name)
                        .font(.headline)
                    Spacer()
                    HStack(spacing: 4) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", chef.rating))
                        Text("(\(chef.numberOfRatings))")
                            .foregroundColor(.gray)
                    }
                }
                
                HStack {
                    ForEach(chef.cuisines) { cuisine in
                        Text(cuisine.name)
                            .font(.subheadline)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
                
                Text(viewModel.distanceString(to: chef.location))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        }
        .sheet(isPresented: $showProfile) {
            ChefProfileView(profile: ChefProfile.from(chef))
        }
    }
}

#Preview {
    let viewModel = FindChefsViewModel()
    return ChefListView(chefs: Chef.sampleChefs, viewModel: viewModel)
} 
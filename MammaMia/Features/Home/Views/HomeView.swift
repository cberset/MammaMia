import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var showingProfile = false
    
    private let accentColor = Color(red: 239/255, green: 65/255, blue: 54/255) // Red color
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                searchBar
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredCuisines) { cuisine in
                            CuisineCard(cuisine: cuisine)
                                .onTapGesture {
                                    appViewModel.showChefs(forCuisine: cuisine)
                                }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("MammaMia")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingProfile = true
                    } label: {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 32)
                            .clipShape(Circle())
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileView(profile: .sample)
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search for cuisines...", text: $viewModel.searchText)
                .textFieldStyle(PlainTextFieldStyle())
            
            if !viewModel.searchText.isEmpty {
                Button(action: { viewModel.searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(accentColor)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding()
    }
}

struct CuisineCard: View {
    let cuisine: Cuisine
    private let accentColor = Color(red: 239/255, green: 65/255, blue: 54/255) // Red color
    
    var body: some View {
        VStack {
            Text(cuisine.emoji)
                .font(.system(size: 60))
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .background(accentColor.opacity(0.1))
                .cornerRadius(12)
            
            Text(cuisine.name)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppViewModel())
} 
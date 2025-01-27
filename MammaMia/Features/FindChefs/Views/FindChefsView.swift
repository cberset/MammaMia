import SwiftUI

struct FindChefsView: View {
    @StateObject private var viewModel = FindChefsViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    let selectedCuisine: Cuisine?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search chefs or cuisines...", text: $viewModel.searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                    
                    if !viewModel.searchText.isEmpty {
                        Button(action: {
                            viewModel.clearSelection()
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()
                
                // Selected cuisine pill (if any)
                if let cuisine = viewModel.selectedCuisine {
                    HStack {
                        Text(cuisine.name)
                            .font(.subheadline)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.customAccent.opacity(0.1))
                            .foregroundColor(.customAccent)
                            .cornerRadius(15)
                        
                        Button(action: {
                            viewModel.clearSelection()
                            appViewModel.selectedCuisine = nil
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.customAccent)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 12)
                }
                
                // View toggle
                Picker("View", selection: $viewModel.isShowingMap) {
                    Text("List").tag(false)
                    Text("Map").tag(true)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom, 16)
                
                // Content
                if viewModel.isShowingMap {
                    ZStack {
                        ChefMapView(chefs: viewModel.filteredChefs, region: $viewModel.region)
                        
                        // Add a safe area spacer at the bottom
                        VStack {
                            Spacer()
                            Color.clear
                                .frame(height: 0)
                                .background(.clear)
                        }
                    }
                } else {
                    ChefListView(chefs: viewModel.filteredChefs, viewModel: viewModel)
                }
            }
            .navigationTitle("Find Chefs")
        }
        .onAppear {
            viewModel.selectCuisine(selectedCuisine)
        }
    }
}

#Preview {
    FindChefsView(selectedCuisine: nil)
        .environmentObject(AppViewModel())
} 
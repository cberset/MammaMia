import SwiftUI

struct MainTabView: View {
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some View {
        TabView(selection: $appViewModel.selectedTab) {
            HomeView()
                .environmentObject(appViewModel)
                .environmentObject(cartViewModel)
                .tabItem {
                    Label(Tab.home.title, systemImage: Tab.home.systemImage)
                }
                .tag(Tab.home)
            
            FindChefsView(selectedCuisine: appViewModel.selectedCuisine)
                .environmentObject(appViewModel)
                .environmentObject(cartViewModel)
                .tabItem {
                    Label(Tab.findChefs.title, systemImage: Tab.findChefs.systemImage)
                }
                .tag(Tab.findChefs)
            
            CartView()
                .environmentObject(cartViewModel)
                .tabItem {
                    Label(Tab.cart.title, systemImage: Tab.cart.systemImage)
                }
                .tag(Tab.cart)
        }
        .tint(.customAccent)
    }
}

#Preview {
    MainTabView()
} 
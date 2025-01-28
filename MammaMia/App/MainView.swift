import SwiftUI

struct MainView: View {
    @State private var isAuthenticated = false
    @StateObject private var appViewModel = AppViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    
    var body: some View {
        Group {
            if isAuthenticated {
                TabView(selection: $appViewModel.selectedTab) {
                    HomeView()
                        .environmentObject(appViewModel)
                        .tabItem {
                            Label(Tab.home.title, systemImage: Tab.home.systemImage)
                        }
                        .tag(Tab.home)
                    
                    FindChefsView(selectedCuisine: appViewModel.selectedCuisine)
                        .environmentObject(appViewModel)
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
                    
                    OrderView()
                        .environmentObject(cartViewModel)
                        .tabItem {
                            Label(Tab.orders.title, systemImage: Tab.orders.systemImage)
                        }
                        .tag(Tab.orders)
                }
                .environmentObject(cartViewModel)
                .tint(.customAccent)
            } else {
                WelcomeView(isAuthenticated: $isAuthenticated)
            }
        }
    }
}

#Preview {
    MainView()
} 
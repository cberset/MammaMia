import SwiftUI

struct OrderView: View {
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if let activeOrder = cartViewModel.activeOrder {
                    activeOrderView(activeOrder)
                } else {
                    noOrderView
                }
            }
            .navigationTitle("Current Order")
        }
    }
    
    private func activeOrderView(_ order: Order) -> some View {
        ScrollView {
            VStack(spacing: 20) {
                // Order Status
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.customAccent)
                        Text("Ready for pickup at:")
                            .font(.headline)
                        Spacer()
                        Text(order.estimatedReadyTime, style: .time)
                            .font(.headline)
                            .foregroundColor(.customAccent)
                    }
                    
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.customAccent)
                        VStack(alignment: .leading) {
                            Text("Pickup Address:")
                                .font(.headline)
                            Text(order.chefAddress)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Order Details
                VStack(alignment: .leading, spacing: 16) {
                    Text("Order Details")
                        .font(.headline)
                    
                    ForEach(order.items) { item in
                        HStack {
                            Text("\(item.quantity)x \(item.dish.name)")
                            Spacer()
                            Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: item.total).doubleValue))
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: order.totalAmount).doubleValue))
                            .font(.title3)
                            .bold()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Chef Info
                VStack(alignment: .leading, spacing: 16) {
                    Text("Chef Information")
                        .font(.headline)
                    
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.title)
                            .foregroundColor(.customAccent)
                        
                        VStack(alignment: .leading) {
                            Text(order.chefName)
                                .font(.headline)
                            Text("Your chef for this order")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
            .padding()
        }
    }
    
    private var noOrderView: some View {
        VStack(spacing: 20) {
            Image(systemName: "bag")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No Active Orders")
                .font(.headline)
            
            Text("Your orders will appear here once you place them.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(CartViewModel())
} 
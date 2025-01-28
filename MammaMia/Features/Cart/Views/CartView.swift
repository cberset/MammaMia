import SwiftUI

struct CartView: View {
    @EnvironmentObject private var viewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isEmpty {
                    emptyCartView
                } else {
                    cartContentView
                }
            }
            .navigationTitle("Cart")
        }
    }
    
    private var emptyCartView: some View {
        VStack(spacing: 20) {
            Image(systemName: "cart")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("Your cart is empty")
                .font(.headline)
            
            Text("Add some delicious dishes from our chefs!")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
    
    private var cartContentView: some View {
        VStack {
            List {
                ForEach(viewModel.items) { item in
                    CartItemRow(item: item, onQuantityChange: { newQuantity in
                        viewModel.updateQuantity(for: item.id, to: newQuantity)
                    })
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewModel.removeFromCart(itemId: viewModel.items[index].id)
                    }
                }
            }
            
            VStack(spacing: 16) {
                HStack {
                    Text("Total")
                        .font(.headline)
                    Spacer()
                    Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: viewModel.totalAmount).doubleValue))
                        .font(.title3)
                        .bold()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Number of meals:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("\(viewModel.itemCount)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // TODO: Implement checkout
                }) {
                    Text("Checkout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.customAccent)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .background(Color(.systemBackground))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Clear") {
                    viewModel.clearCart()
                }
                .foregroundColor(.gray)
            }
        }
    }
}

struct CartItemRow: View {
    let item: CartItem
    let onQuantityChange: (Int) -> Void
    @State private var quantity: Int
    @EnvironmentObject private var viewModel: CartViewModel
    
    init(item: CartItem, onQuantityChange: @escaping (Int) -> Void) {
        self.item = item
        self.onQuantityChange = onQuantityChange
        self._quantity = State(initialValue: item.quantity)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(item.dish.name)
                    .font(.headline)
                Spacer()
                Button {
                    viewModel.removeFromCart(itemId: item.id)
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.gray)
                }
            }
            
            Text("By \(item.chefName)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                    .labelsHidden()
                
                Text("Quantity: \(quantity)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Text("Price per item:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: item.dish.price).doubleValue))
                    .font(.subheadline)
            }
            
            HStack {
                Text("Subtotal:")
                    .font(.subheadline)
                Spacer()
                Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: item.total).doubleValue))
                    .font(.headline)
            }
        }
        .padding(.vertical, 4)
        .onChange(of: quantity) { newValue in
            onQuantityChange(newValue)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
} 
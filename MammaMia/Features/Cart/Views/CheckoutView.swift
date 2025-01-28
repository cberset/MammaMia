import SwiftUI

struct CheckoutView: View {
    let cartItems: [CartItem]
    let totalAmount: Decimal
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var cartViewModel: CartViewModel
    @State private var selectedPaymentMethod: PaymentMethod?
    @State private var showingConfirmation = false
    @State private var isProcessing = false
    private let estimatedTime = 20 // minutes
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Order Summary
                VStack(alignment: .leading, spacing: 16) {
                    Text("Order Summary")
                        .font(.headline)
                    
                    ForEach(cartItems) { item in
                        HStack {
                            Text("\(item.quantity)x \(item.dish.name)")
                            Spacer()
                            Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: item.total).doubleValue))
                                .foregroundColor(.secondary)
                        }
                        Text("From \(item.chefName)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Total")
                            .font(.headline)
                        Spacer()
                        Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: totalAmount).doubleValue))
                            .font(.title3)
                            .bold()
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Payment Method Selection
                VStack(alignment: .leading, spacing: 16) {
                    Text("Select Payment Method")
                        .font(.headline)
                    
                    ForEach(PaymentMethod.sampleMethods) { method in
                        PaymentMethodButton(
                            method: method,
                            isSelected: selectedPaymentMethod?.id == method.id,
                            action: { selectedPaymentMethod = method }
                        )
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Spacer()
                
                // Pay Button
                Button(action: {
                    isProcessing = true
                    // Simulate payment processing
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isProcessing = false
                        cartViewModel.confirmOrder()
                        showingConfirmation = true
                    }
                }) {
                    if isProcessing {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Pay")
                            .font(.headline)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(selectedPaymentMethod != nil ? Color.customAccent : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                .disabled(selectedPaymentMethod == nil || isProcessing)
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.customAccent)
                }
            }
            .alert("Order Confirmed!", isPresented: $showingConfirmation) {
                Button("OK") {
                    dismiss()
                }
            } message: {
                Text("Your order has been successfully placed and will be ready for pickup in approximately \(estimatedTime) minutes.")
            }
        }
    }
}

struct PaymentMethodButton: View {
    let method: PaymentMethod
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: method.type.systemImage)
                    .foregroundColor(.customAccent)
                
                VStack(alignment: .leading) {
                    Text(method.type.name)
                        .font(.headline)
                    if !method.lastFourDigits.isEmpty {
                        Text("•••• \(method.lastFourDigits)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(isSelected ? .customAccent : .gray)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.customAccent : Color.gray, lineWidth: 1)
            )
        }
    }
}

#Preview {
    CheckoutView(
        cartItems: [
            CartItem(dish: Dish.marcoSpecialities[0], chefName: "Marco Rossi", quantity: 2)
        ],
        totalAmount: 49.80
    )
} 
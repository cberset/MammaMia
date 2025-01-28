import SwiftUI

struct ProfileView: View {
    let profile: UserProfile
    @Environment(\.dismiss) private var dismiss
    @State private var showingAddPayment = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal Information") {
                    InfoRow(title: "Name", value: profile.name)
                    InfoRow(title: "Email", value: profile.email)
                    InfoRow(title: "Phone", value: profile.phoneNumber)
                    InfoRow(title: "Address", value: profile.address)
                }
                
                Section {
                    ForEach(profile.paymentMethods) { method in
                        PaymentMethodRow(method: method)
                    }
                    
                    Button {
                        showingAddPayment = true
                    } label: {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.customAccent)
                            Text("Add Payment Method")
                                .foregroundColor(.customAccent)
                        }
                    }
                } header: {
                    Text("Payment Methods")
                } footer: {
                    Text("Your payment information is securely stored")
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .sheet(isPresented: $showingAddPayment) {
                AddPaymentMethodView()
            }
        }
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
        }
    }
}

struct PaymentMethodRow: View {
    let method: PaymentMethod
    
    var body: some View {
        HStack {
            Image(systemName: method.type.systemImage)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(method.type.name)
                    if method.isDefault {
                        Text("Default")
                            .font(.caption)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.blue.opacity(0.1))
                            .foregroundColor(.blue)
                            .cornerRadius(4)
                    }
                }
                
                if !method.lastFourDigits.isEmpty {
                    Text("•••• \(method.lastFourDigits)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
            
            if !method.expiryDate.isEmpty {
                Text(method.expiryDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct AddPaymentMethodView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    // TODO: Implement card scanning
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "camera.fill")
                            .foregroundColor(.customAccent)
                        Text("Scan Card")
                    }
                }
                
                Button {
                    // TODO: Implement manual card entry
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "creditcard")
                            .foregroundColor(.customAccent)
                        Text("Enter Card Details")
                    }
                }
                
                Button {
                    // TODO: Implement TWINT setup
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "iphone")
                            .foregroundColor(.customAccent)
                        Text("Set up TWINT")
                    }
                }
            }
            .navigationTitle("Add Payment Method")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView(profile: .sample)
} 
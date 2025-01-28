import SwiftUI

struct ChefProfileView: View {
    let profile: ChefProfile
    @Environment(\.dismiss) private var dismiss
    @State private var selectedDish: Dish?
    @State private var showingQuantitySheet = false
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header with chef image and basic info
                    HStack(spacing: 20) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(profile.name)
                                .font(.title)
                                .bold()
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text(String(format: "%.1f", profile.rating))
                                Text("•")
                                Text("\(profile.yearsOfExperience) years of experience")
                            }
                            .foregroundColor(.secondary)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Bio
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About")
                            .font(.headline)
                        Text(profile.bio)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    // Specialities
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Specialities")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(profile.specialities) { dish in
                                    DishCard(dish: dish)
                                        .onTapGesture {
                                            selectedDish = dish
                                        }
                                        .padding(.vertical, 4)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        }
                    }
                    
                    // Regular Menu
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Menu")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(profile.regularMenu) { dish in
                            MenuItemRow(dish: dish)
                                .onTapGesture {
                                    selectedDish = dish
                                }
                        }
                    }
                }
                .padding(.vertical)
            }
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
            .sheet(item: $selectedDish) { dish in
                AddToCartSheet(dish: dish, chefName: profile.name)
                    .environmentObject(cartViewModel)
            }
            .overlay {
                if cartViewModel.showingAddedToCart, let itemName = cartViewModel.lastAddedItem {
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("\(itemName) added to cart")
                                .font(.subheadline)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(25)
                        .padding(.bottom, 20)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeInOut, value: cartViewModel.showingAddedToCart)
        }
    }
}

struct DishCard: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .foregroundColor(.customAccent)
            
            Text(dish.name)
                .font(.headline)
                .lineLimit(1)
            
            Text(dish.description)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: dish.price).doubleValue))
                .fontWeight(.semibold)
                .foregroundColor(.customAccent)
        }
        .frame(width: 200)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}

struct MenuItemRow: View {
    let dish: Dish
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(dish.name)
                    .font(.headline)
                Spacer()
                Text(String(format: "CHF %.2f", NSDecimalNumber(decimal: dish.price).doubleValue))
                    .fontWeight(.semibold)
                    .foregroundColor(.customAccent)
            }
            
            Text(dish.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "clock")
                Text("\(dish.preparationTime) min")
                if !dish.allergens.isEmpty {
                    Text("•")
                    Text("Contains: \(dish.allergens.joined(separator: ", "))")
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct AddToCartSheet: View {
    let dish: Dish
    let chefName: String
    @State private var quantity = 1
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text(dish.name)
                    .font(.title2)
                    .bold()
                
                Text("From \(chefName)")
                    .foregroundColor(.secondary)
                
                Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                    .padding()
                
                Text(String(format: "Total: CHF %.2f", NSDecimalNumber(decimal: dish.price * Decimal(quantity)).doubleValue))
                    .font(.headline)
                
                Button(action: {
                    cartViewModel.addToCart(dish: dish, chefName: chefName, quantity: quantity)
                    dismiss()
                }) {
                    Text("Add to Cart")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.customAccent)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Add to Cart", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.customAccent)
                }
            }
        }
    }
}

#Preview {
    ChefProfileView(profile: .marcoRossi)
        .environmentObject(CartViewModel())
} 
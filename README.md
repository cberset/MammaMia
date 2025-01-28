# MammaMia - Connect with Local Home Chefs 🍝

A mobile application that connects food enthusiasts with local home chefs, enabling users to discover, order, and enjoy homemade meals from their neighborhood.

## 📱 Project Overview

MammaMia is a SwiftUI-based iOS application designed to revolutionize the way people access homemade food in their local communities. By connecting passionate home chefs with food enthusiasts, we're creating a marketplace for authentic, homemade culinary experiences.

## 🌟 Features

### For Customers
- **Interactive Map Interface** 🗺️
  - Real-time location-based discovery of home chefs
  - Visual representation of chef locations with custom pins
  - Distance and estimated delivery time calculations

- **Chef Profiles & Menus** 👨‍🍳
  - Detailed chef profiles with ratings and reviews
  - Daily/weekly menu updates
  - Food photos and detailed descriptions
  - Pricing and portion information
  - Dietary restrictions and allergen information

- **Ordering System** 🛒
  - Intuitive cart management
  - Multiple items from different chefs
  - Special instructions and customization options
  - Order scheduling for future dates

- **Payment Integration** 💳
  - Secure payment processing
  - Multiple payment methods support
  - Split payment options
  - Digital wallet integration

- **Order Tracking** 📍
  - Real-time delivery tracking
  - Push notifications for order updates
  - Delivery ETA updates
  - Direct communication with delivery personnel

### For Chefs
- **Chef Dashboard** 📊
  - Menu management system
  - Order management and tracking
  - Earnings analytics
  - Customer feedback and ratings

## 🛠 Technical Architecture

### Core Technology Stack
- **Frontend**
  - SwiftUI for iOS UI development
  - Shared Kotlin Multiplatform Mobile (KMM) core for future Android support
  - Domain logic in Swift packages for potential web reuse
  
- **Backend**
  - Supabase for authentication and database
  - PostgreSQL for data storage

### Maps & Location Services
- **Mapping Services**
  - Google Maps / Mapbox integration
  - Geolocation services
  - Distance matrix calculations
  - Geocoding and reverse geocoding

### Payment Processing
- **Payment Gateway**
  - Stripe/PayPal/Twint integration
  - Secure payment processing
  - Swiss Franks as initial currency

## 📁 Project Structure
```
MammaMia/
├── App/
│   ├── MammaMiaApp.swift          # App entry point
│   └── AppDelegate.swift          # App configuration
│
├── Features/
│   ├── Authentication/            # User authentication
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   └── Models/
│   │
│   ├── Map/                       # Map interface
│   │   ├── Views/
│   │   ├── ViewModels/
│   │   └── Services/
│   │
│   ├── Chef/                      # Chef features
│   │   ├── Profile/
│   │   ├── Menu/
│   │   └── Dashboard/
│   │
│   ├── Order/                     # Order management
│   │   ├── Cart/
│   │   ├── Checkout/
│   │   └── Tracking/
│   │
│   └── Payment/                   # Payment processing
│       ├── Services/
│       └── Models/
│
├── Core/
│   ├── Network/                   # Networking layer
│   ├── Database/                  # Local storage
│   ├── Common/                    # Shared utilities
│   └── Extensions/               
│
├── Resources/
│   ├── Assets.xcassets/
│   ├── Localizations/
│   └── Fonts/
│
├── Tests/
│   ├── UnitTests/
│   └── UITests/
│
└── Config/
    ├── Info.plist
    ├── Debug.xcconfig
    └── Release.xcconfig
```

## 🔧 Development Setup

### Prerequisites
- Xcode 15.0 or later
- iOS 16.0+ deployment target
- Swift 5.9 or later
- CocoaPods or Swift Package Manager
- Supabase account
- Payment gateway account (Stripe/PayPal/Twint)
- Google Maps/Mapbox API key

The app follows a clean architecture approach with:
- MVVM design pattern
- SwiftUI for the UI layer
- Combine for reactive programming
- Environment Objects for dependency injection

## License

This project is licensed under the MIT License - see the LICENSE file for details 
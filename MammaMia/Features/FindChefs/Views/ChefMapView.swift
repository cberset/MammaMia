import SwiftUI
import MapKit

struct ChefMapView: View {
    let chefs: [Chef]
    @Binding var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: chefs) { chef in
            MapAnnotation(coordinate: chef.location) {
                VStack(spacing: 8) {
                    Image(systemName: "person.circle.fill")
                        .font(.title)
                        .foregroundColor(.customAccent)
                    Text(chef.name)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                }
                .padding(4)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ChefMapView(
        chefs: Chef.sampleChefs,
        region: .constant(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 47.3769, longitude: 8.5417),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    )
} 
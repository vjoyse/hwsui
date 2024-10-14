//
//  03_Importing_Maps.swift
//  BucketList
//
//  Created by Joyse Vargas on 9/10/24.
//

import SwiftUI
import MapKit

struct Location_test: Identifiable {
    let id = UUID()
    let name : String
    let coordinate: CLLocationCoordinate2D
}

struct _3_Importing_Maps: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locaations = [
        Location_test(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location_test(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locaations){
            location in
            MapAnnotation(coordinate: location.coordinate) {
                NavigationLink {
                    Text(location.name)
                } label: {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 44, height: 44)
//                        .onTapGesture {
//                            print("Tapped on \(location.name)")
//                        }
                }
            }
        }
        .navigationTitle("London Explorer")
    }
}

#Preview {
    _3_Importing_Maps()
}

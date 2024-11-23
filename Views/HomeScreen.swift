//
//  HomeScreen.swift
//  FindYourRestroom
//
//  Created by Andersson on 22/11/24.
//

import SwiftUI
import Combine

struct HomeScreen: View {
    @ObservedObject private var locationManager = LocationManager()
    @EnvironmentObject var store: Store<AppState>
    @State private var cancellables: AnyCancellable? = nil
    
    struct Props {
        let restrooms: [RestroomModel]
        let onFetchRestroomsByLocation: (Double, Double) -> Void
    }
    
    private func map(state: RestroomState) -> Props {
        Props(restrooms: state.restrooms, onFetchRestroomsByLocation: {(lat, lng) in
            store.dispatch(action: FetchRestroomsAction(latitude: lat, longitude: lng))
        })
    }
    
    var body: some View {
        let props = map(state: store.state.restrooms)
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(maxWidth: .infinity, maxHeight: 44)
            HStack {
                Text("Find Your Restroom")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {
                    locationManager.updateLocation()
                }) {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                        .foregroundStyle(Color.white)
                }
            }.padding()
            List(props.restrooms, id: \.id) { restroom in
                RestroomCell(restroom: restroom)
            }
            .listStyle(PlainListStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.indigo)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.cancellables = locationManager.$location.sink { location in
                if let location = location {
                    props.onFetchRestroomsByLocation(
                        location.coordinate.latitude, location.coordinate.longitude)
                }
            }
        }
    }
}

struct RestroomCell: View {
    let restroom: RestroomModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(restroom.name ?? "No name")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text(String(format: "%.2f miles", restroom.distance))
                    .font(.subheadline.italic())
                    .foregroundColor(.secondary)
            }.padding([.top], 10)
            Text(restroom.address)
                .font(.subheadline)
                .opacity(0.5)
            Button("Directions") {
                guard let targetURL = URL(
                    string: "https://maps.apple.com/?address=\(restroom.address.encodeURL() ?? "")")
                else { return }
                if UIApplication.shared.canOpenURL(targetURL) {
                    UIApplication.shared.open(targetURL)
                }
            }
            .font(.caption)
            .foregroundStyle(Color.white)
            .padding(6)
            .background(Color.purple)
            .presentationCornerRadius(6)
            Text(restroom.comment ?? "No comment")
                .font(.footnote)
            HStack {
                Text(restroom.accessible ? "♿️" : "❌")
            }
        }
    }
}

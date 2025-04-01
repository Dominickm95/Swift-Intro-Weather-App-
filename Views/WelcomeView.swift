//
//  WelcomeView.swift
//  Order System 1.1
//
//  Created by Dominick Mason on 3/31/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack(spacing: 200) {
            VStack{
                Text("Welcome To Your Personal Weather App")
                    .bold().font(.title)
                Text("Please share your current location to get the weather in your area.").padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

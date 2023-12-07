//
//  DetailsView.swift
//  APIWeatherApp
//
//  Created by Mac on 06/12/2023.
//

import SwiftUI

struct DetailsView: View {
    
    let city: City
    
    var body: some View {
        VStack(alignment: .leading){
            Text(String(city.dt))
                .font(.largeTitle)
                .bold()
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
            
            Group{
                
                HStack(alignment: .top){
                    Text("Temperature: ")
                        .bold()
                    
                    Text(String(city.main.temp))
                        
                }
                
                HStack(alignment: .top){
                    Text("Feels Like: ")
                        .bold()
                    
                    Text(String(city.main.feels_like))
                        
                }
                
                HStack(alignment: .top){
                    Text("Humidity: ")
                        .bold()
                    
                    Text(String(city.main.humidity))
                        
                }
                
            }
            .font(.title2)
            
            
            
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(city: City(dt: 111111, main: CityDetails(temp: 0.0, feels_like: 0.0, humidity: 0.0)))
    }
}

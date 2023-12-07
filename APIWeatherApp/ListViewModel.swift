//
//  ListViewModel.swift
//  APIWeatherApp
//
//  Created by Mac on 06/12/2023.
//

import Foundation

@MainActor
class ListViewModel: ObservableObject{
    struct Returned: Codable {
        var list: [City]
        
    }
    
    @Published var cities: [City] = []
    private var base_urlString = "https://api.openweathermap.org/data/2.5/forecast?id=524901&appid="
    private var api_key = "13c1a8f9f3e692ae25cee4bec1b6d70a"
    
    func sortCities(){
        cities = cities.sorted(by: {$0.dt < $1.dt})
    }
    
    
    
    func getData() async {
        
        let urlString = base_urlString + api_key
        guard let url = URL(string: urlString ) else { return}
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            
            do{
                let returned = try JSONDecoder().decode(Returned.self, from: data)
                cities += returned.list
                
            }catch{
                //TODO handle json error
                print("Failed to decode")
            }
        }catch{
            //TODO handle data retreiving error
            print("Failed to read data from api")
        }
    }
    
}

//
//  ContentView.swift
//  APIWeatherApp
//
//  Created by Mac on 06/12/2023.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var listVM = ListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            VStack {
                List(searchResults){ city in
                    NavigationLink { DetailsView(city: city)
                        
                    } label: {
                        Text(String(city.dt))
                    }

                }
                .font(.title)
                .listStyle(.plain)
            .navigationTitle("Cities")
            .searchable(text: $searchText)
//                {
//                if searchResults.count < listVM.cities.count{
//                    ForEach (searchResults, id: \.self){ result in
//                        NavigationLink(destination: {
//                            DetailsView(city: result)
//                        }, label:{
//                            Text(String(result.dt)).searchCompletion(String(result.dt))
//                        })
//                    }
//                }
//
//            }
                
                
                Button {
                    listVM.sortCities()
                } label: {
                    Text("SORT")
                        .bold()
                }
                

            }
            
            
            
        }
        .task{
            await listVM.getData()
        }
        
    }
    
    var searchResults: [City]{
        if searchText.isEmpty{
            return listVM.cities
        }
        
        return listVM.cities.filter({String($0.dt).contains(searchText)})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

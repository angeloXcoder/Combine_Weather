//
//  NewtworkLayer.swift
//  Combine_Weather
//
//  Created by Eng Angelo E Saber on 12/22/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//

import Foundation
import Combine
enum ServiceError: Error {
    case url(URLError?) 
    case decode
    case unknown(Error)
}

class NewtorkLayer {
    
    
    
    
    func fetchWeather() -> AnyPublisher<Main, Error> {
        let url = "https://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=3a847ee8b38c7eff155883810de0b0c5"
        guard let weatherUrl = URL(string: url) else {
            fatalError("Invaild URL")
        }
        return URLSession.shared.dataTaskPublisher(for: weatherUrl)
            .map { $0.data }
            .decode(type: Weather_Model.self, decoder: JSONDecoder() )
            .map {  $0.main }
            .receive(on: RunLoop.main)
            .mapError { error -> ServiceError in
                switch error {
                case is DecodingError: return ServiceError.decode
                case is URLError: return ServiceError.url(error as? URLError)
                default: return ServiceError.unknown(error)
                }
        }
        .eraseToAnyPublisher()
        
        
        
        
        
        
        
        
    }
}

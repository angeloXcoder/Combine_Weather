//
//  AppDelegate.swift
//  Combine_Weather
//
//  Created by Eng Angelo E Saber on 12/22/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//


import Foundation
struct Main : Codable {
	var temp : Double?
	var pressure : Int?
	var humidity : Int?
	var temp_min : Double?
	var temp_max : Double?
    
    static var mainPlaceHolder : Main {
        return Main.init(temp: nil, pressure: nil, humidity: nil, temp_min: nil, temp_max: nil)
    }
    
    init(temp : Double? ,pressure : Int?, humidity : Int?,temp_min : Double?, temp_max : Double?) {
        self.temp = temp
         self.pressure = pressure
         self.humidity = humidity
         self.temp_min = temp_min
         self.temp_max = temp_max
    }

	enum CodingKeys: String, CodingKey {

		case temp = "temp"
		case pressure = "pressure"
		case humidity = "humidity"
		case temp_min = "temp_min"
		case temp_max = "temp_max"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		temp = try values.decodeIfPresent(Double.self, forKey: .temp)
		pressure = try values.decodeIfPresent(Int.self, forKey: .pressure)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		temp_min = try values.decodeIfPresent(Double.self, forKey: .temp_min)
		temp_max = try values.decodeIfPresent(Double.self, forKey: .temp_max)
	}

}

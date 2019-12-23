//
//  AppDelegate.swift
//  Combine_Weather
//
//  Created by Eng Angelo E Saber on 12/22/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//


import Foundation
struct Wind : Codable {
	let speed : Double?
	let deg : Int?

	enum CodingKeys: String, CodingKey {

		case speed = "speed"
		case deg = "deg"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		speed = try values.decodeIfPresent(Double.self, forKey: .speed)
		deg = try values.decodeIfPresent(Int.self, forKey: .deg)
	}

}

//
//  AppDelegate.swift
//  Combine_Weather
//
//  Created by Eng Angelo E Saber on 12/22/19.
//  Copyright © 2019 Eng Angelo E Saber. All rights reserved.
//


import Foundation
struct Clouds : Codable {
	let all : Int?

	enum CodingKeys: String, CodingKey {

		case all = "all"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		all = try values.decodeIfPresent(Int.self, forKey: .all)
	}

}

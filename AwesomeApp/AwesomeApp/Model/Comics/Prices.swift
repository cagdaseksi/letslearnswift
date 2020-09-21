//
//  Prices.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
struct Prices : Codable {
	let type : String?
	let price : Double?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case price = "price"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
	}

}

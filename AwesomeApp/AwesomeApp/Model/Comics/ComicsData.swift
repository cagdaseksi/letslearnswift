//
//  ComicsData.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation

struct ComicsData : Codable {
	let offset : Int?
	let limit : Int?
	let total : Int?
	let count : Int?
	let results : [ComicsResults]?

	enum CodingKeys: String, CodingKey {

		case offset = "offset"
		case limit = "limit"
		case total = "total"
		case count = "count"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		offset = try values.decodeIfPresent(Int.self, forKey: .offset)
		limit = try values.decodeIfPresent(Int.self, forKey: .limit)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		results = try values.decodeIfPresent([ComicsResults].self, forKey: .results)
	}

}

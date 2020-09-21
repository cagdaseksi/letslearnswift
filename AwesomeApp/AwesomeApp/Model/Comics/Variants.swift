//
//  Variants.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
struct Variants : Codable {
	let resourceURI : String?
	let name : String?

	enum CodingKeys: String, CodingKey {

		case resourceURI = "resourceURI"
		case name = "name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}

//
//  TextObjects.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
struct TextObjects : Codable {
	let type : String?
	let language : String?
	let text : String?

	enum CodingKeys: String, CodingKey {

		case type = "type"
		case language = "language"
		case text = "text"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		text = try values.decodeIfPresent(String.self, forKey: .text)
	}

}

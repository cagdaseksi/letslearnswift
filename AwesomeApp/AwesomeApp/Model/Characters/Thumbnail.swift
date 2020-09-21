//
//  Thumbnail.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//
import Foundation
struct Thumbnail : Codable {
	let path : String?
	let extension1 : String?

	enum CodingKeys: String, CodingKey {

		case path = "path"
		case extension1 = "extension"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		extension1 = try values.decodeIfPresent(String.self, forKey: .extension1)
	}

}

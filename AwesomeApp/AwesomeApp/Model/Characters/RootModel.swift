//
//  RootModel.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//
import Foundation

struct RootModel : Codable {
	let code : Int?
	let status : String?
	let copyright : String?
	let attributionText : String?
	let attributionHTML : String?
	let etag : String?
	let data : Data?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case copyright = "copyright"
		case attributionText = "attributionText"
		case attributionHTML = "attributionHTML"
		case etag = "etag"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
		attributionText = try values.decodeIfPresent(String.self, forKey: .attributionText)
		attributionHTML = try values.decodeIfPresent(String.self, forKey: .attributionHTML)
		etag = try values.decodeIfPresent(String.self, forKey: .etag)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
	}

}

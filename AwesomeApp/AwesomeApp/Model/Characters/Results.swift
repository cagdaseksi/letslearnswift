//
//  Results.swift
//  AwesomeApp
//
//  Created by MAC on 19.09.2020.
//  Copyright © 2020 cagdaseksi. All rights reserved.
//

import Foundation
struct Results : Codable {
	let id : Int?
	let name : String?
	let description : String?
	let modified : String?
	let thumbnail : Thumbnail?
	let resourceURI : String?
	let comics : Comics?
	let series : Series?
	let stories : Stories?
	let events : Events?
	let urls : [Urls]?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
		case description = "description"
		case modified = "modified"
		case thumbnail = "thumbnail"
		case resourceURI = "resourceURI"
		case comics = "comics"
		case series = "series"
		case stories = "stories"
		case events = "events"
		case urls = "urls"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		modified = try values.decodeIfPresent(String.self, forKey: .modified)
		thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
		resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
		comics = try values.decodeIfPresent(Comics.self, forKey: .comics)
		series = try values.decodeIfPresent(Series.self, forKey: .series)
		stories = try values.decodeIfPresent(Stories.self, forKey: .stories)
		events = try values.decodeIfPresent(Events.self, forKey: .events)
		urls = try values.decodeIfPresent([Urls].self, forKey: .urls)
	}
    
    var fullUrl: String {
        
        if let img = thumbnail, let path = img.path, let ex = img.extension1 {
            return path + "." + ex
        }
        
        return Constants.DummyImage.url
    }

}

//
//  CanadaInfoModel.swift
//  WiproTest
//
//  Created by Devesh  Pandey on 11/25/20.
//  Copyright © 2020 Wipro. All rights reserved.
//

import Foundation

struct CanadaInfoModel : Codable {

        let rows : [CanadaInfoRow]!
        let title : String!

        enum CodingKeys: String, CodingKey {
                case rows = "rows"
                case title = "title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                rows = try values.decodeIfPresent([CanadaInfoRow].self, forKey: .rows)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}

struct CanadaInfoRow : Codable {

        let descriptionField : String!
        let imageHref : String!
        let title : String!

        enum CodingKeys: String, CodingKey {
                case descriptionField = "description"
                case imageHref = "imageHref"
                case title = "title"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
                imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref)
                title = try values.decodeIfPresent(String.self, forKey: .title)
        }

}

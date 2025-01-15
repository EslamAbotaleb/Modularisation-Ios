//
//  Artist.swift
//  ArtistDetail
//
//  Created by Eslam on 13/01/2025.
//

import Foundation
import CommonModels

struct Artist: Codable, Sendable {
    let name: String
    let birthDate: Date
    let songs: [Song]
}

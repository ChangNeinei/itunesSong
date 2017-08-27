//
//  SongResults.swift
//  itunesSong
//
//  Created by Weiling Chang on 2017/8/25.
//  Copyright © 2017年 Lynne. All rights reserved.
//

import Foundation

struct Song: Codable {
    var artistName: String
    var trackName: String
    var collectionName: String
    var previewUrl: URL
    var artworkUrl100: URL
    var trackPrice: Double?
    var releaseDate: Date
    var isStreamable: Bool
    var releaseDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: releaseDate)
    }
}

struct SongResults: Codable {
    var resultCount: Int
    var results: [Song]
}

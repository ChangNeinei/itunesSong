//
//  SongController.swift
//  itunesSong
//
//  Created by Weiling Chang on 25/08/2017.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation
import UIKit

class SongController {
    static let shareshare = SongController()
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data, let image = UIImage(data: data){
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchSongs(completion: @escaping ([Song]?) -> Void){
        if let urlStr = "https://itunes.apple.com/search?term=薛之謙&media=music".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlStr){
            let task = URLSession.shared.dataTask(with: url){ (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let songResults = try? decoder.decode(SongResults.self, from: data)
                {
                    completion(songResults.results)
                } else {
                  completion(nil)
                }
            }
            task.resume()
        } else {
            completion(nil)
        }
    }
}

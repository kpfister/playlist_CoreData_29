//
//  Playlist+Convenience.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData
extension Playlist {
    
    convenience init(playlistName: String, songs: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.playlistName = playlistName
    }
}

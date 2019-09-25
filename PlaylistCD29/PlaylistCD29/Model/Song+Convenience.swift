//
//  Song+Convenience.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    convenience init(songName: String, artistName: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        self.songName = songName
        self.artistName = artistName
        self.playlist = playlist
    }
}

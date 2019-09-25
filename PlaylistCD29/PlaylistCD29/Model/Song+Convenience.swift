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
    @discardableResult // IDK Why, but Karl said to.  This is for the song Init and the result not being used
    convenience init(songName: String, artistName: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        self.songName = songName
        self.artistName = artistName
        self.playlist = playlist
    }
}

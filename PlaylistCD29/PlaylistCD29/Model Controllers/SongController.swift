//
//  SongController.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

class SongController {
    
    // Create
    static func createSong(songName: String, artistName:String, to playlist: Playlist) {
        Song(songName: songName, artistName: artistName, playlist: playlist)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
    
    // Delete
    static func deleteSong(song: Song) {
        CoreDataStack.context.delete(song)
        PlaylistController.sharedInstance.saveToPersistentStore()
    }
}

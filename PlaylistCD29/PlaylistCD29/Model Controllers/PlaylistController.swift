//
//  PlaylistController.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData
class PlaylistController {
    
    // Singleton
    static let sharedInstance = PlaylistController()
    // Local Source of Truth
    var playlists: [Playlist] {

        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
         return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
            
    }
    
    // Crud
    // Create
    func createPlaylist(withName name: String) {
        _ = Playlist(playlistName: name)
        
        saveToPersistentStore()
    }
    // Delete
    
    func deletePlaylist(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        saveToPersistentStore()
    }
    // Save
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the Objects in \(#function): \(error.localizedDescription)")
        }
    }
} // End of class

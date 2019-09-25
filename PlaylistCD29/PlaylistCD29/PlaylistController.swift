//
//  PlaylistController.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import Foundation

class PlaylistController {
    
    
    // Crud
    // Create
    func createPlaylist(withName name: String) {
        
    }
    // Delete
    
    func deletePlaylist(playlist: Playlist) {
        
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

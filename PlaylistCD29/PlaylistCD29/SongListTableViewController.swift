//
//  SongListTableViewController.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    
    var playlist: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
            let songName = songNameTextField.text,
            let artistName = artistNameTextField.text
            else { return }
        SongController.createSong(songName: songName, artistName: artistName, to: playlist)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlist?.songs?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)

        guard let unwrappedPlaylist = playlist,
            let song = unwrappedPlaylist.songs?[indexPath.row] as? Song
            else { return UITableViewCell() }
//        let song = playlist?.songs?[indexPath.row] as? Song
        
        cell.textLabel?.text = song.songName
        cell.detailTextLabel?.text = song.artistName

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlist,
                let song = playlist.songs?[indexPath.row] as? Song
                else { return }
            
            SongController.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

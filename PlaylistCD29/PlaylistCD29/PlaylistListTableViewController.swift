//
//  PlaylistListTableViewController.swift
//  PlaylistCD29
//
//  Created by Karl Pfister on 9/25/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()

    }
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextField.text else {return}
        PlaylistController.sharedInstance.createPlaylist(withName: name)
        
        // Clean up the dust
        playlistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedInstance.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.playlistName
        cell.detailTextLabel?.text = "\(songCount)"
       
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlist: playlist)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
        
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
                I - Identifier
                I - IndexPathForSelectedRow
                D - DestinationViewController
                O - Object from Source of Truth
                O - Setting Object landing pad
                */
        if segue.identifier == "toDetailVC" {
            guard let index = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? SongListTableViewController
                else { return }
            let playlist = PlaylistController.sharedInstance.playlists[index.row]
            destinationVC.playlist = playlist
        }
        
    }
    
}// End of class

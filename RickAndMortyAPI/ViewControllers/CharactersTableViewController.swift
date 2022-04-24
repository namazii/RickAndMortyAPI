//
//  CharactersTableViewController.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 23.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?

    private var character: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchData(from: Link.rickAndMortyApi.rawValue)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rickAndMorty?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharactersTableViewCell else { return UITableViewCell() }
        let imageCharacter = rickAndMorty?.results[indexPath.row]
        cell.configure(with: imageCharacter)
        return cell
    }
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        if sender.tag == 1 {
            fetchData(from: rickAndMorty?.info.next)
        } else {
            fetchData(from: rickAndMorty?.info.prev)
        }
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = rickAndMorty?.results[indexPath.row]
        guard let detailVC = segue.destination as? CharacterPersonalInfoViewController else { return }
        detailVC.character = character
        
    }
    
    
    
}

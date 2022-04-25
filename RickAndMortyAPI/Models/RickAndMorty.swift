//
//  Models.swift
//  RickAndMortyAPI
//
//  Created by Назар Ткаченко on 23.04.2022.
//

// MARK: - RickAndMorty
struct RickAndMorty: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let next: String?
    let prev: String?
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    
    var description: String {
        """
    Name: \(name)
    Status: \(status)
    Species: \(species)
    Gender: \(gender)
    Status: \(status)
    Location: \(location.name)
    Episode: \(episode.count)
    """
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
}

// MARK: - Episode
struct Episode: Codable {
    let name: String 
}

enum Link: String {
    case rickAndMortyApi = "https://rickandmortyapi.com/api/character"
}

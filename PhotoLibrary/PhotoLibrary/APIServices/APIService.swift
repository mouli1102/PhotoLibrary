//
//  APIService.swift
//  PhotoLibrary
//
//  Created by 2403464 on 25/08/25.
//
import Foundation
import Combine

/// The `APIProtocol` provides a contract for services that fetch photo entities.
protocol APIProtocol {
    func fetchData() async throws -> [PhotoEntity]
}

/// `APIService` retrieves photo data from the JSONPlaceholder test API, specifically
/// from the `/photos` endpoint. It handles URL creation, network requests, response validation,
/// and JSON decoding into model objects.
class APIService: APIProtocol {
    func fetchData() async throws -> [PhotoEntity] {
        let baseUrl = "https://jsonplaceholder.typicode.com"
        guard let url = URL(string: "\(baseUrl)/photos?_limit=20") else {
            throw URLError(.badURL)
        }
        
        let session = URLSession(configuration: .default)
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let photoListData = try decoder.decode([PhotoEntity].self, from: data)
        return photoListData
    }
    
}

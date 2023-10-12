//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func download(url: URL, completion: @escaping(Result<Data, CustomError>) -> ()) -> URLSessionDataTask
    func handleWithData<T: Decodable>(_ data: Data, type: T.Type) -> T?
    func handleWithError(_ error: Error)
}

final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private init() {}
    
    @discardableResult
    func download(url: URL, completion: @escaping (Result<Data, CustomError>) -> ()) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(data))
        }
        dataTask.resume()
        return dataTask
    }
    
    func handleWithData<T: Decodable>(_ data: Data, type: T.Type) -> T? {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            return result
        } catch {
            print(CustomError.unableToParseFromJSON.rawValue)
            return nil
        }
    }
    
    func handleWithError(_ error: Error) {
        print(error)
    }
}

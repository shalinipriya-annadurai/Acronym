//
//  APIService.swift
//  Acromine
//
//  Created by Shalinipriya Annadurai on 10/14/21.
//

import Foundation
 
class APIService {
    static let shared = APIService()
    let baseURL =
        "http://www.nactem.ac.uk/software/acromine/dictionary.py"
    func getAbbrevation(_ param: String, completion: @escaping(Result<[Acronym], Error>) -> ()){
        let url = URL(string: (baseURL+"?sf=\(param)"))!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"

        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { (data, _, error) in
            if let error = error{
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let ac = try JSONDecoder().decode([Acronym].self, from: data)
                    completion(.success(ac))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

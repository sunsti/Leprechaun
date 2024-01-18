//
//  ManagerNetwork.swift
//  Leprechaun
import Foundation

enum NetworkError: Error {
    case badRequestc
    case urlError
    case authErorr
}

struct AuthResponse: Codable {
    let token: String
}

class ManagerNetwork {
    static let shared = ManagerNetwork()
    
    private let username = "admin"
    private let password = "iCAleretAIgestRawE"
    private let host = "https://leprechaun-backend-83a025e24ac9.herokuapp.com"
    private var token: String?
    
    private init() {}
    
    func authenticate() async throws {
        guard let url = URL(string: host + "/login") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let loginString = "\(username):\(password)"
        if let loginData = loginString.data(using: String.Encoding.utf8) {
            let base64LoginString = loginData.base64EncodedString(options: [])
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
        let (data, _) = try await URLSession.shared.data(for: request)
        let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
        self.token = authResponse.token
        print("Token: \(authResponse.token)")
    }
    
    func getNews() async throws -> [NewsModel] {
        guard let token else { throw NetworkError.authErorr }
        guard let url = URL(string: host + "/api/news") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let news = try JSONDecoder().decode([NewsModel].self, from: data)
        return news
    }
    
    func getGifts() async throws -> [GiftsModel] {
        guard let token else { throw NetworkError.authErorr }
        guard let url = URL(string: host + "/api/gifts") else { throw NetworkError.urlError }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let (data, _) = try await URLSession.shared.data(for: request)
        let news = try JSONDecoder().decode([GiftsModel].self, from: data)
        return news
    }
}

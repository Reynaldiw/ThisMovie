//
//  RemoteMovieListLoader.swift
//  ThisMovie
//
//  Created by Reynaldi on 03/04/23.
//

import Foundation

final class RemoteMovieListLoader: MovieListLoaderInputMessageSpecs {
    
    private static var APIKeyQuery: [String: String] {
        return ["api_key": APIConstant.API_KEY]
    }
    
    enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    private let url: URL
    private let client: MovieListHTTPClient & MovieGenreListHTTPClient
    private var loaderOutputMessage: MovieListLoaderOutputMessageSpecs
    
    init(url: URL, client: MovieListHTTPClient & MovieGenreListHTTPClient, loaderOutputMessage: MovieListLoaderOutputMessageSpecs) {
        self.url = url
        self.client = client
        self.loaderOutputMessage = loaderOutputMessage
    }
    
    func fetchListMovie(of selectedGenre: String) {}
    
    func fetchListMovieGenre() {
        let url = RemoteMovieListLoader.createURL(self.url, path: APIConstant.LIST_GENRE_PATH, request: RemoteMovieListLoader.APIKeyQuery)!.absoluteURL
        client.getMovieGenre(from: url) { [weak self] receivedResult in
            guard let self = self else { return }
            
            switch receivedResult {
            case let .success((data, response)):
                self.proceedMovieGenreResult(data: data, response: response)
                
            case .failure:
                self.loaderOutputMessage.failedToFetchListMovieGenre(Error.connectivity)
            }
        }
    }
    
    private func proceedMovieGenreResult(data: Data, response: HTTPURLResponse) {
        do {
            let remoteModel = try MovieGenreMapper.map(data: data, response: response)
            loaderOutputMessage.succeedToFetch(remoteModel.toModels())
        } catch {
            loaderOutputMessage.failedToFetchListMovieGenre(error)
        }
    }
}

private extension Collection where Element == RemoteMovieGenreItem {
    func toModels() -> [MovieGenreItem] {
        return map { .init(id: $0.id, name: $0.name) }
    }
}

final class MovieGenreMapper {
    private struct Root: Decodable {
        let genres: [RemoteMovieGenreItem]
    }
    
    private static var OK_200: Int {
        return 200
    }
    
    static func map(data: Data, response: HTTPURLResponse) throws -> [RemoteMovieGenreItem] {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data)
        else { throw RemoteMovieListLoader.Error.invalidData }
        
        return root.genres
    }
}

internal struct RemoteMovieGenreItem: Decodable {
    internal let id: Int
    internal let name: String
}

extension RemoteMovieListLoader {
    private static func addPath(_ path: String, to url: URL) -> URL {
        if #available(iOS 16.0, *) {
            return url.appending(path: path)
        } else {
            return url.appendingPathComponent(path)
        }
    }
    
    private static func createURL(_ url: URL, path: String?, request: [String: Any]) -> URL? {
        var url = url
        if let path = path {
            url = url.appendPath(path)
        }
        
        var urlComponent = URLComponents(string: url.absoluteString)
        urlComponent?.queryItems = createQueries(with: request)

        return urlComponent?.url
    }

    private static func createQueries(with request: [String: Any]) -> [URLQueryItem] {
        let request = request.mapValues { $0 as? String }.compactMapValues { $0 }
        var queryItems = [URLQueryItem]()
        request.forEach { key, value in
            queryItems.append(URLQueryItem(name: key, value: value))
        }

        return queryItems
    }
}

private extension URL {
    func appendPath(_ path: String) -> URL {
        if #available(iOS 16.0, *) {
            return self.appending(path: path)
        } else {
            return self.appendingPathComponent(path)
        }
    }
}

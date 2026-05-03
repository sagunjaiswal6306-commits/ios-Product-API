import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
}

class ProductService {
    
    func fetchProduct() async throws -> Product {
        
        guard let url = URL(string: "https://dummyjson.com/products/1") else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            return try JSONDecoder().decode(Product.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
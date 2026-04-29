import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class ProductService {
    
    func fetchProduct(completion: @escaping (Result<Product, Error>) -> Void) {
        
        let urlString = "https://dummyjson.com/products/1"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                completion(.success(product))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
            
        }.resume()
    }
}
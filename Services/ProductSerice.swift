import Foundation

class ProductService {
    
    func fetchProduct(completion: @escaping (Result<Product, Error>) -> Void) {
        
        let urlString = "https://dummyjson.com/products/1"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                completion(.success(product))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
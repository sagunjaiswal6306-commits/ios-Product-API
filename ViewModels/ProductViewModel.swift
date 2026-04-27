class ProductViewModel {
    
    private let service = ProductService()
    
    func getProduct() {
        service.fetchProduct { result in
            
            switch result {
            case .success(let product):
                print("Title: \(product.title)")
                print("Description: \(product.description)")
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
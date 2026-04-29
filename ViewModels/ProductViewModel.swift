class ProductViewModel {
    
    private let service = ProductService()
    
    var isLoading: Bool = false
    var product: Product?
    var errorMessage: String?
    
    func fetchProduct(completion: @escaping () -> Void) {
        
        isLoading = true
        print("Loading started...")
        
        service.fetchProduct { [weak self] result in
            
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
                
            case .success(let product):
                self.product = product
                self.errorMessage = nil
                
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.product = nil
            }
            
            completion()
        }
    }
}
class ProductView {
    
    private let viewModel = ProductViewModel()
    
    func loadView() {
        
        viewModel.fetchProduct {
            
            if self.viewModel.isLoading {
                print("Loading...")
            }
            
            if let product = self.viewModel.product {
                print("Title: \(product.title)")
                print("Description: \(product.description)")
            }
            
            if let error = self.viewModel.errorMessage {
                print("Error: \(error)")
            }
        }
    }
}
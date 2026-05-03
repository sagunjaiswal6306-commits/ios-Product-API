class ProductViewModel {
    
    private let service = ProductService()
    
    var product: Product?
    var errorMessage: String?
    var isLoading = false
    
    func fetchProduct() {
        
        isLoading = true
        print("Loading started...")
        
        Task {
            do {
                let result = try await service.fetchProduct()
                
                self.product = result
                self.errorMessage = nil
                
                print("Title: \(result.title)")
                
            } catch {
                self.errorMessage = error.localizedDescription
                print("Error: \(error.localizedDescription)")
            }
            
            self.isLoading = false
            print("Loading finished...")
        }
    }
}
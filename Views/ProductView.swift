class ProductView {
    
    private let viewModel = ProductViewModel()
    
    func loadView() {
        viewModel.fetchProduct()
    }
}
//
//  HomeViewModel.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import Foundation

// MARK: - PROTOCOLO
protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    func onViewsLoaded()
    func data(at index: Int) -> BikeModel?
    func navigateToDetail(with data: BikeModel)
}

// MARK: - CLASE -
final class HomeViewModel {
    
    private weak var viewDelegate: HomeViewProtocol?
    private var viewData = BikesModel()
    
    init(viewDelegate: HomeViewProtocol? = nil) {
        self.viewDelegate = viewDelegate
    }
    
    private func loadData() {
        viewData = sampleBikeData
        viewDelegate?.updateViews()
    }
}

// MARK: - EXTENSION
extension HomeViewModel: HomeViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
    
    func data(at index: Int) -> BikeModel? {
        guard index < dataCount else { return nil }
        return viewData[index]
    }
    
    var dataCount: Int {
        return viewData.count
    }
    
    func navigateToDetail(with data: BikeModel) {
        viewDelegate?.navigateToDetail(with: data)
    }
}

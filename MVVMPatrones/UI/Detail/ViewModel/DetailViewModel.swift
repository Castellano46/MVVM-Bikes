//
//  DetailViewModel.swift
//  MVVMPatrones
//
//  Created by Pedro on 5/10/23.
//

import Foundation

protocol DetailViewModelProtocol {
    var bikeName: String { get }
    var bikeImageURL: URL? { get }
    var bikeDescription: String { get }
}

//MARK: - CLASE -
final class DetailViewModel: DetailViewModelProtocol {
    var bikeName: String
    var bikeImageURL: URL?
    var bikeDescription: String
    
    init(bikeName: String, bikeImageURL: URL?, bikeDescription: String) {
        self.bikeName = bikeName
        self.bikeImageURL = bikeImageURL
        self.bikeDescription = bikeDescription
    }
}

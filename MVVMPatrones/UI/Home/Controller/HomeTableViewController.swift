//
//  HomeTableViewController.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func navigateToDetail(with data: BikeModel)
    func updateViews()
}

class HomeTableViewController: UITableViewController {
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        viewModel?.onViewsLoaded()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "HomeCellTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataCount ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCellTableViewCell {
            if let data = viewModel?.data(at: indexPath.row) {
                cell.updateViews(data: data)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = viewModel?.data(at: indexPath.row) {
            viewModel?.navigateToDetail(with: data)
        }
    }
}

extension HomeTableViewController: HomeViewProtocol {
    func updateViews() {
    }

    func navigateToDetail(with data: BikeModel) {
        if let imageURLString = data.imageURL, let imageURL = URL(string: imageURLString) {
            let detailViewModel = DetailViewModel(
                bikeName: data.name,
                bikeImageURL: imageURL,
                bikeDescription: data.description
            )
            
            let nextVC = DetailViewController(viewModel: detailViewModel)
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

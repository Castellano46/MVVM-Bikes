//
//  SplashViewController.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import UIKit

//MARK: - PROTOCOLO -
protocol SplashViewProtocol: AnyObject {
    func showLoading(_ show: Bool)
    func navigateToHome()
}

//MARK: - CLASE -
class SplashViewController: UIViewController {
    
    @IBOutlet weak var activituIndicator: UIActivityIndicatorView!
    
    var viewModel: SplashViewModelProtocol?

        override func viewDidLoad() {
            super.viewDidLoad()
            viewModel?.onViewsLoaded()
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            activituIndicator.stopAnimating()
        }
    }

    extension SplashViewController: SplashViewProtocol {
        func showLoading(_ show: Bool) {
            activituIndicator.isHidden = !show
            if show {
                activituIndicator.startAnimating()
            }
        }

        func navigateToHome() {
            let nextVC = HomeTableViewController()
            nextVC.viewModel = HomeViewModel(viewDelegate: nextVC)
            navigationController?.setViewControllers([nextVC], animated: true)
        }
    }


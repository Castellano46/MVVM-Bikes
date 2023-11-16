//
//  DetailViewController.swift
//  MVVMPatrones
//
//  Created by Pedro on 3/10/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var bikeName: UILabel!
    @IBOutlet weak var bikeImage: UIImageView?
    @IBOutlet weak var bikeDescription: UITextView!
    
    var viewModel: DetailViewModel?

        init(viewModel: DetailViewModel?) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        override func viewDidLoad() {
            super.viewDidLoad()

            bikeName.text = viewModel?.bikeName ?? ""
            if let bikeImageURL = viewModel?.bikeImageURL {
                loadImageFromURL(bikeImageURL)
            }
            bikeDescription.text = viewModel?.bikeDescription ?? ""
        }

        private func loadImageFromURL(_ url: URL) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if let error = error {
                    print("Error al cargar la imagen: \(error)")
                    return
                }

                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.bikeImage?.image = image
                    }
                }
            }
            task.resume()
        }
    }

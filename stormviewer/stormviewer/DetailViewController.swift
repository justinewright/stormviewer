//
//  DetailViewController.swift
//  stormviewer
//
//  Created by Justine Wright on 2021/05/19.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSelectedImageIfExists()
        // Do any additional setup after loading the view.
        title = selectedImage

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //called before loading// last opportunity
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    private func loadSelectedImageIfExists(){
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }


}

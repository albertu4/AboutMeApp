//
//  PictureViewController.swift
//  AboutMeApp
//
//  Created by Михаил Иванов on 24.01.2022.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var stackOfImage: UIStackView!
    
    var profile: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Photo Album"
        loadAccountAlbum()
    }
    
    private func loadAccountAlbum() {
        var iteration = 0
        
        for image in stackOfImage.arrangedSubviews {
            if let photo = image as? UIImageView {
                photo.image = UIImage(named: profile.person.photoAlbum[iteration])
                iteration += 1
            }
        }
    }
    
}

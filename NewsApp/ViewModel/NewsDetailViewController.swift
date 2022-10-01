//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Talla Toure on 28/09/2022.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var newsImage = UIImage()
    var newsTitle = ""
    var newsDescription = ""
    var newsURL = ""
    var newsContent = ""
    
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsUrlLabel: UILabel!
    @IBOutlet weak var newsContentViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsImageView.image = self.newsImage
        newsTitleLabel.text = self.newsTitle
        newsUrlLabel.text = self.newsURL
        newsDescriptionLabel.text = self.newsDescription
        newsContentViewLabel.text = self.newsContent
        
        newsDescriptionLabel.sizeToFit()
        
        
    }
    
    
}

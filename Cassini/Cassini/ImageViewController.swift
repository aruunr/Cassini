//
//  ImageViewController.swift
//  Cassini
//
//  Created by Arun Ramaswamy on 5/8/17.
//  Copyright © 2017 Arun Ramaswamy. All rights reserved.
//

//Doing scrollviews in storyboard and imageview in code
import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.contentSize = imageView.frame.size
            scrollView.addSubview(imageView)
            scrollView.maximumZoomScale = 2.0
            scrollView.minimumZoomScale = 0.5
            scrollView.delegate = self
            
        }
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
   
//create a model with URL of images
    var imageURL : URL? {
        //if URL changes in model
        didSet{
            image = nil
            if view.window != nil{
                fetchImageFromURL()
            }
        }
    }
    
    private func fetchImageFromURL(){
        if let url = imageURL{
            spinner.startAnimating()
            DispatchQueue.global(qos : .userInitiated).async { [weak self] in
                let urlcontents = try? Data(contentsOf: url)
                if let imageData = urlcontents, url == self?.imageURL {
                    DispatchQueue.main.async {
                        
                        self?.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    
    fileprivate var imageView = UIImageView()
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImageFromURL()
        }
    }
    
    private var image : UIImage? {
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size //optional unwrapping here because when prepare is called outlets are not set. so when imageURL is set then outlet scrollView is not yet there during prepare.
            spinner?.stopAnimating()
        }
    }
    
    
}

//zooming needs this method to be implemented
extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

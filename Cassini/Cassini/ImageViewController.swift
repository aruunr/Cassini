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
             let urlcontents = try? Data(contentsOf: url)
            if let imageData = urlcontents {
                image = UIImage(data: imageData)
            }
        }
    }
    
    
    fileprivate var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the model's value here imageURL =
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(<#T##animated: Bool##Bool#>)
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
            
        }
    }
    
    
}

//zooming needs this method to be implemented
extension ImageViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

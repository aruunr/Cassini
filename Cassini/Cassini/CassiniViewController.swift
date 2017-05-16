//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Arun Ramaswamy on 5/9/17.
//  Copyright © 2017 Arun Ramaswamy. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = URLmodel.NASA[segue.identifier ?? ""]{
            if let imageViewCtrl = (segue.destination.contents as? ImageViewController){
                imageViewCtrl.imageURL = url
                
            }
        }
    }
    

}

extension UIViewController {
    
    var contents : UIViewController {
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController ?? self
        }
        else{
            return self
        }
    
    }

}

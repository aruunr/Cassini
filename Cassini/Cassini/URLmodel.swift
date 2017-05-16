//
//  Urlmodel.swift
//  Cassini
//
//  Created by Arun Ramaswamy on 5/11/17.
//  Copyright © 2017 Arun Ramaswamy. All rights reserved.
//

import Foundation

struct URLmodel {

    static var NASA : Dictionary<String,URL> = {
        let NASAURL = [
            "HalfLife":"http://stuffpoint.com/half-life/image/40462-half-life-half-life-2-episode-2-dog-vs-strider.jpg",
            "BlackHole":"https://photojournal.jpl.nasa.gov/jpeg/PIA20027.jpg",
            "CrabNebulae":"https://photojournal.jpl.nasa.gov/jpeg/PIA21474.jpg"
        ]
        
        var urls = Dictionary<String,URL>()
        for (key,value) in NASAURL {
            urls[key] = URL(string: value)
            
        }
    return urls
    }()

}

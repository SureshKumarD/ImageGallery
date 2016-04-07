//
//  Protocols.swift
//  ImageGallery
//
//  Created by Suresh on 4/7/16.
//  Copyright © 2016 Suresh. All rights reserved.
//

import UIKit

protocol ItemDelegate : class {
    
    //Delegate
    weak var itemDelegate:ItemDelegate?{get}

    func itemSelected(item:AnyObject!)->Void
    
}


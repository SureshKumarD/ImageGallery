//
//  HomeViewController.swift
//  ImageGallery
//
//  Created by Suresh on 4/7/16.
//  Copyright © 2016 Suresh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ItemDelegate {
    
    //Storyboard objects...
    @IBOutlet weak var galleryTypeSegmentControl: UISegmentedControl!
    @IBOutlet weak var galleryTypeContainerView: UIView!
    
    //Local variables...
    var galleryCollectionView : GalleryCollectionView!
    var galleryViewOption : GalleryView!
    
    //Navigation Items...
    var leftBarButtonItem : UIBarButtonItem!
    var rightBarButtonItem : UIBarButtonItem!
    var navigationLeftButton : UIButton!
    var navigationRightButton : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Allocations/ Initializations
        self.galleryViewOption = GalleryView.Staggered
        self.initializations()
        self.registerAllNibs()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.sampleApiHit()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: Selector("didFinishLayout"), object: nil)
        self.performSelector(Selector("didFinishLayout"), withObject: nil, afterDelay: 0)
    }
    //MARK:- Methods
    
    
    
    
    //MARK:-
    //MARK:- Initial setups
    func initializations () {
        
        //Navigation Bar
        self.leftBarButtonItem = UIBarButtonItem()
        self.rightBarButtonItem = UIBarButtonItem()
        
        //CollectionView...
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0

        self.galleryCollectionView = GalleryCollectionView(frame: self.galleryTypeContainerView.bounds,    collectionViewLayout: flowLayout)
        self.galleryCollectionView.viewOption = self.galleryViewOption
        GalleryCollectionView.itemDelegate = self
        self.galleryCollectionView.imageInfoArray = (APP_DELEGATE_INSTANCE?.networkObject.objects)!
        self.galleryTypeContainerView.addSubview(galleryCollectionView)
        self.galleryViewOption = GalleryView.Grid
        self.setNavigationLeftButton()
        self.setNavigationRightButton()
        self.changeGalleryView()
       

    }

    func registerAllNibs() {
       
        self.galleryCollectionView.registerNib(UINib.init(nibName: "GalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"GalleryCollectionViewCell")
        
    }
    
    func didFinishLayout() {
        self.galleryCollectionView.frame = self.galleryTypeContainerView.bounds

    }
    
    
    func sampleApiHit() {
       
        
        IMGGalleryRequest.hotGalleryPage(0, success: { (objects: [AnyObject]!) -> Void in
            print(objects)
            }) { (error : NSError!) -> Void in
                
        }
        
        
    }
    
    //MARK:- Item Selected Delegate
    func itemSelected(item: AnyObject!) {
        var albumID : String!
        if(item.isKindOfClass(IMGGalleryAlbum)) {
            albumID = item.albumID as String
        }else {
            albumID = ""
        }
        
        APP_DELEGATE_INSTANCE?.networkObject.getAlbumWithId(albumID, isWithCoverImage: true, completionHandler: { () -> Void in
            
        })
    }
    
    //MARK:- NavigationBar
    func setNavigationLeftButton() {
        
        if(self.navigationLeftButton == nil) {
            self.navigationLeftButton = UIButton(type: UIButtonType.Custom)
        }
        self.navigationLeftButton.frame = CGRectMake(0, 0, 50, 50)
        self.leftBarButtonItem.customView = self.navigationRightButton
        self.navigationItem.leftBarButtonItem = self.leftBarButtonItem
        
    

    }
    
    
    func setNavigationRightButton() {
        if(self.navigationRightButton == nil) {
            self.navigationRightButton = UIButton(type: UIButtonType.Custom)
        }
        self.navigationRightButton.frame = CGRectMake(0, 0, 50, 50)
        self.navigationRightButton.tintColor = UIColor.blackColor()
        self.navigationRightButton.imageView?.contentMode = UIViewContentMode.Center
        self.navigationRightButton.addTarget(self, action: Selector("changeGalleryView"), forControlEvents: UIControlEvents.TouchUpInside)
        self.rightBarButtonItem.customView = self.navigationRightButton
        self.navigationItem.rightBarButtonItem = self.rightBarButtonItem

    }
    
    func changeGalleryView() {
        var image :UIImage!
        switch(self.galleryViewOption) {
            
        case GalleryView.Staggered? :
            self.galleryViewOption = GalleryView.List
            image = UIImage(named: "List")
            break
            
            
        case GalleryView.List?:
            self.galleryViewOption = GalleryView.Grid
             image = UIImage(named: "Grid")
            break
       
        case GalleryView.Grid? :
            self.galleryViewOption = GalleryView.Staggered
            image = UIImage(named: "StaggeredGrid")
            break
        default:
            break
        }
        
        self.navigationRightButton.setImage(image, forState: UIControlState.Normal)
        
        
    }
    
    
    
    

}

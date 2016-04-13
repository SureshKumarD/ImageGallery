//
//  Bridging_Header.h
//  ImageGallery
//
//  Created by Suresh on 4/6/16.
//  Copyright © 2016 Suresh. All rights reserved.
//

#ifndef Bridging_Header_h
#define Bridging_Header_h


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import <SystemConfiguration/SystemConfiguration.h>
#import <Security/Security.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

#import "Pods/AFNetworking/AFNetworking/AFNetworking.h"
#import "Pods/AFNetworking/AFNetworking/AFNetworkReachabilityManager.h"
#import "Pods/SDWebImage/SDWebImage/UIImageView+WebCache.h"
#import "Pods/SDWebImage/SDWebImage/SDWebImagePrefetcher.h"


//Imgur api library
#import "ImageGallery/ImgurSession/IMGSession.h"
#import "ImageGallery/ImgurSession/Requests/IMGGalleryRequest.h"
#import "ImageGallery/ImgurSession/Models/IMGGalleryImage.h"
#import "ImageGallery/ImgurSession/Models/IMGObject.h"
#import "ImageGallery/ImgurSession/Models/IMGBasicAlbum.h"
#import "ImageGallery/ImgurSession/Models/IMGGalleryAlbum.h"

//Carousel library
#import "ImageGallery/iCarousel/iCarousel.h"

#endif /* Bridging_Header_h */

//
//  Constants.swift

//
//  Created by Bhavin Joshi on 31/10/20.
//  Copyright © 2021 Bhavin Joshi. All rights reserved.

import Foundation



class Constants {
    //public static let AppColor = (UIColor(red: 231.0/255.0, green: 39.0/255.0, blue: 45.0/255.0, alpha: 1.0))
    
  //  public static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    public static let USERDEFAULTS = UserDefaults.standard
 //   public static let navigationcontroller = UINavigationController()
    
    
    //Production Server
    public static let BaseUrl = "https://nwloswbi73.execute-api.us-east-1.amazonaws.com/dev/"
    public static let ImageBaseUrl = "http://34.236.236.114/"
    
    public static let getNotification = "get-notifications"
    public static let get_group_info = "get-group-info"
    public static let get_face_details = "get-face-details"
    public static let edit_profile = "edit-profile"
    public static let register_face = "register-face"
    public static let delete_face = "delete-face"
    public static let get_notification_video = "get-notification-video"
    public static let get_notification_by_type = "get-notification-by-type"
    
    
    //--------
    
    public static let key128   = "@#$&+=@#$%*?~#$%"                   // 16 bytes for AES128
    public static let key256   = "@C#@#IOS$&$sp&+=L@#d$%*T?~#$%eeA"   // 32 bytes for AES256
    public static let iv       = "omniteamcltspeed"                   // 16 bytes for AES128

    
    public static let NetworkUnavailable = "Please Check your Internet Connection"
    public static let device_type = "2" // iOS = 2

    
}


//
//  ViewController.swift
//  practicleSetup
//
//  Created by bhavin joshi on 31/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGetMethod (_ sender:Any){
        
        
       // func getApi(){
            //SHOW_CUSTOM_LOADER()
            //self.arrStripeToken.removeAll()
           // self.dictStatistic = StatisticListModel()
            let parameter : [String : Any] = ["":""]
            WebService.GetMethod(params: parameter as [String : AnyObject], apikey: Constants.get_notification_by_type, completion: { (json) in
                let dict = json as? NSDictionary
                let statusv = dict!["statusCode"] as? Int ?? 0
                if statusv == 200
                {
                    DispatchQueue.main.async {
                        HIDE_CUSTOM_LOADER()
                        
                    }
                }
                else{
                    DispatchQueue.main.async {
                        HIDE_CUSTOM_LOADER()
                        Utils.popDialog(controller: self, title: self.navigationItem.title ?? "", message:"Something went wrong. Try again.")
                    }
                }
            }, failure: {(error) in
                DispatchQueue.main.async {
                    HIDE_CUSTOM_LOADER()
                   // self.dispatchGroup.leave()
                    Utils.popDialog(controller: self, title: self.navigationItem.title ?? "", message: "Something went wrong")
                }
            })
        //    }
        
    }
    
    
    @IBAction func btnPostMethod (_ sender:Any){
        
        let dictAddProfile = NSMutableDictionary()
        dictAddProfile.setValue("Bhavin Joshi", forKey: "fullname")
        dictAddProfile.setValue("bjacc03@gmail.com", forKey: "emailId")
        dictAddProfile.setValue("8460589373", forKey: "phone")
        dictAddProfile.setValue("Friends", forKey: "group")
        //dictAddProfile.setValue(self.strProfile, forKey: "face")
        
        WebService.postMethod(params: dictAddProfile as! [String : AnyObject], apikey: Constants.register_face, completion: { (json) in
            let dict = json as? NSDictionary
            let statusv = dict!["statusCode"] as? Int ?? 0
            if statusv == 200
            {
                DispatchQueue.main.async {
                    HIDE_CUSTOM_LOADER()
                    Utils.popDialog(controller: self, title: self.navigationItem.title ?? "", message: "Success")
                }
            }
            else{
                DispatchQueue.main.async {
                    HIDE_CUSTOM_LOADER()
                    Utils.popDialog(controller: self, title: self.navigationItem.title ?? "", message: "Something went wrong")
                }
            }
            
        }, failure: {(error) in
            DispatchQueue.main.async {
                HIDE_CUSTOM_LOADER()
                Utils.popDialog(controller: self, title: self.navigationItem.title ?? "", message: "Something went wrong")
            }
        })
    }


}


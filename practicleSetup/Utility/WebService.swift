//
//  WebService.swift
//  CLT Speed
//
//  Created by Sanskar Management Pro on 05/01/21.
//

import UIKit
import Alamofire

class WebService: NSObject {
    
    static func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    
    class func postLoginMethod(params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        
        
        let strURL = "\(Constants.USERDEFAULTS.value(forKey: "BaseUrl") as? String ?? "")\(apikey)"
        let url = URL(string: strURL)
        
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        var request = URLRequest(url: url!)
        request.timeoutInterval = 120
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceId":UIDevice.current.identifierForVendor?.uuidString ?? "",
            "DeviceToken": token
        ]
        request.httpBody = jsonData
        var dataTask: URLSessionDataTask? = nil
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            var dictonary:NSDictionary?
            do {
                dictonary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                if let myDictionary = dictonary
                {
                    print(myDictionary)
                    completion(myDictionary)
                }
                
            } catch let error as NSError {
                let response = response as! HTTPURLResponse
                if response.statusCode == 401{
                    //Constants.appDelegate.logoutAlert()
                    //HIDE_CUSTOM_LOADER()
                    //Constants.appDelegate.SessionExpireDialog()
                }
                else{
                    failure(error)
                }
            }
        })
        dataTask?.resume()
    }
    
    class func postLogoutMethod(params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        let postString = self.getPostString(params: params)
        print(postString)
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        let strURL = "\(Constants.USERDEFAULTS.value(forKey: "BaseUrl") as? String ?? "")\(apikey)"
        let url = URL(string: strURL)
        
        let authtoken = Constants.USERDEFAULTS.value(forKey: "authtoken") as? String ?? ""
        let userid = Constants.USERDEFAULTS.value(forKey: "userid") as? String ?? ""
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        let tenantId = Constants.USERDEFAULTS.value(forKey: "tenantId") as? String ?? ""
        
        var request = URLRequest(url: url!)
        let session = URLSession.shared
        request.timeoutInterval = 120
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceToken": token,
            "DeviceId":UIDevice.current.identifierForVendor?.uuidString ?? "",
            "Authorization" : "Bearer \(authtoken)",
            "UserId" : "\(userid)",
            "X-TENANT-ID" : "\(tenantId)"
        ]
        request.httpBody = jsonData
        var dataTask: URLSessionDataTask? = nil
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            var dictonary:NSDictionary?
            do {
                dictonary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                if let myDictionary = dictonary
                {
                    print(myDictionary)
                    completion(myDictionary)
                }
                
            } catch let error as NSError {
                let response = response as! HTTPURLResponse
                if response.statusCode == 401{
                    //Constants.appDelegate.logoutAlert()
                    //HIDE_CUSTOM_LOADER()
                    //Constants.appDelegate.SessionExpireDialog()
                }
                else{
                    failure(error)
                }
            }
        })
        dataTask?.resume()
    }
    
    
    class func postArrayMethod(params:NSMutableArray, apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        
        //        let postString = self.getPostArrayString(params: params as! [Any])
        //        print(postString)
        //
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        
        let strURL = "\(Constants.USERDEFAULTS.value(forKey: "BaseUrl") as? String ?? "")\(apikey)"
        let url = URL(string: strURL)
        
        let authtoken = Constants.USERDEFAULTS.value(forKey: "authtoken") as? String ?? ""
        let userid = Constants.USERDEFAULTS.value(forKey: "userid") as? String ?? ""
        let tenantId = Constants.USERDEFAULTS.value(forKey: "tenantId") as? String ?? ""
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        
        var request = URLRequest(url: url!)
        request.timeoutInterval = 120
        let session = URLSession.shared
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceToken": token,
            "DeviceId":UIDevice.current.identifierForVendor?.uuidString ?? "",
            "Authorization" : "Bearer \(authtoken)",
            "UserId" : "\(userid)",
            "X-TENANT-ID" : "\(tenantId)"
        ]
        request.httpBody = jsonData
        //request.httpBody = params
        var dataTask: URLSessionDataTask? = nil
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            var dictonary:NSDictionary?
            do {
                dictonary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                if let myDictionary = dictonary
                {
                    print(myDictionary)
                    completion(myDictionary)
                }
                
            } catch let error as NSError {
                let response = response as! HTTPURLResponse
                if response.statusCode == 401{
                    //Constants.appDelegate.logoutAlert()
                    //HIDE_CUSTOM_LOADER()
                    //Constants.appDelegate.SessionExpireDialog()
                }
                else{
                    failure(error)
                }
            }
        })
        dataTask?.resume()
    }
    
    
    class func postMethod(params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        print("parameter : \(params)")
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        
        // let postString = self.getPostString(params: params)
        // print(postString)
        
        let jsonData = try! JSONSerialization.data(withJSONObject: params)
        
        let strURL = "\(Constants.BaseUrl)\(apikey)"
        let url = URL(string: strURL)
    
        
        var request = URLRequest(url: url!)
        request.timeoutInterval = 120
        let session = URLSession.shared
        request.httpMethod = "POST"

        
        request.httpBody = jsonData
        //request.httpBody = params
        var dataTask: URLSessionDataTask? = nil
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            var dictonary:NSDictionary?
            do {
                dictonary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                if let myDictionary = dictonary
                {
                    print(myDictionary)
                    completion(myDictionary)
                }
                
            } catch let error as NSError {
                let response = response as! HTTPURLResponse
                if response.statusCode == 401{
                    //Constants.appDelegate.logoutAlert()
                    //HIDE_CUSTOM_LOADER()
                    //Constants.appDelegate.SessionExpireDialog()
                }
                else{
                    failure(error)
                }
            }
        })
        dataTask?.resume()
    }
    
    
    
    class func GetBaseURL (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        print("//---- \n\n Base URL API Call")
        
        //Staging
        //let strURL = "https://omnimarinestaging.sanskarpro.com:44329/api/App/baseURL/1.0"
        
        //Dev
        let strURL = "http://ec2-13-232-114-141.ap-south-1.compute.amazonaws.com:44329/api/App/baseURL/1.0"
        
        //Local
        //let strURL = "http://192.168.1.5:98/api/App/baseURL/1.0"
        //http://192.168.1.6:99/swagger/index.html
        let url = URL(string: strURL)
        let manager = Alamofire.Session.default
        manager.session.configuration.urlCache?.removeAllCachedResponses()
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .get, parameters: params,headers: nil)
            .responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("Base URL Response : \(jsonResponse)")
                    completion(jsonResponse)
                    
                case .failure( _):
                    let error = NSError(domain:"", code:response.response?.statusCode ?? 0, userInfo:[ NSLocalizedDescriptionKey: response.error?.errorDescription ?? "Something Went Wrong. Please Try Again Later."])
                    if response.response?.statusCode ?? 0 == 401{
                        //HIDE_CUSTOM_LOADER()
                        //Constants.appDelegate.SessionExpireDialog()
                    }
                    else{
                        failure(error)
                    }
                    break
                }
            }
    }
    
    class func GetMethod (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        let APIKEYurlString = apikey.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let strURL =  "\(Constants.BaseUrl)\(APIKEYurlString)"
        
        
        let url = URL(string: strURL)
        
        
        print("get url : \(String(describing: url))")
        let authtoken = Constants.USERDEFAULTS.value(forKey: "authtoken") as? String ?? ""
        let userid = Constants.USERDEFAULTS.value(forKey: "userid") as? String ?? ""
        let tenantId = Constants.USERDEFAULTS.value(forKey: "tenantId") as? String ?? ""
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        
        let headers : HTTPHeaders =  [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceToken": token,
            "DeviceId":UIDevice.current.identifierForVendor?.uuidString ?? "",
            "Authorization" : "Bearer \(authtoken)",
            "UserId" : "\(userid)",
            "X-TENANT-ID" : "\(tenantId)"
        ]
        
        print("--headers : \(headers)")
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .get, parameters: params,headers: nil)
            .responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response \(apikey) : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    
                case .failure( _):
                    
                    let error = NSError(domain:"", code:response.response?.statusCode ?? 0, userInfo:[ NSLocalizedDescriptionKey: response.error?.errorDescription ?? "Something Went Wrong. Please Try Again Later."])
                    if response.response?.statusCode ?? 0 == 401{
                        //Constants.appDelegate.logoutAlert()
                        //HIDE_CUSTOM_LOADER()
                        //Constants.appDelegate.SessionExpireDialog()
                    }
                    else{
                        failure(error)
                    }
                    //print("API Error : \(String(describing: response.response?.statusCode) ) \n\n")
                    break
                }
            }
    }
    
    class func GetCountMethod (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void)
    {
        if !Reachability.isConnectedToNetwork(){
            //Constants.appDelegate.NoInternetDialog()
        }
        print("//---- \n\n API : \(apikey) \n\n //-----\n\n Param : \(params) \n\n")
        let APIKEYurlString = apikey.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let strURL =  "\(Constants.USERDEFAULTS.value(forKey: "BaseUrl") as? String ?? "")\(APIKEYurlString)"
        
        
        let url = URL(string: strURL)
        
        
        print("get url : \(String(describing: url))")
        let authtoken = Constants.USERDEFAULTS.value(forKey: "authtoken") as? String ?? ""
        let userid = Constants.USERDEFAULTS.value(forKey: "userid") as? String ?? ""
        let tenantId = Constants.USERDEFAULTS.value(forKey: "tenantId") as? String ?? ""
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        
        let headers : HTTPHeaders =  [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceToken": token,
            "DeviceId":UIDevice.current.identifierForVendor?.uuidString ?? "",
            "Authorization" : "Bearer \(authtoken)",
            "UserId" : "\(userid)",
            "X-TENANT-ID" : "\(tenantId)"
        ]
        
        print("--headers : \(headers)")
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url!, method: .get, parameters: params,headers: headers)
            .responseJSON
            {
                response in
                switch (response.result)
                {
                case .success:
                    
                    let jsonResponse = response.value as! NSDictionary
                    print("//------\n\n Response \(apikey) : \(jsonResponse) \n\n")
                    completion(jsonResponse)
                    
                case .failure( _):
                    
                    let error = NSError(domain:"", code:response.response?.statusCode ?? 0, userInfo:[ NSLocalizedDescriptionKey: response.error?.errorDescription ?? "Something Went Wrong. Please Try Again Later."])
                    if response.response?.statusCode ?? 0 == 401{
                        //Constants.appDelegate.logoutAlert()
                        //HIDE_CUSTOM_LOADER()
                        //Constants.appDelegate.SessionExpireDialog()
                    }
                    else{
                        failure(error)
                    }
                    //print("API Error : \(String(describing: response.response?.statusCode) ) \n\n")
                    break
                }
            }
    }
    
    class func postMultiPartdataWithHeader (params: [String : AnyObject], apikey: String, completion: @escaping (Any) -> Void, failure:@escaping (Error) -> Void){
        
        NotificationCenter.default.post(name: Notification.Name("stopAutoUpdate"), object: nil)
        
        //            if Utils().isConnectedToNetwork() == false
        //            {
        //                UIApplication.shared.windows.first?.rootViewController?.view.makeToast(Constants.NetworkUnavailable)
        //                return
        //            }
        //
        let strURL = Constants.BaseUrl + apikey
        let url = URL(string: strURL)
        
        
        let authtoken = Constants.USERDEFAULTS.value(forKey: "authtoken") as? String ?? ""
        let userid = Constants.USERDEFAULTS.value(forKey: "userid") as? String ?? ""
        let token = Constants.USERDEFAULTS.value(forKey: "token") as? String ?? ""
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "DeviceType": Constants.device_type,
            "DeviceToken": token,
            "Authorization" : "Bearer \(authtoken)",
            "UserId" : "\(userid)"
        ]
        
        //        if let blogData = UserDefaults.standard.data(forKey: "LoginData"),
        //           let mydata = try? JSONDecoder().decode(UserModel.self, from: blogData) {
        //
        //            headers = [
        //                "authorizationtoken" : mydata.user_token
        //            ]
        //        }
        
        AF.upload(multipartFormData: { multiPart in
            for p in params {
                if p.value is Data{
                    let r = arc4random()
                    let filename = "user\(r).jpg"
                    let imgData = p.value as! Data
                    multiPart.append(imgData, withName: p.key, fileName: filename, mimeType: "image/jpg")
                }
                else if p.value is [Data]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [Data]{
                            let r = arc4random()
                            let filename = "user\(r).jpg"
                            let imgData = allData[m] as! Data
                            print("\(p.key)[\(m)]")
                            multiPart.append(imgData, withName: "\(p.key)[\(m)]", fileName: filename, mimeType: "image/jpg")
                        }
                    }
                }
                else if p.value is [String]{
                    for m in 0..<p.value.count{
                        if let allData = p.value as? [String]{
                            multiPart.append("\(allData[m])".data(using: String.Encoding.utf8)!, withName: "\(p.key)[\(m)]")
                        }
                    }
                }
                else{
                    multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
                }
                
            }
            print(multiPart)
        }, to: url!, method: .post,headers: headers) .uploadProgress(queue: .global(qos: .utility), closure: { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }).responseJSON(completionHandler: { data in
            //            print("upload finished: \(data)")
        }).responseJSON { response in
            switch response.result {
            case .success(let resut):
                print("upload success result: \(resut)")
                completion(resut)
            case .failure(let err):
                print("upload err: \(err)")
                
            }
        }
        
    }
    
    
}

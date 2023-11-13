//
//  DownloadImage.swift
//  TestApp
//
//  Created by עלי חלאחלה on 02/11/2023.
//

import Foundation
import UIKit

let sessionConfig = URLSessionConfiguration.default
let session = URLSession(configuration: sessionConfig)

let cache = NSCache<AnyObject, AnyObject>()

func download(URL_IMAGE: String, imageView:UIImageView, clearImage:Bool = false){

if(clearImage){
  imageView.image = nil
}

let escapedString = URL_IMAGE.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

if (cache.object(forKey: escapedString as AnyObject) != nil){
          // 2
  // Use cache
  print("Cached image used, no need to download it")
  
  DispatchQueue.main.async {
      imageView.image = cache.object(forKey: escapedString as AnyObject) as? UIImage
  }
}else if(escapedString != ""){
       let request = URLRequest(url: URL(string: escapedString!)!)

       let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
           
           if let tempLocalUrl = tempLocalUrl, error == nil {
               if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                   let rawImageData = NSData(contentsOf: tempLocalUrl)
               
                // #2 - Download occurs on background thread, but UI update
                       // MUST occur on the main thread.
                       DispatchQueue.main.async {
                              
                          imageView.image = UIImage(data: rawImageData! as Data)
                          
                          let img:UIImage! = UIImage(data:rawImageData! as Data)
                          if(img != nil){
                          cache.setObject(img, forKey: escapedString as AnyObject)
                          }

                       } // end DispatchQueue.main.async
                
                   print("Successfully downloaded. Status code: \(statusCode)")
               }
           } else {
               print("Error took place while downloading a file. Error description: \(String(describing: error?.localizedDescription))")
           }
       } // end let task
       
       task.resume()
}
}

//
//  Newsapi.swift
//  NewsApp
//
//  Created by Talla Toure on 27/09/2022.
//

import Foundation
import UIKit


// api KEY : 6cc0e221883f444d8d00bb0a87e200fc

/**
News api  provides two methods to load  data from newsapi.
 * func loadNews(completionHandler: @escaping(News)-> Void) :  Performing the connection with the API and returning a "News" object  throughout   a completionHandler.
 * func loadNewsImages(urlimg: String, completionHandler: @escaping(UIImage?)-> Void) : Loading img and returning the images hroughout  a completionHandler.
 * USAGE :  newsapi.loadNews() { news in ...}
 **/

class Newsapi {
    
    let API_KEY = "6cc0e221883f444d8d00bb0a87e200fc"
    let API_URL = "https://newsapi.org/v2/top-headlines?country=fr&apiKey="
    let APIurl:String
   
    
    
    init(){
        self.APIurl = API_URL + API_KEY
    }
    
    func loadNews(completionHandler: @escaping(News)-> Void){
        
        print("Load news")
        
        guard let url = URL(string: APIurl) else {
            print("ERROR: Invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            //Test purpose : Display data gathered
            //if let data = data, let string = String(data: data, encoding: .utf8){
                //print(string)
            //}
            
            if error != nil {
                print("ERROR : API connection failed \(error)")
                return
        
            }else{

                let news = try! JSONDecoder().decode(News.self, from: data!)
                    completionHandler(news)
                //news.forEach{ i in
                    //print("News data: \(news.status)")
                    //print("News data: \(news.totalResults!)")
                    
            }
            

            //}
            
            
        }.resume()
        
    }
        
    func loadNewsImages(urlimg: String, completionHandler: @escaping(UIImage?)-> Void){

            
            //App Transport Security has blocked a cleartext HTTP connection tomedia2.woopic.comsince it is insecure. Use HTTPS instead or add this domain to Exception Domains in your Info.plist. => Change Info.plist
        /// - Parameters : Image's url to download, Completion Handler : Image downloaded
        /// - Returns :
            print("Load Images: \(urlimg)")
            
            guard let url = URL(string: urlimg) else {
                print("ERROR: Invalid url")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                if error != nil {
                    completionHandler(nil)
                    return
                }else{
                    
                    if let img = data{
                        if let loadedImage = try? UIImage(data: img) {
                            completionHandler(loadedImage)
                        }else{
                            print("ERROR: Can't load images")
                            completionHandler(UIImage())
                        }

                    }else{
                        print("ERROR: Can't load images")
                        completionHandler(UIImage())
                    }
                }
            }.resume()
        
    }

}

#if debug
extension Newsapi{
    
    func testLocalLoadNews(completionHandler: @escaping(News)-> Void){
        completionHandler(TestNews)
    }
}
#endif

//
//  News.swift
//  NewsApp
//
//  Created by Talla Toure on 27/09/2022.
//

import Foundation


struct News: Codable{
    
    var status: String?
    var totalResults: Int?
    var articles:[Articles]?
}


struct Articles: Codable{
    
    var source : Source
    var author:String?
    var title:String?
    var description:String?
    var url: String?
    var urlToImage: String?
    var publishedAt :String?
    var content: String?
    
    
}

struct Source:Codable{

    var id:String?
    var name:String?
}


#if DEBUG
let TestNews = News(status: "ok", totalResults: 20, articles: [TestArticles, TestArticles, TestArticles])

let TestArticles = Articles(source: TestSource, author: "John Apple", title: "Articles Test title", description: "Article test description, adding some text to be longer and displayed on the view, blalablalblablablalblablbalblalbalbla", url: "https://wrongurl", urlToImage: "https://wrongurl", publishedAt:"Date" , content: "Content")

let TestSource  = Source(id: "TestID", name: "TestName")
#endif

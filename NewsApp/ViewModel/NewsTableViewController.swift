//
//  NewsTableViewController.swift
//  NewsApp
//
//  Created by Talla Toure on 27/09/2022.
//

import UIKit

class NewsTableViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var newsTableView: UITableView!
    var newsapi = Newsapi()
    var news = News()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        newsapi.loadNews(){ news in
            
            if news.status == "ok"{
                self.news = news
            }else{
                print("ERROR: Data status retrun KO")
            }
            //print("Total result articles \(self.news.totalResults)")
            //print("Total count articles \(self.news.articles?.count)")
        //}
        
        print("Nb articles \(self.news.articles?.count)")
        
        /*if let nbarticles = self.news.articles?.count{
            for i in 0...nbarticles-1{
                if let urlimages = self.news.articles?[i].urlToImage{
                    
                    
                    self.newsapi.loadNewsImages(urlimg:urlimages)
                    { images in
                        self.loadedImages.append(images)
                    }
                }else{
                    self.loadedImages.append(UIImage())
                    print("Images not available : \(i)")
                }
            }*/
            
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
        
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {

       super.viewWillAppear(animated)
        newsTableView.reloadData()

    }

}

extension NewsTableViewController: UITableViewDataSource{

    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.news.articles?.count ?? 0)
        return self.news.articles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for:indexPath) as! NewsCellView
        
            if let newsarticles = self.news.articles {
                if indexPath.row < newsarticles.count{
                    if let imgurl = newsarticles[indexPath.row].urlToImage{
                        self.newsapi.loadNewsImages(urlimg: imgurl){ image in
                            //cellimage = image!
                            
                            DispatchQueue.main.async{
                                cell.textLabel?.text = newsarticles[indexPath.row].title
                                cell.imageView?.image = image
                            }
                        }
                    }
                        /*
                        self.newsapi.loadNewsImages(urlimg: imgurl){ image in
                            //self.loadedImages.append(image)
                            DispatchQueue.main.async{
                                cell.imageView?.image = image
                            }
                        }*/
                    }

            }else{
                print("Can't access item")
            }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print("Cell clicked, waiting for display view")
        
        let newsDetailVC = storyboard?.instantiateViewController(withIdentifier: "newsDetailViewController") as? NewsDetailViewController
        
        if let imgurl = self.news.articles?[indexPath.row].urlToImage{
                
            self.newsapi.loadNewsImages(urlimg: imgurl){ image in
                    //self.loadedImages.append(image)
                newsDetailVC?.newsImage = image ?? UIImage()
                            
                }
        }else{
            newsDetailVC?.newsImage = UIImage()
        }
        
        if let title = self.news.articles?[indexPath.row].title{
            newsDetailVC?.newsTitle = title
        }else{
            newsDetailVC?.newsTitle = "Not found"
        }
        
        if let description = self.news.articles?[indexPath.row].description{
            newsDetailVC?.newsDescription = "Description: "+description
        }else{
            newsDetailVC?.newsDescription = "Description: Not Found"
        }
        
        if let url = self.news.articles?[indexPath.row].url {
            newsDetailVC?.newsURL = "Lire l'article complet: "+url
        }else{
            newsDetailVC?.newsURL = "Lire l'article complet: Not Found"
        }
        
        if let content = self.news.articles?[indexPath.row].content {
            newsDetailVC?.newsContent = "Content: "+content
        }else{
            newsDetailVC?.newsContent = "Content: Not Found"
        }
        
        
        self.navigationController?.pushViewController(newsDetailVC!, animated:true)
        
        
    }
    
}





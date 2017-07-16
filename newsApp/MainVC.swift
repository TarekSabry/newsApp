//
//  MainVC.swift
//  newsApp
//
//  Created by Tarek Sabry on 7/16/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate {

    @IBOutlet weak var newsTabBar: UITabBar!
    @IBOutlet weak var newsTableView: UITableView!
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTabBar.delegate = self
        newsTabBar.selectedItem = newsTabBar.items![0] as UITabBarItem
        downloadGeneralNews()
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0 :
            downloadGeneralNews()
            break
        case 1 :
            downloadEconomyNews()
            break
        case 2 :
            downloadSportsNews()
            break
        case 3 :
            downloadTechNews()
            break
        case 4 :
            downloadScienceNews()
            break
        case 5 :
            downloadGamingNews()
            break
        default :
            break
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
        cell.configureCell(news: news[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: news[indexPath.row]._url)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    func downloadGeneralNews() {
        SwiftSpinner.show("Loading General News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(GENERAL_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,String>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"]!
                        article._url = obj["url"]!
                        request(obj["urlToImage"]!).responseData {
                                response in
                                let result = response.value
                                let image = UIImage(data: result!)
                                article._articleImage = image!
                                self.newsTableView.reloadData()
                                SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"]!
                        self.news.append(article)
                    }
                }
            }
        }
    }
    
    func downloadEconomyNews() {
        SwiftSpinner.show("Loading Economy News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(ECONOMY_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,Any>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"] as! String
                        article._url = obj["url"] as! String
                        request(obj["urlToImage"] as! String).responseData {
                            response in
                            let result = response.value
                            let image = UIImage(data: result!)
                            article._articleImage = image!
                            self.newsTableView.reloadData()
                            SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"] as! String
                        self.news.append(article)
                    }
                }
            }
            
        }
    }
    
    func downloadSportsNews() {
        SwiftSpinner.show("Loading Sports News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(SPORT_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,Any>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"] as! String
                        article._url = obj["url"] as! String
                        request(obj["urlToImage"] as! String).responseData {
                            response in
                            let result = response.value
                            let image = UIImage(data: result!)
                            article._articleImage = image!
                            self.newsTableView.reloadData()
                            SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"] as! String
                        self.news.append(article)
                    }
                }
            }
            
        }
    }
    
    func downloadScienceNews() {
        SwiftSpinner.show("Loading Science News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(SCIENCE_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,Any>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"] as! String
                        article._url = obj["url"] as! String
                        request(obj["urlToImage"] as! String).responseData {
                            response in
                            let result = response.value
                            let image = UIImage(data: result!)
                            article._articleImage = image!
                            self.newsTableView.reloadData()
                            SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"] as! String
                        self.news.append(article)
                    }
                }
            }
            
        }
    }
    
    func downloadTechNews() {
        SwiftSpinner.show("Loading Technology News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(TECHNOLOGY_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,Any>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"] as! String
                        article._url = obj["url"] as! String
                        request(obj["urlToImage"] as! String).responseData {
                            response in
                            let result = response.value
                            let image = UIImage(data: result!)
                            article._articleImage = image!
                            self.newsTableView.reloadData()
                            SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"] as! String
                        self.news.append(article)
                    }
                }
            }
            
        }
    }
    func downloadGamingNews() {
        SwiftSpinner.show("Loading Gaming News")
        if news.count != 0 {
            news.removeAll()
            newsTableView.reloadData()
        }
        request(GAMING_NEWS_URL).responseJSON { response in
            let result = response.value
            if let dict = result as? Dictionary<String,Any> {
                if let articles = dict["articles"] as? [Dictionary<String,Any>] {
                    for obj in articles {
                        let article = News()
                        article._source = dict["source"] as! String
                        article._title = obj["title"] as! String
                        article._url = obj["url"] as! String
                        request(obj["urlToImage"] as! String).responseData {
                            response in
                            let result = response.value
                            let image = UIImage(data: result!)
                            article._articleImage = image!
                            self.newsTableView.reloadData()
                            SwiftSpinner.hide()
                        }
                        article._publishedAt = obj["publishedAt"] as! String
                        self.news.append(article)
                    }
                }
            }
            
        }
    }

}


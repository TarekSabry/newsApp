//
//  News.swift
//  newsApp
//
//  Created by Tarek Sabry on 7/16/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//
import UIKit

class News {
    private var source : String!
    private var title : String!
    private var url : String!
    private var articleImage : UIImage!
    private var publishedAt : String!
    
    var _source : String {
        get {
            if source == nil {
                source = ""
            }
            return source.capitalized
        } set {
            source = newValue
        }
    }
    
    var _title : String {
        get {
            if title == nil {
                title = ""
            }
            return title
        } set {
            title = newValue
        }
    }
    
    var _url : String {
        get {
            if url == nil {
                url = ""
            }
            return url
        } set {
            url = newValue
        }
    }
    
    var _articleImage : UIImage {
        get {
            if articleImage == nil {
                articleImage = UIImage()
            }
            return articleImage
        } set {
            articleImage = newValue
        }
    }
    
    var _publishedAt : String {
        get {
            if publishedAt == nil {
                publishedAt = ""
            }
            return publishedAt
        } set {
            let date = newValue.components(separatedBy: "T")
            publishedAt = date[0]
        }
    }
}

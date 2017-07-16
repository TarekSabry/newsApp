//
//  NewsCell.swift
//  newsApp
//
//  Created by Tarek Sabry on 7/16/17.
//  Copyright © 2017 Tarek Sabry. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    func configureCell(news : News)
    {
        source.text = news._source
        publishedAt.text = news._publishedAt
        newsTitle.text = news._title
        articleImage.image = news._articleImage
    }

}

//
//  ViewController.swift
//  Example
//
//  Created by to4iki on 9/14/16.
//  Copyright (c) 2015 to4iki. All rights reserved.
//

import UIKit
import LruCache

class ViewController: UICollectionViewController {
    
    let CellReuseIdentifier = "Cell"
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        items = dummyItems()
    }
    
    private func configure() {
        collectionView?.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: CellReuseIdentifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(100, 100)
        
        collectionView?.collectionViewLayout = layout
    }
}

// MARK: - UIViewCollectionViewDataSource

extension ViewController {
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellReuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        let URLString = items[indexPath.row]
        cell.imageView.fetch(URLString)
        
        return cell
    }
}

// MARK: - Helpers

extension ViewController {
    
    func dummyItems() -> [String] {
        return [
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/scantron.png",
            "http://imgs.xkcd.com/comics/secretary_part_5.png",
            "http://imgs.xkcd.com/comics/secretary_part_4.png",
            "http://imgs.xkcd.com/comics/secretary_part_3.png",
            "http://imgs.xkcd.com/comics/secretary_part_2.png",
            "http://imgs.xkcd.com/comics/secretary_part_1.png",
            "http://imgs.xkcd.com/comics/actuarial.png",
            "http://imgs.xkcd.com/comics/scrabble.png",
            "http://imgs.xkcd.com/comics/twitter.png",
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/election.png", 
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/election.png", 
            "http://imgs.xkcd.com/comics/election.png",
            "http://imgs.xkcd.com/comics/election.png"
        ]
    }
}
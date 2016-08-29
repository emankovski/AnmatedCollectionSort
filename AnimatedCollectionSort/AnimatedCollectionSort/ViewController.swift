//
//  ViewController.swift
//  AnimatedCollectionSort
//
//  Created by Eugene Node on 8/29/16.
//  Copyright © 2016 Eugene Mankovski. All rights reserved.
//

import Cocoa

class Tag : NSObject {
    var value : String
    
    init(value : String){
        self.value = value
    }
}

class ViewController: NSViewController {

    private var lastSorting = true

    
    dynamic var tiles = [Tag]()

    
    @IBOutlet var arrayController: NSArrayController!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
             collectionView.itemPrototype = storyboard?.instantiateControllerWithIdentifier("ItemPrototype") as? NSCollectionViewItem
        
        super.viewDidLoad()

        for _ in 0...100 {
            tiles.append(Tag(value: Lorem.title))
        }
        
   
    }

    @IBAction func sortPressed(sender: AnyObject) {
     
        lastSorting = !lastSorting
        
        arrayController.sortDescriptors.removeAll()
        
        let descriptor = NSSortDescriptor(key: "value", ascending: lastSorting, selector: #selector(NSString.caseInsensitiveCompare))
        
        arrayController.sortDescriptors.append(descriptor)
    }
}


//
//  ViewController.swift
//  Flyweight
//
//  Created by Sergey Pohrebnuak on 6/5/19.
//  Copyright © 2019 Sergey Pohrebnuak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayOfImageView: [UIImage]!

    override func viewDidLoad() {
        super.viewDidLoad()
        let treeFactory = TreeFactory()
        arrayOfImageView = [UIImage]()
        for _ in 0...2000000 {
            let rect = CGRect(x: Int.random(in: 0...Int(self.view.frame.width-125)), y: Int.random(in: 0...Int(self.view.frame.height-125)), width: 125, height: 125)
            let view = UIImageView.init(frame: rect)
            let imageIndex = Int.random(in: 0...2)
            view.image = treeFactory.getImageTree(TreeType.allCases[imageIndex])
            arrayOfImageView.append(treeFactory.getImageTree(TreeType.allCases[imageIndex]))
            //self.view.addSubview(view)
        }
        print("app first step launch")
        var counter = 0
        for image in arrayOfImageView {
            if image === arrayOfImageView[0] {
                counter = counter + 1
            }
        }
        print(counter)
        print("app launch")
    }


}

class TreeFactory {
    private var treeDictionary = [String: UIImage]()
    func getImageTree(_ treeType: TreeType) -> UIImage {
//        if let image = self.treeDictionary[treeType.rawValue] {
//            return image
//        }
        
        let image = UIImage.init(named: treeType.rawValue)!
        treeDictionary[treeType.rawValue] = image
        return image
    }
}

enum TreeType: String, CaseIterable {
    case tree1
    case tree2
    case tree3
}

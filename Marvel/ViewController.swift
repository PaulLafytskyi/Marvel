//
//  ViewController.swift
//  Marvel
//
//  Created by Poul Lafitskiy on 2/18/18.
//  Copyright © 2018 PLF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fireRequest()
    }

    func fireRequest (){
        CharacterManagerFactory.manager().downloadCharacters(page: Page(), success: { (chars) in
            print(chars)
        }) { (error) in
            print(error)
        }
    }

}


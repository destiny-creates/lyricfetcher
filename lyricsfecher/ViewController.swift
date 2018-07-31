//
//  ViewController.swift
//  lyricsfecher
//
//  Created by Chris Cook on 7/31/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var artistNameTextField: UIView!
    
    @IBOutlet weak var artistSongTextField:UITextField!
    
    @IBOutlet weak var lyricsTextView: UITextView!
 
    let baseURL = "https://api.lyrics.ovh/v1/"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


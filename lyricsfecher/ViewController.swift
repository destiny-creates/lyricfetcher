//
//  ViewController.swift
//  lyricsfecher
//
//  Created by Chris Cook on 7/31/18.
//  Copyright © 2018 destinycreates. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var artistNameTextField: UITextField!
    
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
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        artistNameTextField.resignFirstResponder()
        artistSongTextField.resignFirstResponder()
        
        guard let artistName = artistNameTextField.text, artistName != "", let songTitle = artistSongTextField.text, songTitle != "" else {
            return
        }
        artistNameTextField.text = ""
        artistSongTextField.text = ""
        
        let artistNameURLComponent = artistName.replacingOccurrences(of: " ", with: "+")
        let songTitleURLComponent = songTitle.replacingOccurrences(of: " ", with: "+")
        
        let fullURL = baseURL + artistNameURLComponent + "/" + songTitleURLComponent
        
        Alamofire.request(fullURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.lyricsTextView.text = json["lyrics"].stringValue
            case .failure(let error):
                self.lyricsTextView.text = "Invalid selection entered or an error occured. Please try again."
                print(error)
                
            }
        }
        
    }
    
}


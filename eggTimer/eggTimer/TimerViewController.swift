//
//  TimerViewController.swift
//  eggTimer
//
//  Created by Yusuf Can Bircan on 28.09.2022.
//

import UIKit

class TimerViewController: UIViewController {

    var image: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
    }
    
    func showImage(){
        switch image!{
            case "1":
                imageView.image = UIImage(named: "egg1")
            case "2":
                imageView.image = UIImage(named: "egg2")
            case "3":
                imageView.image = UIImage(named: "egg3")
            case "4":
                imageView.image = UIImage(named: "egg4")
            default:
                break
        }
        
    }
    

}

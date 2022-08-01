//
//  DetailViewController.swift
//  Project1
//
//  Created by Esther Ramos on 31/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    //when we create the detail view controller we gave the storyboard ID  detail, which allows the load of the storyboard using a method called instantiate view controller with identify. Every view controller has a property called storyboard. There`s either a storyboard loaded from   or nil if you arent using storyboard.
    //In the case of view controller, it will be using main.storyboard which is the same storyboard that contains our detailviewcontroller, we can break this taks down into 3 smaller tasks: 1. we'll load the detail view controller from out storyboard. 2. set its selected image property to be the correct item from the pictures array. 3. show the new view controller (go to ViewController)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never

        //Line 24: checks and unwraps the optional in selected image. If for some reason the selected image is nil (which never should be), the imageView inside will never be executed. If it does have a a value it will be placed inside imagetoload then pass the UIimage and loaded.
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
    }

}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        
    }
    
}

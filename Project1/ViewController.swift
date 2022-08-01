//
//  ViewController.swift
//  Project1
//
//  Created by Esther Ramos on 30/07/22.
//

import UIKit

class ViewController: UITableViewController {
    
    //this array is going to be changed inside our loop, so we need to make it a variable, and tell what kind of data it will hold. In our case strings, each item will be the name of one NSSL pic.
    var pictures = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        //This is a builtin system type that lets us work with a file system, and in our case we`ll be using to loop the files.
        let fm = FileManager.default
        
        //a bundle is a directory containing our compiled program and all our assets. So this line says "tell me where I can find all those images I added to my app"
    
        // The ! on path: it is necessary because our bundle might not have resource path (some not ios bundles), and our main resource path must always have a resource path (obrigatory on ios) so you can force unwrap.
        
        
        let path = Bundle.main.resourcePath!
        
        //Then, make a new constant called items that set to the content of the directory at a path from the line before. The items array will be a constant collection of the names of all the files found in the resource directory of our app.
        
        //On try! we are saying "try to read the content of our resource path", this might fail and crash using the force try, but if we cannot read the content of out app bundle something is broken in our app and this should never happen. Thats why using try! is justified there.
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        //we start a loop going over all the items that has found on the directory
        
        //fm, path, items will all be destroyed as soon as viewdidload finishes. What we want to do is attach data to the whole viewcontroller type so it exist as long as our screen exist. In Swift this is done with a property. To declare a property declare it outside of methods (above class, line 13)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a pictute to load
                pictures.append(item)
            }
        }
        
        print(pictures)
        
    }
    
    //we have the override func here meaning that this thing is changing a behavior it got from its parent class. Its changing the number of rows and section method to mean something new
    //its shows tableview 3 times. its telling: this the tableview that triggered this request, this is the one asking how many rows should be in this section .
    //the section part is here because tableviews can have multiple sections. we`ll only have 1 section of pictures in our app so u can ignore this number, BUT we do need to return an INT for this number. We well return pics.count we want as many cells as we have pictures. one cell for each picture.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
//2. we need to specify what each row should look like
    
    //Override to to change de default behavour of the tableviewcontroller parent class. Called tableView as a method, it`ll pass in the tableview is making the request as its first parameter. Cellforrowat is the important of the method name, it contains a section number and a row number (indexPath). we only have 1 section here, so ignore that and just use the row number
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //we have a new constant called cell by dequeing a recycled cell from the table
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        //so a cell has a property called textlabel, but its optional, there might be or not one, if u had designed ur own, it woundnt be. the ? mean: do this only if there is an actual text label there of do nothing otherwise.
        
        //the second part, meand that index path.row contain the row number weve been asked to load, we`re using that to read the corresponding picture from the pictures array here, and place that into the cells text label
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            vc.selectedImage = pictures [indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
            
    }
}


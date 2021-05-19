//
//  ViewController.swift
//  stormviewer
//
//  Created by Justine Wright on 2021/05/19.
//

import UIKit
// uiviewcontroller -> builds on uitableviewcontroller
// id inspector first need to create new view and say that it is a viewcontroller
// need to set it as initial load under attribute inspector
// place view controller in navigation controller (editor embed in)
class ViewController: UITableViewController {
    
    private var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPictures()
        title = "Gallery"
        // Do any additional setup after loading the view.
        // content is kept in bundles
        // bundles have specific location
    }
    func loadPictures() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        // this try! is sometimes frowned upon because it can crash the app
        for item in items{
            if item.hasPrefix("nssl"){
                // picture to load
                pictures.append(item)
            }
        }
        print(pictures) //sanity check
    }
    // name of parameter first parameter not used externally-> same as function? something to do with objective c ????
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // section link in contact where names seperated by first letter
        pictures.count // don't have to say return => 1 line function
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) //using a pool
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // load detailed view controller
        // -> returns view controller
        // -> type cast to detailed view controller
        // -> load the view
        if let detailedViewController = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            detailedViewController.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(detailedViewController, animated: true)
        }
        // load image
        // display image
    }

}


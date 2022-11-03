//
//  ViewController.swift
//  HackwichSix
//
//  Created by user226981 on 10/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var myFriendsArray = ["Kalapawai Location"]
    
    @IBOutlet weak var tableView: UITableView!
    
    var myCountriesArray = ["Japan", "China", "South Korea", "Indonesia", "North America"]
    var friendsHomeArray = ["Kapolei"]
    
  var restaurantImageData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        restaurantImageData = dict!.object(forKey: "restaurantImages")
        as! [String]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriendsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
        let text = myFriendsArray[indexPath.row]
        cell?.textLabel?.text = text
        cell?.detailTextLabel?.text = friendsHomeArray[indexPath.row]
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mysSegue"
        { let s1 = segue.destination as! detailViewController
            let imageIndex = tableView.indexPathForSelectedRow?.row
            s1.imagePass = restaurantImageData[imageIndex!]
        }
    }



}


//
//  ViewController.swift
//  iOS-Foursquare-Integration-App
//
//  Created by Vasileios Loumanis on 21/03/2016.
//  Copyright © 2016 Vasileios Loumanis. All rights reserved.
//

import UIKit
import QuadratTouch

class VenuesViewController: UIViewController, FoursquareDelegate, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    var foursquare: Foursquare = Foursquare()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSearchBar.delegate = self
        foursquare.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let venue = foursquare.venues[indexPath.row]
        cell.textLabel?.text = venue["name"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let venues = foursquare.venues {
            return venues.count
        }
        return 0
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let location = searchBar.text {
            foursquare.search(location)
        }
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if let location = searchBar.text {
            foursquare.search(location)
        }
    }
    
    func searchFinished() {
        tableView.reloadData()

    }
}


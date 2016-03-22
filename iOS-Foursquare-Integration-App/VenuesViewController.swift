//
//  ViewController.swift
//  iOS-Foursquare-Integration-App
//
//  Created by Vasileios Loumanis on 21/03/2016.
//  Copyright © 2016 Vasileios Loumanis. All rights reserved.
//

import UIKit
import QuadratTouch

class VenuesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var foursquare: Foursquare = Foursquare()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationSearchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let venue = foursquare.venues[indexPath.row]
        if let venueLocation = venue["location"] as? JSONParameters {
            if let address = venueLocation["address"] as? String {
                cell.detailTextLabel?.text = address
            }
        }
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
            activityIndicator.startAnimating()
            foursquare.search(location) { () in
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        if let location = searchBar.text {
            activityIndicator.startAnimating()
            foursquare.search(location) { () in
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
}


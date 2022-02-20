//
//  SwipeTableViewController.swift
//  todo-list
//
//  Created by Yap Feng Yuan on 2022/02/17.
//

import UIKit
import SwipeCellKit
import ChameleonFramework

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            
            self.updateModel(at: indexPath)

        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    func updateModel(at indexPath: IndexPath ) {
        // Update data model
    }
    
    func updateNavBarColor(_ backgroundColor: UIColor) {
        guard let navBar = navigationController?.navigationBar else { fatalError("NavigationController does not exist") }
        
        let contrastOfBackgroundColor = ContrastColorOf(backgroundColor, returnFlat: true)
                
        // Small title colors: (also shown when large title collapses by scrolling down)
        navBar.barTintColor = backgroundColor
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Large title colors:
        navBar.backgroundColor = backgroundColor
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: contrastOfBackgroundColor]
        
        // Color the back button and icons: (both small and large title)
        navBar.tintColor = contrastOfBackgroundColor
    }
}

//
//  ViewController.swift
//  Challenge2
//
//  Created by Burak Yılmaz on 28.06.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var list = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Shopping List"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTapped))
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    @objc func addItem() {
        
        let alert = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let AddedItem = UIAlertAction(title: "Add", style: .default) { [weak self, weak alert] _ in
            guard let item = alert?.textFields?[0].text else {return}
            self?.list.insert(item, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        alert.addAction(AddedItem)
        present(alert, animated: true)
        
        
    }
    
    @objc func refreshTapped() {
        list.removeAll(keepingCapacity: false)
        tableView.reloadData()
    }


}


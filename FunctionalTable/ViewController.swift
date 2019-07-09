//
//  ViewController.swift
//  FunctionalTable
//
//  Created by Joel Meng on 7/9/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var items: [City] = cities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView(tableView)
    }
    
    // MARK: - TableView
    
    private func setupTableView(_ tableView: UITableView) {
        let nib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "SomeCell")
        }
        
        let item = items[indexPath.row]
        cell.config(item)
        return cell
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        let alert = UIAlertController(title: "Hola \(item.name)", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}


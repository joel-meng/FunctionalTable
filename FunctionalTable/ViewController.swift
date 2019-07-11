//
//  ViewController.swift
//  FunctionalTable
//
//  Created by Joel Meng on 7/9/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	private lazy var cityAdder: (() -> City?) = createCityAdder()

	private var searchDelegate: UISearchBarDelegate!
	
    @IBOutlet var tableView: UITableView!
	
	private lazy var originalItems: [City] = cities()
	
    private lazy var tableItems: [City] = originalItems.sorted(by: <)
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupAddCityBarButton()
		setupTableView(tableView)
		setupSearch()
    }
    
    // MARK: - TableView
    
    private func setupTableView(_ tableView: UITableView) {
        let nib = UINib(nibName: "CityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CityTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
		
		// FIXME: - using items

		tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "SomeCell")
        }
        
        let item = tableItems[indexPath.row]
        cell.config(item)
        return cell
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = tableItems[indexPath.row]
        let alert = UIAlertController(title: "Hola \(item.name)", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController {
	
	// MARK: - Add a new city
	
	private func createCityAdder() -> () -> City? {
		var index = 0
		return {
			defer {
				index += 1
			}
			let otherCities = moreCities()
			guard index < otherCities.count else {
				return nil
			}
			return otherCities[index]
		}
	}
	
	private func setupAddCityBarButton() {
		let addCityBarButton = UIBarButtonItem(barButtonSystemItem: .add,
											   target: self,
											   action: .addCityAction)
		navigationItem.rightBarButtonItem = addCityBarButton
	}
	
	@objc
	fileprivate func addCityAction() {
		guard let newCity = cityAdder() else { return }
		
		// FIXME: - Updating items
		
		originalItems.append(newCity)
		tableItems = originalItems.sorted(by: <)
		
		tableView.reloadData()
	}
}

extension ViewController {
	
	// MARK: - Search
	
	private func setupSearch() {
		definesPresentationContext = true
		
		self.searchDelegate = SearchDelegate { [weak self] text in
			guard let self = self else { return }
			if text.isEmpty {
				// FIXME: - Updating items
				self.tableItems = self.originalItems.sorted(by: <)
				self.tableView.reloadData()
				return
			}
			
			let filteredCities = self.tableItems.lazy.filter { (city) -> Bool in
				city.shortDescription.contains(text) || city.name.contains(text)
			}.sorted(by: <)
			
			// FIXME: - Updating items
			
			self.tableItems = filteredCities
			self.tableView.reloadData()
		}
		navigationItem.searchController = searchController(delegate: self.searchDelegate)
	}
	
	private func searchController(delegate: UISearchBarDelegate) -> UISearchController {
		let searchController = UISearchController()
		searchController.hidesNavigationBarDuringPresentation = true
		searchController.searchBar.placeholder = "Search"
		searchController.searchBar.barStyle = .default
		searchController.searchBar.textContentType = .countryName
		searchController.searchBar.tintColor = .black
		searchController.searchBar.autocapitalizationType = .none
		searchController.searchBar.isTranslucent = true
		searchController.searchBar.delegate = delegate
		return searchController
	}
}

fileprivate extension Selector {
	static let addCityAction = #selector(ViewController.addCityAction)
}

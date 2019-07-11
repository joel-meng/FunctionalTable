//
//  ViewController.swift
//  FunctionalTable
//
//  Created by Joel Meng on 7/9/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import UIKit
import Reflex

class ViewController: UIViewController {
	
	private lazy var cityAdder: (() -> City?) = createCityAdder()

	private var searchDelegate: UISearchBarDelegate!
	
	private var tableUpdater: (([City]) -> Void)!
	
	private var items: [City] = cities()
	
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupTable()
		
		// NOTE: - Update table
		tableUpdater(items.sorted(by: <))
		
		setupAddCityBarButton()
		setupSearch()
    }
	
	private func setupTable() {
		// NOTE: - Easy setup
		
		// Never ask for registering a cell for `City`
		// Never ask for nib files or `cellIdentifier` for a cell
		// Never tell table how to populate a cell for City
		
		tableUpdater = customCellDataUpdater(for: tableView) { [weak self] (city, cell: CityTableViewCell) in
			
			// Just tell cell what to do with some context (e.g. `self` here)
			//
			cell.didTap = {
				let alerter = UIAlertController(title: "Hola \(city.name)", message: nil, preferredStyle: .alert)
				alerter.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
				self?.present(alerter, animated: true, completion: nil)
			}
		}
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
		items.append(newCity)
		
		// NOTE: - Update table
		
		tableUpdater(items.sorted(by: <))
	}
}

extension ViewController {
	
	// MARK: - Search
	
	private func setupSearch() {
		definesPresentationContext = true
		
		self.searchDelegate = SearchDelegate { [weak self] text in
			guard let self = self else { return }
			if text.isEmpty {
				// NOTE: - Update table
				self.tableUpdater(self.items.sorted(by: <))
				return
			}
			
			let filteredCities = self.items.lazy.filter { (city) -> Bool in
				city.shortDescription.contains(text) || city.name.contains(text)
			}.sorted(by: <)
			// NOTE: - Update table
			self.tableUpdater(filteredCities)
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

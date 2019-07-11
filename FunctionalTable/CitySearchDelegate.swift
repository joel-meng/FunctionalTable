//
//  CitySearchDelegate.swift
//  FunctionalTable
//
//  Created by Joel Meng on 7/10/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import UIKit

class SearchDelegate: NSObject, UISearchBarDelegate {
	
	var filterAction: ((String) -> Void)!
	
	init(_ filter: @escaping (String) -> Void) {
		self.filterAction = filter
	}
	
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
	{
		//Show Cancel
		searchBar.setShowsCancelButton(true, animated: true)
		searchBar.tintColor = .black
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
	{
		//Filter function
		self.filterAction(searchText)
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
	{
		//Hide Cancel
		searchBar.setShowsCancelButton(false, animated: true)
		searchBar.resignFirstResponder()
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
	{
		//Hide Cancel
		searchBar.setShowsCancelButton(false, animated: true)
		searchBar.text = String()
		searchBar.resignFirstResponder()
		
		self.filterAction("")
	}
}

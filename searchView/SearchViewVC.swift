//
//  ViewController.swift
//  searchView
//
//  Created by odikk on 27/01/22.
//

import UIKit

class SearchViewVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    let constants = Constants.shared
    var data: [CollectionData] = []
    var searchData: [CollectionData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    private func setupData(){
        data = constants.generateData()
    }
    
    private func setupUI(){
        searchCollectionView.dataSource = self
        searchCollectionView.delegate   = self
        searchBar.delegate              = self
    }
    
    
}

extension SearchViewVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchData.count > 0 {
            return searchData.count
        } else {
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCell
        if searchData.count > 0 {
            cell.img.image  = searchData[indexPath.row].img
            cell.title.text = searchData[indexPath.row].name
            cell.title.textColor = .black
        } else {
            cell.img.image  = data[indexPath.row].img
            cell.title.text = data[indexPath.row].name
            cell.title.textColor = .black
        }
        return cell
    }
}

extension SearchViewVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            searchData = data.filter{ $0.name.localizedCaseInsensitiveContains(searchText) }
            searchCollectionView.reloadData()
            if searchData.count < 1 {
                searchCollectionView.isHidden = true
            } else {
                searchCollectionView.isHidden = false
            }
        } else {
            searchData.removeAll()
            searchCollectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchData.removeAll()
    }
}

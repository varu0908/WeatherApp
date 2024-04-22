//
//  CityListVC.swift
//  WeatherApp
//
//  Created by Varsha Verma on 19/04/24.
//

import UIKit

class CityListVC: UIViewController {
    var viewModel : CityListViewModelProtocol = CityListViewModel(manager: CityNetworking(manager: ApiService()))
    
    @IBOutlet weak var lblNoData: UILabel!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNoData.isHidden = true
        viewModel.getCities { _ in
            self.tableView.reloadData()
        }
    }
    
    @IBAction func changeText(_ sender: UITextField) {
        self.viewModel.search(text: sender.text!) {
            DispatchQueue.main.async {
                if self.viewModel.citySearchData.count == 0 {
                    self.lblNoData.isHidden = false
                }else {
                    self.lblNoData.isHidden = true
                }
                self.tableView.reloadData()
            }
        }
    }
}

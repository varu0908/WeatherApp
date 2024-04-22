//
//  CityListVC+Extension.swift
//  WeatherApp
//
//  Created by Varsha Verma on 22/04/24.
//

import Foundation
import UIKit

//MARK: - UITableViewDelegate, UITableViewDataSource

extension CityListVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        let x =  viewModel.getCellModelFor(index: indexPath.row)
        cell.lblCity.text = x.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfItem()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WeatherDetailVC") as! WeatherDetailVC
        vc.cellViewModel = viewModel.getCellModelFor(index: indexPath.row)
        self.navigationController?.present(vc, animated: true)
    }
}

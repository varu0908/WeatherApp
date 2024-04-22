//
//  WeatherDetailVC.swift
//  WeatherApp
//
//  Created by Varsha Verma on 20/04/24.
//

import UIKit

class WeatherDetailVC: UIViewController {
    
    var viewModel : WeatherViewModelProtocol = WeatherViewModel(manager: WeatherNetworking(manager: ApiService()))
    
    @IBOutlet weak var viewColor: UIView!{
        didSet{
            viewColor.cornerRadius(radius: 40)
        }
    }
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var bgView: UIView!{
        didSet{
            bgView.cornerRadius(radius: 20)
        }
    }
    
    @IBOutlet weak var txtweatherType: UITextField!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTemprature: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txthumidity: UITextField!
    @IBOutlet weak var txtvisibility: UITextField!
    @IBOutlet weak var txtWindSpeed: UITextField!
    
    
    var cellViewModel : CityCellViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    func setData() {
        viewModel.getWeatherData(cellViewModel.lat, cellViewModel.long) { [weak self] _ in
            DispatchQueue.main.async { [self] in
                self?.lblDate.text = self?.viewModel.todayDate
                self?.lblLocation.text = self?.viewModel.address
                self?.lblTemprature.text = self?.viewModel.temprature
                self?.txtvisibility.text = self?.viewModel.visibility
                self?.txthumidity.text = self?.viewModel.humidity
                self?.txtWindSpeed.text = self?.viewModel.windSpeed
                self?.txtweatherType.text = self?.viewModel.weatherType
            }
            DispatchQueue.main.async {
                self?.viewModel.imageURL.getIcon(image: { image in
                    self?.img.image = image
                })
            }
        }
    }
    
    @IBAction func tapONBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

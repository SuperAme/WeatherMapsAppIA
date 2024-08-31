//
//  WeatherMapsView.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit
import GoogleMaps

protocol WeatherMapsViewProtocol: AnyObject {
    func layoutMap(with longitude: Double, and latitude: Double, name: String)
    func showLoader()
    func hideLoader()
}

class WeatherMapsView: UIViewController {
    var presenter: WeatherMapsPresenterProtocol? = WeatherMapsPresenter()
    
    var loadingIndicator: UIActivityIndicatorView? = UIActivityIndicatorView()
    var loader: UIAlertController? = UIAlertController()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        layoutView()
    }
    
    private func layoutView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension WeatherMapsView: WeatherMapsViewProtocol {
    func layoutMap(with longitude: Double, and latitude: Double, name: String) {
        DispatchQueue.main.sync {
            // Do any additional setup after loading the view.
            // Create a GMSCameraPosition that tells the map to display the
            // coordinate -33.86,151.20 at zoom level 6.
            let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 4.0)
            let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            backgroundView.addSubview(mapView)

            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            marker.title = name
            marker.snippet = name
            marker.map = mapView
        }
    }
    
    func showLoader() {
        loader = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator?.hidesWhenStopped = true
        loadingIndicator?.style = UIActivityIndicatorView.Style.large
        loadingIndicator?.startAnimating()
        loader?.view.addSubview(loadingIndicator!)
        self.present(loader!, animated: true)
    }
    
    func hideLoader() {
        if (loadingIndicator != nil){
            DispatchQueue.main.async {
                self.loadingIndicator?.stopAnimating()
                self.loader?.dismiss(animated: true)
            }
        }
    }
}


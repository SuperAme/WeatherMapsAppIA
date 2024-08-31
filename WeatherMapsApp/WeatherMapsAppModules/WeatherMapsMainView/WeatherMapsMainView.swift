//
//  WeatherMapsMainView.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppViewProtocol: AnyObject {
    func showLoader()
    func hideLoader()
}

class WeatherMapsMainView: UIViewController {
    var presenter: WeatherMapsAppPresenterProtocol? = WeatherMapsMainPresenter()
    var loadingIndicator: UIActivityIndicatorView? = UIActivityIndicatorView()
    var loader: UIAlertController? = UIAlertController()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cloudsBackground")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var mapsButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.2535246611, green: 0.5639368892, blue: 0.5914651752, alpha: 1)
        button.tintColor = .white
        button.setTitle("See Maps", for: .normal)
        button.addTarget(self, action: #selector(callMaps), for: .touchUpInside)
        return button
    }()
    
    lazy var otherFragmentButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.2535246611, green: 0.5639368892, blue: 0.5914651752, alpha: 1)
        button.titleLabel?.numberOfLines = 2
        button.setTitle("See other fragment", for: .normal)
        button.addTarget(self, action: #selector(retrieveData), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy var servicesButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0.2535246611, green: 0.5639368892, blue: 0.5914651752, alpha: 1)
        button.titleLabel?.numberOfLines = 2
        button.setTitle("Execute Services", for: .normal)
        button.addTarget(self, action: #selector(callService), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }

    func setupLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(mapsButton)
        mainStackView.addArrangedSubview(otherFragmentButton)
        mainStackView.addArrangedSubview(servicesButton)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.heightAnchor.constraint(equalToConstant: 50),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 10),
            view.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func callService() {
        presenter?.didServiceButtonPressed()
    }
    
    @objc func retrieveData() {
        presenter?.getStoredData()
    }
    
    @objc func callMaps() {
        presenter?.goToWeatherMaps()
    }
    
    func showSuccesAlert() {
        loader = UIAlertController(title: nil, message: "Service Executed Succesfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true)
        }
        
        loader?.addAction(okAction)
        self.present(loader!, animated: true)
    }
}

extension WeatherMapsMainView: WeatherMapsAppViewProtocol {
    
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
        showSuccesAlert()
    }
}


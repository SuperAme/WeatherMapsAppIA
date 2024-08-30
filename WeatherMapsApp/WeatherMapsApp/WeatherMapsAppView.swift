//
//  WeatherMapsAppView.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 28/08/24.
//

import UIKit

protocol WeatherMapsAppViewProtocol: AnyObject {
    func didServiceButtonPressed1()
}

class WeatherMapsAppView: UIViewController {
    var presenter: WeatherMapsAppPresenterProtocol? = WeatherMapsAppPresenter()
    
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
        presenter?.viewDidLoad()
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
        didServiceButtonPressed1()
    }
    
    @objc func retrieveData() {
        presenter?.getStoredData()
    }
}

extension WeatherMapsAppView: WeatherMapsAppViewProtocol {
    func didServiceButtonPressed1() {
        presenter?.didServiceButtonPressed()
    }
    
    
}


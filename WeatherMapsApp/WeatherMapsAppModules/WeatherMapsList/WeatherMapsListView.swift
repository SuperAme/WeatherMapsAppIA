//
//  WeatherMapsListView.swift
//  WeatherMapsApp
//
//  Created by Americo Meneses on 30/08/24.
//

import UIKit

protocol WeatherMapsListViewProtocol: AnyObject {
    func update(with list: [WeatherMapsEntity]?)
}

class WeatherMapsListView: UIViewController {
    var presenter: WeatherMapsListPresenterProtocol? = WeatherMapsListPresenter()
    var weatherList: [WeatherMapsEntity] = [WeatherMapsEntity]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        presenter?.elements()
        layoutView()
    }
    
    private func layoutView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension WeatherMapsListView: WeatherMapsListViewProtocol {
    func update(with list: [WeatherMapsEntity]?) {
        if let weatherlistX = list {
            weatherList = weatherlistX
            tableView.reloadData()
        }
        
        
    }
}

extension WeatherMapsListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        var listContentConfiguration = UIListContentConfiguration.cell()
        listContentConfiguration.text = weatherList[indexPath.row].name
        
        cell.contentConfiguration = listContentConfiguration
        return cell
    }
    
    
}

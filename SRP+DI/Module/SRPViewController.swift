//
//  SRPViewController.swift
//  SRP
//
//  Created by Jeytery on 04.04.2022.
//

import UIKit
import SnapKit

// SRP - Single Responsobility Principle
// In UIKit we can create ViewController
// that response only for interaction with user
// create ui for it and take events

// it is very subjectively
// and you can say that you need two classes - for ui and for event
// you can devide your entities endlessly, but main opinion is to keep
// simplecity of your classes by responsing of very basic things

// this class is not golden idea of SRP principle
// but we don't interested in SOLID golden ideas
// we just wonna make our code better (c) raywenderlich SOLID course

protocol SRPViewControllerOutput: AnyObject {
    func view(didSelect joke: Joke, at indexPath: IndexPath)
}

class SRPViewController: UIViewController {
    
    var output: SRPViewControllerOutput!
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let spinner = UIActivityIndicatorView()
    
    private var jokes = Jokes()
    
    /* hard to read
    
    init() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        spinner.hidesWhenStopped = true
        spinner.isHidden = true
        spinner.startAnimating()
        
        ...
    }
     
    */
     
    /* More like SRP */
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureTableView()
        configureViewController()
        configureSpinner()
    }
    
    //
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
}

private extension SRPViewController {
    
    // SRP in methods
    // we can devide class setup to different parts
    // to make other programmers understand what this part of code response of
    
    // Exist many rules of 'clean' and 'dirt' methods/funcs but here
    // the main idea is just to devide big methods in sub-methods to clear
    // reading of code
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func configureSpinner() {
        view.addSubview(spinner)
        spinner.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        spinner.hidesWhenStopped = true
        spinner.isHidden = true
        spinner.startAnimating()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Jokes"
    }
}

extension SRPViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return jokes.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = jokes[indexPath.row].name
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        output?.view(didSelect: jokes[indexPath.row], at: indexPath)
    }
}

//MARK: - input
protocol SRPViewControllerInput: AnyObject {
    func displayJokes(_ jokes: Jokes)
    func showAlert(with title: String)
    
    func startLoading()
    func stopLoading()
}

extension SRPViewController: SRPViewControllerInput {
    func displayJokes(_ jokes: Jokes) {
        self.jokes = jokes
        tableView.reloadData()
    }
    
    func showAlert(with title: String) {
        let alert = UIAlertController(
            title: title,
            message: nil,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { _ in }))
        present(alert, animated: true, completion: nil)
    }
    
    func startLoading() {
        spinner.isHidden = false
    }
    
    func stopLoading() {
        spinner.isHidden = true
    }
}

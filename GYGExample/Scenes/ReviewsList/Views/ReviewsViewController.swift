//
//  ReviewsViewController.swift
//  GYGExample
//
//  Created by Judar Lima on 23/02/19.
//  Copyright © 2019 raduJ. All rights reserved.
//

import UIKit

protocol ReviewsDisplayProtocol: class {
    func displayReviews(viewModel: [ReviewViewModel])
    func displayError(message: String)
}

class ReviewsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadingView: UIView!
    private let cellIdentifier = "ReviewTableViewCell"
    private var viewModel: [ReviewViewModel] = []
    private var interactor: ReviewsListInteractorProtocol!
    
    init(interactor: ReviewsListInteractorProtocol) {
        super.init(nibName: "ReviewsViewController", bundle: Bundle.main)
        self.interactor = interactor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        interactor.listReviews()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil),
                           forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
    }
}

extension ReviewsViewController: ReviewsDisplayProtocol {
    func displayReviews(viewModel: [ReviewViewModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.loadingView.isHidden = true
            self?.viewModel = viewModel
            self?.tableView.reloadData()
        }
    }
        
    func displayError(message: String) {
        let alertVC = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.interactor?.listReviews()
        }))
        self.present(alertVC, animated: true, completion: nil)
    }
    
}

extension ReviewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                       for: indexPath) as? ReviewTableViewCell
            else { return UITableViewCell() }
        
        let review = viewModel[indexPath.row]
        cell.bind(review)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let message = viewModel[indexPath.row].message
        let cellHeight = calculateHeight(for: message)
        
        return cellHeight
    }
    
    func calculateHeight(for text: String) -> CGFloat {
        let messageString = text
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        let attributedString : NSAttributedString = NSAttributedString(string: messageString, attributes: attributes)
        let rect: CGRect = attributedString.boundingRect(
            with: CGSize(width: view.frame.width,
                         height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin, context: nil
        )
        
        let requiredSize:CGRect = rect
        let elementsConstraintsDifference: CGFloat = 120
        return requiredSize.height + elementsConstraintsDifference
    }
}

//
//  ListYearViewController.swift
//  Feature
//
//  Created by Rafael Ferreira on 12/31/19.
//  Copyright © 2019 Swift Yah. All rights reserved.
//

import Core
import UIKit

protocol ListYearDisplayLogic: AnyObject {
    func displayFetchedYears(viewModel: ListFeature.FetchYears.ViewModel)
}

final class ListFeatureViewController: UIViewController, ListYearDisplayLogic {
    private let tableView: UITableView = UITableView()

    // MARK: Variables

    weak var delegate: ListFeatureViewControllerDelegate?

    // MARK: Private constants

    private let yearDataSource: UICollectionViewDataSource & DataSource = CollectionViewDataSource.make(for: [])

    private let monthDataSource: UICollectionViewDataSource & DataSource = CollectionViewDataSource.make(for: [])

    private lazy var sectionDataSource: UICollectionViewDataSource & DataSource = {
        SectionedCollectionViewDataSource.make(dataSources: [monthDataSource])
    }()

    private let interactor: ListFeatureBusinessLogic

    // MARK: Initializers

    init(interactor: ListFeatureBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: Override functions

    override func loadView() {
        super.loadView()

        setupLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        fetch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupNavigationBar()
    }

    // MARK: ListYearDisplayLogic conforms

    func displayFetchedYears(viewModel: ListFeature.FetchYears.ViewModel) {
        // TODO: Present VM's data
    }

    // MARK: Private functions

    private func fetch() {
        interactor.fetchYears()
    }

    private func setupLayout() {
        view.addSubview(equalConstraintsFor: tableView)
    }

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .compose, target: self, action: .onAddTapped
        )
    }

    private func setupView() {
        title = Localizable.Feature.title
    }

    // MARK: Fileprivate functions

    @objc
    fileprivate func onRightBarButtonTapped() {
        delegate?.listYearRightBarButtonItemTapped(self)
    }
}

private extension CollectionViewDataSource where Model == String {
    static func make(for years: [Model]) -> CollectionViewDataSource<String, TitleCollectionViewCell> {
        CollectionViewDataSource<String, TitleCollectionViewCell>(models: years) { (model, cell) in
            cell.set(title: model)
        }
    }
}

private extension SectionedCollectionViewDataSource where Model == String, Cell == TitleCollectionReusableView {
    static func make(dataSources: [UICollectionViewDataSource]) -> SectionedCollectionViewDataSource {
        SectionedCollectionViewDataSource(sections: dataSources, sectionTitles: []) { (model, cell) in
            cell.set(title: model)
        }
    }
}

private extension Selector {
    static let onAddTapped = #selector(ListFeatureViewController.onRightBarButtonTapped)
}

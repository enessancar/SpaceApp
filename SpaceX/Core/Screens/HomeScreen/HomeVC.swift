//
//  HomeVC.swift
//  SpaceX
//
//  Created by Enes Sancar on 12.10.2023.
//

import UIKit
import SnapKit

protocol HomeVCInterface: AnyObject {
    func reloadCollectionView()
    func scrollToTop()
    func goToDetailVC(launch: Launch)
    func endRefreshing()
    
    func showLoadingView()
    func dismissLoadingView()
}

final class HomeVC: DataLoadingVC, HomeVCInterface {
    
    private var stackView: GFStackView!
    private var segmentedControl: UISegmentedControl!
    private var collectionView: UICollectionView!
    private var refreshControl: UIRefreshControl!
    
    lazy private var viewModel = HomeVCViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        
        configureVC()
        configureStackView()
        configureSegmentedControl()
        configureCollectionView()
        configureRefreshControl()
        
        viewModel.getLaunches(type: .upcoming)
    }
}

//MARK: - UI Logic
extension HomeVC {
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
        }
    }
    
    func goToDetailVC(launch: Launch) {
        DispatchQueue.main.async {
            let detailVC = DetailVC(launch: launch)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func endRefreshing() {
        DispatchQueue.main.async {
            guard self.refreshControl.isRefreshing else { return }
            self.refreshControl.endRefreshing()
        }
    }
}

//MARK: - CollectionView DataSource - Delegate
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return viewModel.upcomingLaunches.count
        }
        return viewModel.pastLaunches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCell.identifier, for: indexPath) as? LaunchCell else {
            fatalError()
        }
        if segmentedControl.selectedSegmentIndex == 0 {
            cell.setup(launch: viewModel.upcomingLaunches[indexPath.item])
        }
        else if segmentedControl.selectedSegmentIndex == 1 && !viewModel.pastLaunches.isEmpty{
            cell.setup(launch: viewModel.pastLaunches[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var id = ""
        
        if segmentedControl.selectedSegmentIndex == 0 {
            id = viewModel.upcomingLaunches[indexPath.item].id ?? ""
        } else {
            id = viewModel.pastLaunches[indexPath.item].id ?? ""
        }
        viewModel.getLaunchDetail(id: id)
    }
}


//MARK: - UI Configurations
extension HomeVC {
    private func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Launches"
        navigationItem.backButtonTitle = "Back"
    }
    
    private func configureStackView() {
        stackView = GFStackView(axis: .vertical)
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureSegmentedControl() {
        let items = ["Upcoming", "Past"]
        segmentedControl = UISegmentedControl(items: items)
        stackView.addArrangedSubview(segmentedControl)
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange), for: .valueChanged)
        
        segmentedControl.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width )
        }
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeCompositionLayout())
        stackView.addArrangedSubview(collectionView)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LaunchCell.self, forCellWithReuseIdentifier: LaunchCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
        }
    }
    
    private func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        collectionView.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
}

extension HomeVC {
    @objc private func segmentedControlDidChange(_ segmentControl: UISegmentedControl) {
        viewModel.segmentedControlDidChange(segmentControl.selectedSegmentIndex)
    }
    
    @objc private func refreshData() {
        viewModel.refreshData(segmentedControl.selectedSegmentIndex)
    }
}

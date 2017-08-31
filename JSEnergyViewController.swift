//
//  JSEnergyViewController.swift
//  信用能源
//
//  Created by Jusive on 2017/8/9.
//  Copyright © 2017年 Jusive. All rights reserved.
//

import UIKit
let JSEnergyViewControllercell = "JSEnergyViewControllercell"
class JSEnergyViewController: JSBaseViewController{
        override func viewDidLoad() {
        super.viewDidLoad()
            let FlowLayout =  JSCollectionVLayout()
        let CollectionV = UICollectionView.init(frame: view.bounds, collectionViewLayout: FlowLayout)
        view.addSubview(CollectionV)
         CollectionV.backgroundColor = JSScolor()
        CollectionV.delegate = self
        CollectionV.dataSource = self
        CollectionV.register(UICollectionViewCell.self, forCellWithReuseIdentifier: JSEnergyViewControllercell)
    }
    func JSCollectionVLayout() -> JSCollectionViewFlowLayout {
        let circleLayout = JSCollectionViewFlowLayout()
        circleLayout.itemCount = 100
        return circleLayout
    }
    func createCircleLayout() -> CollectionViewCircleLayout {
        let configuration = CircleLayoutConfiguration(withCellSize: CGSize(width: 50, height: 50), spacing:JSCREENW/2-50, offsetX: 0, offsetY: JSCREENH/2)
        let circleLayout = CollectionViewCircleLayout(withConfiguration: configuration)
        return circleLayout
    }
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: view.bounds.width/3,
                                     height: view.bounds.width/3)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        return flowLayout
    }
    func createStageLayout() -> CollectionViewStageLayout {
        let stageConfiguration = StageLayoutConfiguration(withCellSize: CGSize(width: 50, height: 50))
        let stageLayout = CollectionViewStageLayout(withConfiguration: stageConfiguration)
        return stageLayout
    }
    func createTimeMachineLayout() -> CollectionViewTimeMachineLayout {
        let configuration = TimeMachineLayoutConfiguration(withCellSize: CGSize(width: 200, height: 200))
        configuration.spacingX = 30
        configuration.spacingY = 30
        configuration.visibleCount = 20
        let timeMachineLayout = CollectionViewTimeMachineLayout(withConfiguration: configuration)
        return timeMachineLayout
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension JSEnergyViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 101
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JSEnergyViewControllercell, for: indexPath)
        cell.backgroundColor = JSScolor()
        return cell
    }
}
extension JSEnergyViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        JSNetWorkTool.sharedInstance.getRequest(urlString: "", params: [:], success: { (respion) in
            
        }) { (error) in
            
        }
    }
}
extension JSEnergyViewController:UICollectionViewDelegateFlowLayout {
}

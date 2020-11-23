//
//  OnboardingScreensVC.swift
//  YodaApp
//
//  Created by Lazaro Ambrosio on 11/22/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

class OnboardingScreensVC: UIViewController {
    
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var desctiptionLbl: UILabel!
    @IBOutlet weak var getStartedBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onBoardingCollectionView.delegate = self
        onBoardingCollectionView.dataSource = self
        setupCollectionView()
        setupPageController()
        configureGetStartedButtonUI()
    }
    
    @IBAction func getStartedBtnTapped(_ sender: Any) {
        Core.shared.setIsNotUser()
        dismiss(animated: true, completion: nil)
        return
    }
    
    private func showCaption(atIndex index: Int) {
        let slide = Slide.collection[index]
        titleLbl.text = slide.title
        desctiptionLbl.text = slide.description
    }
    
    private func setupPageController() {
        pageController.numberOfPages = Slide.collection.count
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection =  .horizontal
        onBoardingCollectionView.backgroundColor = .white
        onBoardingCollectionView.collectionViewLayout = layout
        onBoardingCollectionView.isPagingEnabled = true
        onBoardingCollectionView.showsHorizontalScrollIndicator = false
    }
    private func configureGetStartedButtonUI(){
        getStartedBtn.layer.cornerRadius = 10
    }
}

extension OnboardingScreensVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YodaOnboardingCell", for: indexPath) as! OnBoardingCollectionViewCell
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        pageController.currentPage = index
    }
}

class Core {
    
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotUser(){
        return UserDefaults.standard.set(true, forKey: "isNewUser")
        
    }
}

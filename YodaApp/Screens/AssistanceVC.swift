//
//  YodaAlertVC.swift
//  YodaApp
//
//  Created by Lazaro Ambrosio on 11/21/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit

class AssistanceVC: UIViewController {
    @IBOutlet weak var howToLbl: UILabel!
    @IBOutlet weak var howToDesctiptionLbl: UILabel!
    
    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var noteDesctiptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNaviagationControllerUI()
    }
    
    func configureNaviagationControllerUI() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: makeExitButton())
    }
    
    func makeExitButton() -> UIButton {
        let backButtonImage = UIImage(named: "x")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.tintColor = .black
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        return backButton
    }
    
    @objc func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  YodaApp
//
//  Created by Lazaro Ambrosio on 11/20/20.
//  Copyright © 2020 Lazaro Ambrosio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class YodaTranslationVC: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var userQuoteTextView: UITextView!
    @IBOutlet weak var translatedToYodishTextView: UITextView!
    
    @IBOutlet weak var convertToYodishBtn: UIButton!
    @IBOutlet weak var needAssistanceBtn: UIButton!
    
    
    let baseURL = "https://api.funtranslations.com/translate/yoda.json?text="
    
    var userQuoteTxt: String!
    var yodishText:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUITextField()
        configureUIButtons()
        userQuoteTextView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newUserShowInfoScreen()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func newUserShowInfoScreen() {
        if Core.shared.isNewUser() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "onBoardingVC") as! OnboardingScreensVC
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    @IBAction func convertToYodishBtnTapped(_ sender: Any) {
        getYodishTranslationNetwork()
    }
    
    
    func getYodishTranslationNetwork() {
        if userQuoteTextView.text != "" {
            userQuoteTxt = userQuoteTextView.text.replacingOccurrences(of: " ", with: "%20")
            
            let finalURL = baseURL + userQuoteTxt
            self.activityIndicator.startAnimating()
            
            Alamofire.request(finalURL, method: .get).responseJSON { response in
                
                if response.result.isSuccess {
                    let convertJSON : JSON = JSON(response.result.value!)
                    print(convertJSON)
                    
                    let amountJSON = convertJSON["contents"].dictionaryValue
                    print(amountJSON)
                    
                    let errorAmountJSON = convertJSON["error"].dictionaryValue
                    print(errorAmountJSON)
                    
                    for (key, value) in amountJSON{
                        if key == "translated"{
                            self.yodishText = value.string!
                        }
                    }
                    for (key, value) in errorAmountJSON{
                        if key == "message"{
                            self.yodishText = value.string!
                        }
                    }
                    print(self.yodishText!)
                    self.activityIndicator.stopAnimating()
                    self.translatedToYodishTextView.text = self.yodishText
                    self.translatedToYodishTextView.isHidden = false
                } else {
                    print("Unable to connect")
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        else {
            let alert = UIAlertController(title: "Error: Missing Text!", message: "TextField is empty. Please enter text.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert,animated: true, completion: nil)
            translatedToYodishTextView.isHidden = true
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
     private func configureUITextField() {
        userQuoteTextView.layer.cornerRadius = 5
        translatedToYodishTextView.layer.cornerRadius = 5
    }
    
     private func configureUIButtons() {
        convertToYodishBtn.layer.cornerRadius = 5
        needAssistanceBtn.layer.cornerRadius = 5
    }
}


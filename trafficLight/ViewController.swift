//
//  ViewController.swift
//  trafficLight
//
//  Created by Rimma Katushina on 20.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redSignal: UIView!
    @IBOutlet weak var yellowSignal: UIView!
    @IBOutlet weak var greenSignal: UIView!

    
    @IBOutlet weak var switchButtonStyle: UIButton!
    
    
    func makeCircle(view: UIView) {
//        view.contentMode = UIView.ContentMode.scaleToFill
        view.layer.cornerRadius = view.frame.height / 2
        print(view.frame.height)
        print(view.frame.size.height / 2)
        view.layer.masksToBounds = true
//        view.clipsToBounds = true
        
    }
    override func viewDidAppear(_ animated: Bool) {
        makeCircle(view: redSignal)
        makeCircle(view: yellowSignal)
        makeCircle(view: greenSignal)
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButtonStyle.configuration = setupButton(with: "Start")
        redSignal.alpha = 0.5
        yellowSignal.alpha = 0.5
        greenSignal.alpha = 0.5
    }
    
    
    @IBAction func switchButton() {
        switchButtonStyle.configuration = setupButton(with: "Next")
    
        
    }
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.title = title
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
        return buttonConfiguration
    }
}


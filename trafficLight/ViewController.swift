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
    
    override func viewDidAppear(_ animated: Bool) {
        makeCircle(view: redSignal)
        makeCircle(view: yellowSignal)
        makeCircle(view: greenSignal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButtonStyle.configuration = setupButton(with: "Start")
        redSignal.alpha = 0.5
        yellowSignal.alpha = 0.5
        greenSignal.alpha = 0.5
    }
    
    enum ActiveColors {
        case red
        case yellow
        case green
        case none
    }
    
    var activeColors = ActiveColors.none
    
    func makeCircle(view: UIView) {
        view.layer.cornerRadius = view.frame.height / 2
        view.layer.masksToBounds = true
    }
    
    @IBAction func switchButton() {
        switchButtonStyle.configuration = setupButton(with: "Next")
        switch activeColors {
        case .green:
            redSignal.alpha = 1
            greenSignal.alpha = 0.5
            activeColors = .red
        case .red:
            yellowSignal.alpha = 1
            redSignal.alpha = 0.5
            activeColors = .yellow
        case .yellow:
            yellowSignal.alpha = 0.5
            greenSignal.alpha = 1
            activeColors = .green
        case .none:
            redSignal.alpha = 1
            activeColors = .red
        }
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


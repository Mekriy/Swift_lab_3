//
//  ViewController.swift
//  labwork_3
//
//  Created by andriip on 13.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topCardViews: [UIView]!
    @IBOutlet var bottomCardViews: [UIView]!
    @IBOutlet var buttons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonSwapCards(_ sender: Any) {
        guard let button = sender as? UIButton,
              let index = buttons.firstIndex(of: button) else {
            return
        }
        
        let a = topCardViews[index]
        let b = bottomCardViews[index]
        
        UIView.transition(from: a, to: b, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        topCardViews[index].isHidden.toggle()
        bottomCardViews[index].isHidden.toggle()
    }
    
}

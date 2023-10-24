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
    var color1: UIColor = UIColor.red
    var count: Int = 0
    var winstreak: Int = 0
    var cardIndex: Int? = nil
    var WinCards: [Bool] = [false, false, false, false, false, false]
    @IBOutlet weak var WinningStreakLabel: UILabel!
    
    @IBAction func buttonSwapCards(_ sender: Any) {
        guard let button = sender as? UIButton,
              let index = buttons.firstIndex(of: button) else {
            return
        }
        
        let a = topCardViews[index]
        let b = bottomCardViews[index]
        if WinCards[index] == true{
            return
        }
        if !a.isHidden {
            UIView.transition(from: b, to: a, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            UIView.transition(from: a, to: b, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        
        a.isHidden.toggle()
        b.isHidden.toggle()
        	
        
        if count == 0 {
            color1 = b.backgroundColor!
            count += 1
            cardIndex = index
        }
        else {
            if cardIndex == index{
                count = 0
                return
            }
            else {
                if !topCardViews[cardIndex!].isHidden {
                    color1 = UIColor.white
                }
                if color1 == b.backgroundColor{
                    winstreak += 1
                    WinningStreakLabel.text = "Winning streak = \(winstreak)"
                    WinCards[cardIndex!] = true
                    WinCards[index] = true
                    count = 0
                }
                else{
                    winstreak = 0
                    WinningStreakLabel.text = "Winning streak = \(winstreak)"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        UIView.transition(from: b, to: a, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
                        let c = self.topCardViews[self.cardIndex!]
                        let d = self.bottomCardViews[self.cardIndex!]
                        UIView.transition(from: d, to: c, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
                        self.count = 0
                    }
                }
                
            }
        }
        
    }
}

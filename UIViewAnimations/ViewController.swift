//
//  ViewController.swift
//  UIViewAnimations
//
//  Created by Lindsay Penkrat on 2/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var alphaButton: UIButton!
    @IBOutlet weak var pulseButton: UIButton!
    @IBOutlet weak var colorChangeButton: UIButton!
    
    
    var colorIndex = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //viewDidAppear is called after UIKit has laid out sub views and displayed them
        let deviceWidth = view.frame.width
        imageView.frame.origin.x = deviceWidth
        alphaButton.frame.origin.x = deviceWidth
        pulseButton.frame.origin.x = deviceWidth
        colorChangeButton.frame.origin.x = deviceWidth
    }

    @IBAction func movePressed(_ sender: UIButton) {
        let centerX = view.center.x
        
        
        UIView.animate(withDuration: 0.5, animations: {self.imageView.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.alphaButton.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.pulseButton.center.x = centerX})
        UIView.animate(withDuration: 0.5, animations: {self.colorChangeButton.center.x = centerX})
       
        
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear, .repeat], animations: {self.imageView.center.x = centerX})
//        UIView.animate(withDuration:  2.0, delay: 0.0, options: [.curveEaseIn, .repeat], animations: {self.alphaButton.center.x = centerX}, completion: nil)
//        UIView.animate(withDuration:  2.0, delay:0.0, options: [.curveEaseOut, .repeat, .autoreverse], animations: {self.pulseButton.center.x = centerX}, completion: nil)
//        UIView.animate(withDuration:  2.0, delay: 0.0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {self.colorChangeButton.center.x = centerX}, completion: nil)
       
    }
    @IBAction func alphaPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1.0, animations: {
                        self.imageView.alpha = ( self.imageView.alpha == 1.0 ? 0.0 : 1.0)})
    }
    @IBAction func pulsePressed(_ sender: UIButton) {
        
        let originalFrame = sender.frame
        let widthShrink: CGFloat  = 30
        let heightShrink: CGFloat  = 10
        let smallerFrame = CGRect (x: sender.frame.origin.x + widthShrink, y: sender.frame.origin.y + heightShrink, width: sender.frame.width-(2 * widthShrink), height: sender.frame.height - (2 * heightShrink))
        sender.frame = smallerFrame
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, animations: {sender.frame = originalFrame})
        
        let originalImageFrame = imageView.frame
        let imageWidthShrink: CGFloat = 20
        let imageHeightShrink: CGFloat = 20
        let smallerImageFrame = CGRect (x: imageView.frame.origin.x + imageWidthShrink, y: imageView.frame.origin.y + imageHeightShrink, width: imageView.frame.width - (imageWidthShrink * 2 ), height: imageView.frame.height - (imageHeightShrink * 2 ))
        
        imageView.frame = smallerImageFrame
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: { self.imageView.frame = originalImageFrame})
    }
    @IBAction func colorChangePressed(_ sender: UIButton) {
        
        let colors: [UIColor] = [.red,.orange, .yellow, .green, .blue, .systemIndigo, .purple]
        UIView.animate(withDuration: 0.5, animations: {
            self.colorChangeButton.backgroundColor = colors[self.colorIndex]
        })
        
     
        
        colorIndex = (colorIndex+1 == colors.count ? 0: colorIndex + 1)
    }
    
}


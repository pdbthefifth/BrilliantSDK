//
//  NSPScoreViewController.swift
//  Pods
//
//  Created by Phillip Connaughton on 1/24/16.
//
//

import Foundation

protocol NPSScoreViewControllerDelegate: class{
    
    func closePressed(state: SurveyViewControllerState)
    func npsScorePressed(npsScore: Int)
}

class NPSScoreViewController : UIViewController
{
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var button0: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    @IBOutlet var button10: UIButton!
    
    @IBOutlet var labelWidthConstraint: NSLayoutConstraint!
    
    internal weak var delegate : NPSScoreViewControllerDelegate?
    
    override func viewDidLoad() {

        let image = UIImage(named: "brilliant-icon-close", inBundle:Brilliant.imageBundle(), compatibleWithTraitCollection: nil)
        self.closeButton.setImage(image, forState: .Normal)
        self.closeButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 25, right: 25)
        
        self.questionLabel.textColor = Brilliant.sharedInstance().mainLabelColor()
        self.questionLabel.font = Brilliant.sharedInstance().mainLabelFont()
        
        if (Brilliant.sharedInstance().appName != nil)
        {
            self.questionLabel.text = String(format: "How likely is it that you will recommend %@ to a friend or colleague?", Brilliant.sharedInstance().appName!)
        }
        else
        {
            self.questionLabel.text = "How likely is it that you will recommend this app to a friend or colleague?"
        }
        
        self.button0.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button1.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button2.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button3.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button4.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button5.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button6.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button7.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button8.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button9.tintColor = Brilliant.sharedInstance().npsButtonColor()
        self.button10.tintColor = Brilliant.sharedInstance().npsButtonColor()
        
        self.button0.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button1.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button2.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button3.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button4.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button5.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button6.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button7.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button8.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button9.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
        self.button10.titleLabel!.font = Brilliant.sharedInstance().npsButtonFont()
    }
    
    override func  viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.updateConstraints()
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        coordinator.animateAlongsideTransition(nil) { (completion) in
//            self.updateConstraints()
        }
    }
    
    func updateConstraints() {
        let size = UIDeviceHelper.deviceWidth()
        switch size
        {
        case .Small:
            self.labelWidthConstraint.constant = 280
            break
        case .Medium:
            self.labelWidthConstraint.constant = 300
            break
        case .Large:
            self.labelWidthConstraint.constant = 420
            break
        }

    }
    
    @IBAction func closePressed(sender: AnyObject) {
        Brilliant.sharedInstance().completedSurvey!.dismissAction = "x_npsscreen"
        self.delegate?.closePressed(.RatingScreen)
    }
    
    @IBAction func zeroPressed(sender: AnyObject) {
        self.npsNumberResponse(0)
    }
    
    @IBAction func onePressed(sender: AnyObject) {
        self.npsNumberResponse(1)
    }
    
    @IBAction func twoPressed(sender: AnyObject) {
        self.npsNumberResponse(2)
    }
    
    @IBAction func threePressed(sender: AnyObject) {
        self.npsNumberResponse(3)
    }
    
    @IBAction func fourPressed(sender: AnyObject) {
        self.npsNumberResponse(4)
    }
    
    @IBAction func fivePressed(sender: AnyObject) {
        self.npsNumberResponse(5)
    }
    
    @IBAction func sixPressed(sender: AnyObject) {
        self.npsNumberResponse(6)
    }
    
    @IBAction func sevenPressed(sender: AnyObject) {
        self.npsNumberResponse(7)
    }
    
    @IBAction func eightPressed(sender: AnyObject) {
        self.npsNumberResponse(8)
    }
    
    @IBAction func ninePressed(sender: AnyObject) {
        self.npsNumberResponse(9)
    }
    
    @IBAction func tenPressed(sender: AnyObject) {
        self.npsNumberResponse(10)
    }
    
    func npsNumberResponse(npsNumber: Int)
    {
        Brilliant.sharedInstance().completedSurvey!.npsRating = npsNumber
        self.delegate?.npsScorePressed(npsNumber)
    }
}
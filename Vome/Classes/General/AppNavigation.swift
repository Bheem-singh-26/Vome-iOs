//
//  AppNavigation.swift
//  Vome
//
//  Created by Bheem Singh on 16/09/17.
//  Copyright © 2017 Bheem Singh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{

    func popToRootViewController() {
        _ = self.navigationController?.popToRootViewController(animated: false)
    }
    
    func popViewController() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func removeNavigationBackButtonTitle(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func pushToPaymentPlan() {
        let payPlanVC = getMainStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.paymentPlan.rawValue) as! PaymentPlanViewController
        removeNavigationBackButtonTitle()
        self.navigationController?.pushViewController(payPlanVC, animated: true)
    }
    
    func pushToOpportunityBoard() {
        let payPlanVC = getMainStoryBoard().instantiateViewController(withIdentifier: StoryboardVCIdentifier.opportunityBoard.rawValue) as! OpportunityBoardViewController
        removeNavigationBackButtonTitle()
        self.navigationController?.pushViewController(payPlanVC, animated: true)
    }

    
}

//
//  OnboardingCoordinator.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//

import Foundation
import UIKit

class OnboardingCoordinator {
    
    weak var navigationController: UINavigationController?
    private var onboardingSteps: [OnboardingModel] = []
    
    func start(with navigationController: UINavigationController, onboardingSteps: [OnboardingModel]) {
        self.navigationController = navigationController
        self.onboardingSteps = onboardingSteps
        startOnboarding()
    }
    
    func startOnboarding() {
        guard !onboardingSteps.isEmpty else {
            transitionToMainScreen()
            return
        }
        
        
        // Start with the first onboarding step
        let step = onboardingSteps.removeFirst()
        showOnboardingStep(step)
    }
    
    private func showOnboardingStep(_ step: OnboardingModel) {
        let vc = OnboardingViewController()
        vc.updateWithModel(step)
        vc.delegate = self

        navigationController?.pushViewController(vc, animated: true)
    }
    
    func continueOnboarding() {
        if onboardingSteps.isEmpty {
            // Completed onboarding, transition to the main screen
            transitionToMainScreen()
        } else {
            // Show the next onboarding step
            let step = onboardingSteps.removeFirst()
            showOnboardingStep(step)
        }
    }
    
    private func transitionToMainScreen() {
        APIManager.simulateAPI() {
            AppManager.resetRootVCToHomeVC()
        }
    }

}

extension OnboardingCoordinator: OnboardingViewControllerDelegate {
    func nextStep(_ viewController: OnboardingViewController) {
        continueOnboarding()
    }
}

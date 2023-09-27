//
//  BaseDetailVC.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/25/23.
//
import UIKit
import SnapKit

enum DetailState {
case normal
case expanded
}

class BaseDetailVC: BaseViewController {
    
    // MARK: - Constants
    private static let animationDelay: TimeInterval = 0
    private static let NormalOffset: CGFloat = 300
    private static let ExpanedOffset: CGFloat = 100
    
    private var isPanningUp = false
    private var initialContainerViewY: CGFloat = BaseDetailVC.NormalOffset
    private lazy var state: DetailState = .normal
    
    // MARK: - Public func to update VC
    
    func setBackGroundImg(_ image: String) {
        mainImgV.image = UIImage(named: image)
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(mainImgV)
        mainImgV.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.size.height / 2)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(adapt(1000))
            make.top.equalToSuperview().offset(BaseDetailVC.NormalOffset)
        }
        
        containerView.addSubview(scrollHandlerView)
        scrollHandlerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(adapt(40))
        }
        
        scrollHandlerView.addSubview(scrollIndicator)
        scrollIndicator.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(adapt(5))
            make.width.equalTo(adapt(58))
        }
        
        containerView.addSubview(detailContainer)
        detailContainer.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(scrollHandlerView.snp.bottom)
        }
    }
    
    // MARK: - UI Components
    private lazy var mainImgV: UIImageView = {
        let imgV = UIImageView()
        imgV.image = UIImage(named: "detailFoodImg")
        return imgV
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = adapt(25)
        container.clipsToBounds = true
        
        return container
    }()
    
    private lazy var detailContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var scrollHandlerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handleUserPanGesture(_:)))
        
        view.addGestureRecognizer(panGesture)
        return view
    }()
    
    private lazy var scrollIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = adapt(5)
        

        return view
    }()
    
}

//MARK: - Panning Behavior
extension BaseDetailVC {
    
    @objc private func handleUserPanGesture(_ gesture: UIPanGestureRecognizer) {
        let translationY = gesture.translation(in: view).y
        let velocity = gesture.velocity(in: view).y

        switch gesture.state {
        case .began:
            initialContainerViewY = containerView.frame.origin.y
        case .changed:
            let newTop = initialContainerViewY + translationY
            isPanningUp = newTop > initialContainerViewY ? false : true
            
            // allowance to pan
            let allowanceToPan: CGFloat = 120
            let minY = BaseDetailVC.ExpanedOffset - 50
            let maxY = BaseDetailVC.NormalOffset + allowanceToPan

            if newTop < minY {
                print("min panned reach")
                return
            } else if newTop > maxY {
                print("max panned reach")
                return
            }

            containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(newTop)
            }
        case .ended:
            
            let currentOffset = containerView.frame.origin.y
            //If user pans quickly
            if  abs(velocity) > 300 {
                handleFastPanning(currentOffset: currentOffset, isPanUp: isPanningUp)
                return
            }
        
            handleEndPanGesture(currentOffset)
            
        default:
            break
        }
    }
    
    private func handleFastPanning(currentOffset: CGFloat ,isPanUp: Bool) {
        
        let targetOffset = isPanUp ? BaseDetailVC.ExpanedOffset : BaseDetailVC.NormalOffset
        let duration = getAnimationDuration(distance: currentOffset, from: targetOffset, isFastPan: true)
        
        if isPanUp {
            expandDetails(withDuration: duration)
        } else {
            minimizeDetails(withDuration: duration)
        }
    }
    
    private func getAnimationDuration(distance: CGFloat, from: CGFloat, isFastPan: Bool) -> TimeInterval {
        let durationFactor: CGFloat = isFastPan ? 300 : 200
        let minimumDuration: CGFloat = isFastPan ? 0.8 : 0.5
       
        let animationDistance = abs(from - distance)
        let duration = TimeInterval(animationDistance / durationFactor)
       
        print(duration)
        
        //set minimum animation duration to avoid long animations
        return min(minimumDuration, duration)
    }
    
    private func handleEndPanGesture(_ currentOffset: CGFloat) {
        let diffFromMin = BaseDetailVC.NormalOffset - currentOffset
        let threshold: CGFloat = 50
        
        //Will minimize if frame is within threshold of NormalOffset or beyond NormalOffset
        let shouldMinimize = abs(diffFromMin) < threshold || currentOffset > BaseDetailVC.NormalOffset
        
        //Target Offset
        let targetOffset = shouldMinimize ? BaseDetailVC.NormalOffset : BaseDetailVC.ExpanedOffset
        
        //Animation Duration
        let duration = getAnimationDuration(distance: currentOffset, from: targetOffset, isFastPan: false)
        
        if shouldMinimize {
            minimizeDetails(withDuration: duration)
        } else {
            expandDetails(withDuration: duration)
        }
    }
    
    private func expandDetails(withDuration duration: TimeInterval) {
        state = .expanded
        UIView.animate(withDuration: duration,
                       delay: BaseDetailVC.animationDelay,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.8) {
            self.containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(BaseDetailVC.ExpanedOffset)
            }
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }

    private func minimizeDetails(withDuration duration: TimeInterval) {
        state = .normal
        UIView.animate(withDuration: duration) {
            self.containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(BaseDetailVC.NormalOffset)
            }
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }

}

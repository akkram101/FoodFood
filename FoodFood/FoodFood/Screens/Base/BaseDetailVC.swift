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
    
    // MARK: = Properties
    
    ///Initial Top Contstraint of Detail View
    private var normalOffset: CGFloat = 400
    
    ///Allowance for user to pan downwards
    private var allowanceToPanDown: CGFloat = 150
    
    ///Allowance for user to pan downwards
    private var allowanceToPanUp: CGFloat = 50
    
    ///Top Constraint when user pans Detail View upwards
    private var expanedOffset: CGFloat = 100
    
    ///Bool Value to determine which direction user is panning to
    private var isPanningUp = false
    
    ///Save containerView Y position for pan gesture
    lazy private var initialContainerViewY: CGFloat = self.normalOffset
    
    ///State of BaseDetailVC
    private lazy var state: DetailState = .normal
    
    // MARK: - Public func to update VC
    
    ///Set Background Image
    func setBackGroundImg(_ image: String) {
        mainImgV.image = UIImage(named: image)
    }
    
    ///Set Background Image Content Mode
    func setBackGroundImg(contentMode: UIView.ContentMode) {
        mainImgV.contentMode = contentMode
    }
    
    ///Set Bottom View Top Constraint
    func setNormalOffset(offset: CGFloat) {
        normalOffset = offset
        containerView.snp.updateConstraints { make in
        make.top.equalToSuperview().offset(self.normalOffset)
        }
    }
    
    ///Set Allowable allowance to pan Detail View  downwards
    func setAllowanceToPanDown(_ allowance: CGFloat) {
        allowanceToPanDown = allowance
    }
    
    ///Set Allowable allowance to pan  Detail View upwards
    func setAllowanceToPanUp(_ allowance: CGFloat) {
        allowanceToPanUp = allowance
    }
    
    func setScrollableViewBackgroundColor(_ color: UIColor) {
        scrollHandlerView.backgroundColor = color
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(mainImgV)
        mainImgV.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.width.equalTo(ABLength.kScreenWidth)
            make.height.equalTo(ABLength.kScreenHeight / 2)
        }
        
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(adapt(1000))
            make.top.equalToSuperview().offset(self.normalOffset)
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
        imgV.contentMode = .scaleAspectFill
        
        return imgV
    }()
    
    private lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = adapt(25)
        container.clipsToBounds = true
        
        return container
    }()
    
    ///Public view that will contain Data
    lazy var detailContainer: UIView = {
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

//TODO: - REFACTOR TO SCROLL EVEN IN DETAIL CONTAINER
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
            
            let minY = expanedOffset - allowanceToPanUp
            let maxY = normalOffset + allowanceToPanDown

            //If current container position is beyond normalOffset + allowanceToPanUp return
            if newTop < minY {
                print("min panned reach")
                return
            //If current container position is below than expanded + allowanceToDown return
            } else if newTop > maxY {
                print("max panned reach")
                return
            }
            
            //Animation background Image
            animateBackgroundImg(withOffsetAmount: newTop)
            
            //Set new top constraints
            containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(newTop)
            }
            
        case .ended:
            let currentOffset = containerView.frame.origin.y
            resetBackGroundImg(withOffset: currentOffset)
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
        
        let targetOffset = isPanUp ? self.expanedOffset : self.normalOffset
        let duration = getAnimationDuration(distance: currentOffset, from: targetOffset, isFastPan: true)
        
        if isPanUp {
            expandDetails(withDuration: duration)
        } else {
            minimizeDetails(withDuration: duration)
        }
    }
    
    private func getAnimationDuration(distance: CGFloat, from: CGFloat, isFastPan: Bool) -> TimeInterval {
        let durationFactor: CGFloat = isFastPan ? 300 : 200
        let minimumDuration: CGFloat = isFastPan ? 0.5 : 0.3
       
        let animationDistance = abs(from - distance)
        let duration = TimeInterval(animationDistance / durationFactor)
       
//        print(duration)
        
        //set minimum animation duration to avoid long animations
        return min(minimumDuration, duration)
    }
    
    private func handleEndPanGesture(_ currentOffset: CGFloat) {
        let diffFromMax = self.normalOffset - currentOffset
        let diffFromMin = self.expanedOffset - currentOffset
        let threshold: CGFloat = 50
        
        //Will minimize if frame is within threshold of NormalOffset or beyond NormalOffset
        let shouldMinimize = abs(diffFromMax) < threshold || currentOffset > self.normalOffset
        if shouldMinimize {
            let duration = getAnimationDuration(distance: currentOffset, from: normalOffset, isFastPan: false)
            minimizeDetails(withDuration: duration)
            return
        }
        
        //Check which is closer
        let shouldMaximize = abs(diffFromMin) < abs(diffFromMax)
        //Target Offset
        let targetOffset = shouldMaximize ? self.expanedOffset : self.normalOffset
        
        //Animation Duration
        let duration = getAnimationDuration(distance: currentOffset, from: targetOffset, isFastPan: false)
        
        print(duration)
        if shouldMaximize {
            expandDetails(withDuration: duration)
        } else {
            minimizeDetails(withDuration: duration)
        }
    }
    
    private func expandDetails(withDuration duration: TimeInterval) {
        state = .expanded
        UIView.animate(withDuration: duration,
                       delay: BaseDetailVC.animationDelay,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.8) {
            self.containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(self.expanedOffset)
            }
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }

    private func minimizeDetails(withDuration duration: TimeInterval) {
        state = .normal
        UIView.animate(withDuration: duration) {
            self.containerView.snp.updateConstraints { make in
                make.top.equalToSuperview().offset(self.normalOffset)
            }
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateBackgroundImg(withOffsetAmount offset: CGFloat) {
        //Dont animate when below normal offset
        guard offset > self.normalOffset else {
            resetBackGroundImg(withOffset: offset)
            return
            
        }
        
        let offSetAmount = abs(self.normalOffset - offset)
        let ratio: CGFloat = 0.85
        UIView.animate(withDuration: 0) {
            self.mainImgV.snp.updateConstraints { make in
                make.width.equalTo(ABLength.kScreenWidth + offSetAmount * ratio)
                make.height.equalTo(ABLength.kScreenHeight / 2 + offSetAmount * ratio)
            }
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
        
    }
    
    private func resetBackGroundImg(withOffset offset: CGFloat) {
        let duration = getAnimationDuration(distance: offset, from: self.normalOffset, isFastPan: false)
        UIView.animate(withDuration: duration) {
            self.mainImgV.snp.updateConstraints { make in
                make.width.equalTo(ABLength.kScreenWidth)
                make.height.equalTo(ABLength.kScreenHeight / 2 )
            }
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }
    }

}

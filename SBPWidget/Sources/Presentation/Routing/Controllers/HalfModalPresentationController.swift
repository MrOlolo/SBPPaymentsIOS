//
//  HalfModalPresentationController.swift
//  SBPWidget
//
//  Created by Mykola Hordynchuk on 6/9/19.
//  Copyright © 2019 Mykola Hordynchuk. All rights reserved.
//

import UIKit

final class HalfModalPresentationController: UIPresentationController {
  private lazy var dimmingView: UIView = {
    guard let container = containerView else { return UIView() }
    
    let view = UIView(frame: container.bounds)
    view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    view.addGestureRecognizer( UITapGestureRecognizer(target: self, action: #selector(didTap(tap:))) )
    
    return view
  }()
  
  private lazy var bottomLayerView: UIView = {
    guard let container = containerView, let presentedView = presentedView else { return UIView() }
    
    let view = UIView(frame: CGRect(x: 0,
                                    y: container.frame.size.height - 40,
                                    width: container.frame.size.width,
                                    height: 120))
    view.backgroundColor = presentedView.backgroundColor
    return view
  }()
  
  var panGestureRecognizer: UIPanGestureRecognizer
  var direction: CGFloat = 0
  
  var dismissCallback: VoidClosure?
  
  @objc func didTap(tap: UITapGestureRecognizer) {
    dismissPresentedViewController()
  }
  
  private func dismissPresentedViewController() {
    dismissCallback?()
    presentedViewController.dismiss(animated: true, completion: nil)
  }
  
  override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
    self.panGestureRecognizer = UIPanGestureRecognizer()
    super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    panGestureRecognizer.addTarget(self, action: #selector(onPan(pan:)))
    presentedViewController.view.addGestureRecognizer(panGestureRecognizer)
  }
  
  override var frameOfPresentedViewInContainerView: CGRect {
    guard
      let containerView = containerView,
      let presentedView = presentedView else { return .zero }
    
    // Make sure to account for the safe area insets
    let fittingSize = CGSize(width: containerView.bounds.width,
                             height: UIView.layoutFittingCompressedSize.height)
    
    let targetHeight = presentedView.systemLayoutSizeFitting(
      fittingSize, withHorizontalFittingPriority: .required,
      verticalFittingPriority: .defaultLow).height
    
    var frame = containerView.bounds
    frame.origin.y += frame.size.height - targetHeight
    frame.size.width = containerView.bounds.width
    frame.size.height = targetHeight
    return frame
  }
  
  override func presentationTransitionWillBegin() {
    dimmingView.alpha = 0
    containerView?.addSubview(dimmingView)
    dimmingView.addSubview(presentedViewController.view)
    
    self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
      guard let self = self else { return }
      
      self.dimmingView.alpha = 1
    }, completion: nil)
  }
  
  override func containerViewDidLayoutSubviews() {
    super.containerViewDidLayoutSubviews()
    presentedViewController.view.round(corners: [.topLeft, .topRight], radius: 16)
    
    guard let containerView = containerView,
          let presentedView = presentedView else {
      return
    }
    
    presentedView
      .anchorLeft(containerView.leftAnchor, 0)
      .anchorRight(containerView.rightAnchor, 0)
      .anchorBottom(containerView.bottomAnchor, 0)
  }
  
  override func dismissalTransitionWillBegin() {
    presentingViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] (context) -> Void in
      guard let self = self else { return }
      
      self.dimmingView.alpha = 0
      }, completion: nil)
  }
  
  override func dismissalTransitionDidEnd(_ completed: Bool) {
    if completed { dimmingView.removeFromSuperview() }
  }
  
  @objc func onPan(pan: UIPanGestureRecognizer) -> Void {
    let endPoint = pan.translation(in: pan.view?.superview)
    
    switch pan.state {
    case .began:
      presentedView!.frame.size.height = containerView!.frame.height
    case .changed:
      let velocity = pan.velocity(in: pan.view?.superview)
      if endPoint.y > 0 {
        presentedView!.frame.origin.y = endPoint.y + (containerView!.frame.height - presentedView!.frame.height)
        bottomLayerView.frame.origin.y = endPoint.y + (containerView!.frame.height - bottomLayerView.frame.height)
      }
      direction = velocity.y
    case .ended:
      if direction > 0 {
        dismissPresentedViewController()
      } else {
        if let presentedView = presentedView, let containerView = self.containerView {
          UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: { () -> Void in
            presentedView.frame.origin.y = containerView.frame.height - presentedView.frame.height
            self.bottomLayerView.frame.origin.y = containerView.frame.height - 40
          }, completion: { (isFinished) in
            
          })
        }
      }
    default:
      break
    }
  }
}

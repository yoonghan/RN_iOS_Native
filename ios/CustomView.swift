//
//  CustomView.swift
//  RNiOSIntegration
//
//  Created by Han on 22/9/20.
//

import UIKit

class CustomView: UIView {
  
  var myLabel: MyLabel?
  
  //This is exposed to objective-c, see CustomView.m
  @objc var status = false {
    didSet {
      self.setupView()
    }
  }
  
  //This is exposed to objective-c, see CustomView.m
  @objc var text = "Initialize" {
    didSet {
      self.updateLabel()
    }
  }

  //This is exposed to objective-c, see CustomView.m
  @objc var onClick: RCTBubblingEventBlock?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
    createLabel()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }

  private func setupView() {
    self.backgroundColor = self.status ? .green : .red
    self.isUserInteractionEnabled = true
  }
  
  private func updateLabel() {
    if myLabel != nil {
      myLabel!.text = self.text
    }
  }

  private func createLabel() {
    myLabel = MyLabel(frame: CGRect(x: self.frame.size.width / 2, y: self.frame.size.height / 2, width: 100, height: 20))
    myLabel!.text = self.text
    self.addSubview(myLabel!)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let onClick = self.onClick else { return }

    let params: [String : Any] = ["value1":"react demo","value2":1]
    onClick(params)
  }

}

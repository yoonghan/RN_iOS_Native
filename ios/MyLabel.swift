//
//  MyLabel.swift
//  RNiOSIntegration
//
//  Created by Han on 23/9/20.
//
class MyLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
    }

    func initializeLabel() {
      self.textAlignment = .center
      self.textColor = UIColor.black
    }

}

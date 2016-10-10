
/**
 Simple circular view with the given background color and radius
 */
class CircleView: UIView {

    fileprivate var fillColor: UIColor
    fileprivate var circleLayer: CAShapeLayer?
    fileprivate var radius: Double

    init(radius: Double, color: UIColor) {
        self.fillColor = color
        self.radius = radius
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not intended for use in a NIB")
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setBlendMode(.multiply)
        context?.addEllipse(in: rect)
        context?.setFillColor(fillColor.cgColor.components!)
        fillColor.set()
        context?.fillPath();
    }

    override var intrinsicContentSize : CGSize {
        return CGSize(width: radius * 2, height: radius * 2)
    }
    
}

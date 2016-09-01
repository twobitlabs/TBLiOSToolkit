
/**
 Simple circular view with the given background color and radius
 */
class CircleView: UIView {

    private var fillColor: UIColor
    private var circleLayer: CAShapeLayer?
    private var radius: Double

    init(radius: Double, color: UIColor) {
        self.fillColor = color
        self.radius = radius
        super.init(frame: CGRectZero)
        backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not intended for use in a NIB")
    }

    override func drawRect(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        CGContextSetBlendMode(context, .Multiply)
        CGContextAddEllipseInRect(context, rect)
        CGContextSetFillColor(context, CGColorGetComponents(fillColor.CGColor))
        fillColor.set()
        CGContextFillPath(context)
    }

    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: radius * 2, height: radius * 2)
    }
    
}

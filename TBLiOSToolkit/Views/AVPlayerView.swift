
import AVFoundation

/**
 View suitable for presenting an AVPlayer
 */
class AVPlayerView: UIView {

    init(player: AVPlayer) {
        super.init(frame: CGRectZero)
        playerLayer().player = player
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not intended for use in a NIB")
    }

    override class func layerClass() -> AnyClass {
        return AVPlayerLayer.self
    }

    private func playerLayer() -> AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
}
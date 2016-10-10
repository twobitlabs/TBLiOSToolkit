
import AVFoundation

/**
 View suitable for presenting an AVPlayer
 */
class AVPlayerView: UIView {

    init(player: AVPlayer) {
        super.init(frame: CGRect.zero)
        playerLayer().player = player
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not intended for use in a NIB")
    }

    override class var layerClass : AnyClass {
        return AVPlayerLayer.self
    }

    fileprivate func playerLayer() -> AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
}

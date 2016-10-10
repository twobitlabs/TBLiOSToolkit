
/**
 Borrowed from http://nshipster.com/new-years-2016/ https://github.com/beeth0ven
 
 Example usage:
    GCDQueue.UserInitiated.executeAsync {
        let url = NSURL(string: "http://image.jpg")!
        let data = NSData(contentsOfURL: url)!
        let image = UIImage(data: data)

        GCDQueue.Main.executeAsync {
            imageView.image = image
        }
    }
 */

protocol ExcutableQueue {
    var queue: DispatchQueue { get }
}

extension ExcutableQueue {
    func executeAsync(_ closure: @escaping () -> Void) {
        queue.async(execute: closure)
    }
}

enum GCDQueue: ExcutableQueue {
    case main
    case userInteractive
    case userInitiated
    case utility
    case background

    var queue: DispatchQueue {
        switch self {
        case .main:
            return DispatchQueue.main
        case .userInteractive:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive)
        case .userInitiated:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
        case .utility:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.utility)
        case .background:
            return DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        }
    }
}

enum SerialQueue: String, ExcutableQueue {
    case DownLoadImage = "myApp.SerialQueue.DownLoadImage"
    case UpLoadFile = "myApp.SerialQueue.UpLoadFile"

    var queue: DispatchQueue {
        return DispatchQueue(label: rawValue, attributes: [])
    }
}



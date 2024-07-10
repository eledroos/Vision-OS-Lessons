import SwiftUI
import AVKit
import CoreMotion

struct ImmersiveView: View {
    @State private var viewOffset = CGSize.zero
    let motionManager = CMMotionManager()

    var body: some View {
        VideoPlayer(player: player)
            .aspectRatio(16/9, contentMode: .fit) // Maintain a 16:9 ratio
            .offset(x: viewOffset.width, y: viewOffset.height) // Apply motion-based offset
            .onAppear {
                player.play()
                setupMotionManager()
            }
            .edgesIgnoringSafeArea(.all) // Optional: to extend the video edges to the safe area boundaries
    }

    func setupMotionManager() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 1.0 / 60.0
            motionManager.startDeviceMotionUpdates(to: .main) { (motion, error) in
                guard error == nil else {
                    print("Error: \(error!)")
                    return
                }

                if let motion = motion {
                    let multiplier = 50.0
                    let pitch = motion.attitude.pitch * multiplier
                    let roll = motion.attitude.roll * multiplier
                    viewOffset = CGSize(width: roll, height: -pitch)
                }
            }
        }
    }
}

let player: AVPlayer = {
    guard let url = Bundle.main.url(forResource: "mars", withExtension: "mp4") else {
        debugPrint("Mars video not found")
        return AVPlayer()
    }
    let player = AVPlayer(url: url)
    player.actionAtItemEnd = .none
    NotificationCenter.default.addObserver(
        forName: .AVPlayerItemDidPlayToEndTime,
        object: player.currentItem,
        queue: .main) { _ in player.seek(to: .zero) }
    return player
}()

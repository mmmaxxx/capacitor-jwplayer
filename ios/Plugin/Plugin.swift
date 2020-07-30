import Foundation
import Capacitor
import UIKit
import AVFoundation
import AVKit


/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(JwPlayer)
public class JwPlayer: CAPPlugin {


    var player: JWPlayerController?
    var mainView: UIView!
    var subView: UIView!
    var videoHeight: CGFloat!




  @objc func renderPlayer(_ call: CAPPluginCall) {

    let videoPath = (call.getString("videoPath") ?? "") as String
    self.videoHeight = CGFloat((call.getFloat("height", 300)!)) as CGFloat



     DispatchQueue.main.async {



        let config = JWConfig(
         contentURL: videoPath
         )
         config.autostart = true

               self.player = JWPlayerController(config: config)

         self.mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.bridge.viewController.view.frame.width, height: self.videoHeight))
         self.subView = self.player!.view!
         self.subView.translatesAutoresizingMaskIntoConstraints = false

         self.bridge.viewController.view.addSubview(self.mainView)
         self.bridge.viewController.view.bringSubviewToFront(self.mainView)

         self.mainView.addSubview(self.subView)
         self.mainView.addConstraint(NSLayoutConstraint(item: self.subView, attribute: .top, relatedBy: .equal, toItem: self.mainView, attribute: .top, multiplier: 1.0, constant: 0.0))
         self.mainView.addConstraint(NSLayoutConstraint(item: self.subView, attribute: .leading, relatedBy: .equal, toItem: self.mainView, attribute: .leading, multiplier: 1.0, constant: 0.0))
         self.mainView.addConstraint(NSLayoutConstraint(item: self.mainView, attribute: .bottom, relatedBy: .equal, toItem: self.subView, attribute: .bottom, multiplier: 1.0, constant: 0.0))
         self.mainView.addConstraint(NSLayoutConstraint(item: self.mainView, attribute: .trailing, relatedBy: .equal, toItem: self.subView, attribute: .trailing, multiplier: 1.0, constant: 0.0))

        NotificationCenter.default.addObserver(
             self,
         selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)






 //        if let playerView = self.player?.view {
 //            self.bridge.viewController.view.addSubview(self.player!.view!)
 //            self.bridge.viewController.view.bringSubviewToFront(self.player!.view!)
 //            playerView.constrainToSuperview()
 //        }

     }



   }

    @objc func changeVideoPath(_ call: CAPPluginCall) {

        let videoPath = (call.getString("videoPath") ?? "") as String
        DispatchQueue.main.async {
            print(videoPath)
            self.player?.stop()
            let config = JWConfig(
            contentURL: videoPath
            )
            let videoData = JWPlaylistItem(config: config)
            self.player?.load([videoData])
            self.player?.play()
        }


    }

    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            self.mainView.frame = CGRect(x: 0, y: 0, width: self.bridge.viewController.view.frame.width, height: self.bridge.viewController.view.frame.height)
        }

        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            self.mainView.frame = CGRect(x: 0, y: 0, width: self.bridge.viewController.view.frame.width, height: self.videoHeight)
        }
    }

    @objc func destroyPlayer(_ call: CAPPluginCall) {

           DispatchQueue.main.async {
            self.player!.stop()
              self.subView.removeFromSuperview()
               self.mainView.removeFromSuperview()

           }

       }


}

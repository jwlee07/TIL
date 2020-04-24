import UIKit
import PlaygroundSupport

// green view를 super로 생성 후 red, blue를 sub view로 생성
class MyViewController : UIViewController {
    override func loadView() {
            let view = UIView()
            view.frame.size = CGSize (width: 375, height: 667)
            view.backgroundColor = .white
            self.view = view
        }
    override func viewDidLoad() {
        let greenView = setupSuperView()
        let redView = setupSubView(superView: greenView)
        let blueView = setupSubViewTwo(superView: greenView)
    }
    
    func setupSuperView() -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect (x: 50, y: 50, width: 200, height: 200)
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        return greenView
    }
    func setupSubView(superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect (x: 0, y: 0, width: 80, height: 80)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    func setupSubViewTwo(superView: UIView) -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect (x: 100, y: 100, width: 80, height: 80)
        blueView.backgroundColor = .blue
        superView.addSubview(blueView)
        return blueView
    }
}

// super view 정보를 사용하여 width 지정
 class MyViewController : UIViewController {
     override func loadView() {
         let view = UIView()
         view.frame.size = CGSize (width: 375, height: 667)
         view.backgroundColor = .white
         self.view = view
     }
     override func viewDidLoad() {
         let blueView = blueViewSup()
     }
     func blueViewSup () -> UIView {
         let blueView = UIView()
        blueView.frame = CGRect (x: 15, y: 15, width: view.frame.size.width - 30, height: 100)
         blueView.backgroundColor = .blue
         view.addSubview(blueView)
         return blueView
     }
 }

// view 3개 생성 후 orign 30, size 60 간격으로 생성
class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize (width: 375, height: 667)
        view.backgroundColor = .white
        self.view = view
    }
    override func viewDidLoad() {
        let blueView = blueViewSup()
        let redView = redViewSub(superView: blueView)
        let greenView = greenViewSub(superView: redView)
    }
    func blueViewSup () -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect (x: 30, y: 30, width: view.frame.size.width - 60, height: view.frame.size.height - 60)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        return blueView
    }
    func redViewSub (superView: UIView) -> UIView {
        let redView = UIView()
        redView.frame = CGRect (x: 30, y: 30, width: view.frame.size.width - 120, height: view.frame.size.height - 120)
        redView.backgroundColor = .red
        superView.addSubview(redView)
        return redView
    }
    func greenViewSub (superView: UIView) -> UIView {
        let greenView = UIView()
        greenView.frame = CGRect (x: 30, y: 30, width: view.frame.size.width - 180 , height: view.frame.size.height - 180)
        greenView.backgroundColor = .green
        superView.addSubview(greenView)
        return greenView
    }
}
 
PlaygroundPage.current.liveView = MyViewController()
 

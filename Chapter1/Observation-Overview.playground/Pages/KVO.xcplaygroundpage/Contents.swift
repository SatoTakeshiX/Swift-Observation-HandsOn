//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

final class BookObjectObserve: NSObject {
    @objc dynamic var isBorrowed: Bool
    init(isBorrowed: Bool) {
        self.isBorrowed = isBorrowed
    }
    func switchBorrow() {
        isBorrowed.toggle()
    }
}

final class BookViewController : UIViewController {

    @objc let bookModel = BookObjectObserve(isBorrowed: false)
    var observation: NSKeyValueObservation?
    private var label: UILabel = .init()

    private var button: UIButton = .init()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "貸出可能"
        label.textColor = .black

        view.addSubview(label)
        self.view = view

        button.setTitle("この本を返す", for: .normal)
        button.frame = CGRect(x: 150, y: 300, width: 200, height: 20)
        button.backgroundColor = .red

        button.addTarget(self, action: #selector(changeBorrowed), for: .touchUpInside)
        view.addSubview(button)

//        observation = observe(\.bookModel.isBorrowed, options: [.old, .new]) { object, change in
//            if change.newValue == true {
//                object.label.text = "貸出中"
//                object.button.setTitle("この本を借りる", for: .normal)
//            } else {
//                object.label.text = "貸出可能"
//                object.button.setTitle("この本を返す", for: .normal)
//            }
//
//        }

        // setupUI()
    }
    func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        //view.translatesAutoresizingMaskIntoConstraints = false

//        view.topAnchor.constraint(equalTo: label.topAnchor, constant: 16).isActive = true
//        view.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
//
//        label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 8).isActive = true
//        view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true

        view.layer.borderColor = UIColor.green.cgColor
        view.layer.borderWidth = 4

    }
    @objc func changeBorrowed() {
        bookModel.switchBorrow()
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = BookViewController()
// PlaygroundPage.current.needsIndefiniteExecution = true


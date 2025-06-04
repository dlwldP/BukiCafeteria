import UIKit

class ExitViewController: UIViewController {
    
    private let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("앱 종료하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemRed
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        setupLayout()
        exitButton.addTarget(self, action: #selector(endApp), for: .touchUpInside)
    }
    
    private func setupLayout() {
        view.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exitButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            exitButton.widthAnchor.constraint(equalToConstant: 200),
            exitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func endApp() {
        exit(0)  // 실제 앱 배포 시 제거 권장
    }
}

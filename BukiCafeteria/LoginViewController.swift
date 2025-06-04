import UIKit

class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Buki Cafeteria"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        // 뷰 추가
        view.addSubview(titleLabel)
        view.addSubview(loginButton)

        // 제약 조건 설정
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),

            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func loginTapped() {
        print("로그인 버튼 눌림")
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "WeeklyMenuViewController") as? WeeklyMenuViewController else {
            print("WeeklyMenuViewController 인스턴스 생성 실패")
            return
        }
        print("WeeklyMenuViewController 인스턴스 생성 성공")

        if let nav = navigationController {
            print("navigationController 있음")
            nav.pushViewController(vc, animated: true)
        } else {
            print("navigationController 없음")
        }
    }
}

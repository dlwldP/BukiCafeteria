import UIKit

class WeeklyMenuViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주간 식단"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("주간 식단 보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(menuTapped), for: .touchUpInside)
        return button
    }()

    private let reviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("리뷰 보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(reviewTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(menuButton)
        view.addSubview(reviewButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            menuButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 220),
            menuButton.heightAnchor.constraint(equalToConstant: 54),

            reviewButton.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 20),
            reviewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reviewButton.widthAnchor.constraint(equalToConstant: 160),
            reviewButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc func menuTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TodayMenuViewController") as! TodayMenuViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func reviewTapped() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

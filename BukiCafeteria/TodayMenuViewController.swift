import UIKit

class TodayMenuViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 식단"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let categoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카테고리 선택", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(categoryTapped), for: .touchUpInside)
        return button
    }()

    private let orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("주문하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(orderTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(categoryButton)
        view.addSubview(orderButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            categoryButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            categoryButton.widthAnchor.constraint(equalToConstant: 220),
            categoryButton.heightAnchor.constraint(equalToConstant: 54),

            orderButton.topAnchor.constraint(equalTo: categoryButton.bottomAnchor, constant: 30),
            orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderButton.widthAnchor.constraint(equalToConstant: 220),
            orderButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }

    @objc func categoryTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CategoryPickerViewController") as? CategoryPickerViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func orderTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MenuDetailViewController") as? MenuDetailViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

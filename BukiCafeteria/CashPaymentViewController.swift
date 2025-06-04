import UIKit

class CashPaymentViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "현금 결제"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "현금 결제 창 입니다."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제 완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(guideLabel)
        view.addSubview(confirmButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            guideLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            guideLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            guideLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            confirmButton.topAnchor.constraint(equalTo: guideLabel.bottomAnchor, constant: 40),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 200),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        confirmButton.addTarget(self, action: #selector(payWithCash), for: .touchUpInside)
    }

    @objc func payWithCash(_ sender: UIButton) {
        completePayment(method: "현금")
    }

    func completePayment(method: String) {
        let alert = UIAlertController(title: "결제 완료", message: "\(method) 결제가 완료되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ExitViewController") as! ExitViewController
            self.navigationController?.pushViewController(vc, animated: true)
        })
        present(alert, animated: true)
    }
}

import UIKit

class CardPaymentViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카드 결제"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let payButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("결제하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
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
        view.addSubview(payButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            payButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            payButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            payButton.widthAnchor.constraint(equalToConstant: 200),
            payButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        payButton.addTarget(self, action: #selector(payWithCard), for: .touchUpInside)
    }

    @objc func payWithCard() {
        completePayment(method: "카드")
    }

    func completePayment(method: String) {
        let alert = UIAlertController(
            title: "결제 완료",
            message: "\(method) 결제가 완료되었습니다.",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ExitViewController") as! ExitViewController
            self.present(vc, animated: true)
        })

        present(alert, animated: true)
    }
}

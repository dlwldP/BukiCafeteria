import UIKit

class ReviewViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "식단 리뷰"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let writeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("리뷰 작성", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(writeReview), for: .touchUpInside)
        return button
    }()

    private let viewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("리뷰 보기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(viewReviews), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(writeButton)
        view.addSubview(viewButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            writeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            writeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            writeButton.widthAnchor.constraint(equalToConstant: 220),
            writeButton.heightAnchor.constraint(equalToConstant: 54),

            viewButton.topAnchor.constraint(equalTo: writeButton.bottomAnchor, constant: 20),
            viewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewButton.widthAnchor.constraint(equalToConstant: 220),
            viewButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }

    @objc func writeReview(_ sender: UIButton) {
        let alert = UIAlertController(title: "리뷰 작성", message: "리뷰를 작성해주세요", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "작성", style: .default) { _ in
            let review = alert.textFields?.first?.text ?? ""
            Review.shared.reviews.append(review)
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    @objc func viewReviews(_ sender: UIButton) {
        let message = Review.shared.reviews.isEmpty ? "작성된 리뷰가 없습니다." : Review.shared.reviews.joined(separator: "\n\n")
        let alert = UIAlertController(title: "리뷰 확인", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}

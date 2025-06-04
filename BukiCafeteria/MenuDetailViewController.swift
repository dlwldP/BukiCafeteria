import UIKit

class MenuDetailViewController: UIViewController {
    var menu: Menu?

    @IBOutlet weak var menuTitleLabel: UILabel!
    @IBOutlet weak var menuPriceLabel: UILabel!
    @IBOutlet weak var menuDescriptionLabel: UILabel!

    @IBOutlet weak var addToCartButton: UIButton!
   // @IBOutlet weak var goToPaymentButton: UIButton!
    @IBOutlet weak var goToPaymentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        menuTitleLabel.text = menu?.name
        menuTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        menuTitleLabel.textAlignment = .center

        menuPriceLabel.text = "\(menu?.price ?? 0)원"
        menuPriceLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        menuPriceLabel.textColor = .systemBlue
        menuPriceLabel.textAlignment = .center

        menuDescriptionLabel.text = menu?.description
        menuDescriptionLabel.font = UIFont.systemFont(ofSize: 16)
        menuDescriptionLabel.numberOfLines = 0

        // ✅ 버튼 텍스트 설정 추가
        addToCartButton.setTitle("장바구니 담기", for: .normal)
        goToPaymentButton.setTitle("결제하기", for: .normal)

        styleButton(addToCartButton, color: .systemBlue)
        styleButton(goToPaymentButton, color: .systemGreen)
    }


    private func styleButton(_ button: UIButton, color: UIColor) {
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        if let menuItem = menu {
            Cart.shared.items.append(menuItem)

            let alert = UIAlertController(
                title: "장바구니",
                message: "\(menuItem.name) 장바구니에 담겼습니다.",
                preferredStyle: .alert
            )

            // ✅ 확인 누르면 화면 이동
            alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
                if let cartVC = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") {
                    self.navigationController?.pushViewController(cartVC, animated: true)
                }
            })

            present(alert, animated: true)
        }
    }



    @IBAction func goToPaymentTapped(_ sender: UIButton) {
        let paymentVC = storyboard?.instantiateViewController(withIdentifier: "PaymentTabBarController") as! PaymentTabBarController
        navigationController?.pushViewController(paymentVC, animated: true)
    }
}

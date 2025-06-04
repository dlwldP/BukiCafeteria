import UIKit

class CartViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.shared.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        let menuItem = Cart.shared.items[indexPath.row]
        cell.textLabel?.text = menuItem.name
        return cell
    }

    @IBAction func goToPayment(_ sender: UIButton) {
        print("🟢 goToPayment 호출됨")

        if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "PaymentTabBarController") as? PaymentTabBarController {
            print("✅ PaymentTabBarController 인스턴스 생성 성공")
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true)
        } else {
            print("🚫 PaymentTabBarController 인스턴스 생성 실패 - storyboard ID를 확인하세요.")
        }
    }





}

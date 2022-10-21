//
//  ViewController.swift
//  Produtividade
//
//  Created by Alberto Sartori Rodrigues on 08/08/22.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var tabela: UITableView!
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var elementos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabela.dataSource = self
        tabela.delegate = self
    }
    
    @IBAction func cliqueBotaoAdicionar(_ sender: Any) {
        let alerta = UIAlertController(title: "Título", message: "Mensagem", preferredStyle: .alert)
        alerta.view.backgroundColor = .blue
        alerta.view?.tintColor = .white
        alerta.view?.layer.cornerRadius = 25
        
        
        alerta.addTextField { textField in
            textField.textColor? = .blue
            textField.placeholder = "Escreva"
        }
        let botaoOK = UIAlertAction(title: "Ok", style: .default){ _ in
            
            if let texto = alerta.textFields?.first?.text {
                self.elementos.append(texto)
            }
            self.tabela.reloadData()
        }
        
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoOK)
        alerta.addAction(botaoCancelar)
        present(alerta, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tabela.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        cell.backgroundColor = .cyan
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = elementos[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Tarefas"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if  editingStyle  == .delete{
            self.elementos.remove(at: indexPath.row)
            tabela.reloadData()
        }
    }
    
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
       // tabela.deselectRow(at: indexPath, animated: true)
    }
}

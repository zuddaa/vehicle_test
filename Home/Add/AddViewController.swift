//
//  AddViewController.swift
//  Home
//
//  Created by Izudin Vragic on 27. 4. 2023..
//

import UIKit
import SnapKit
import RxSwift

class AddViewController: UIViewController {

  
  let vinField = UITextField()
  let bodyTypeField = UITextField()
  let addButton = UIButton()
  let viewModel = AddViewModel()
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      // Add the subviews
      view.addSubview(vinField)
      view.addSubview(bodyTypeField)
      view.addSubview(addButton)
    
    viewModel.response.skip(1).subscribe { response in
          let alert = UIAlertController(title: "Success", message: "Posted successefully", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true, completion: nil)
    }.disposed(by: disposeBag)
    viewModel.error.skip(1).subscribe { response in
      let alert = UIAlertController(title: "Failure", message: response.debugDescription, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }.disposed(by: disposeBag)
      
      // Configure the VIN field
      vinField.borderStyle = .roundedRect
      vinField.placeholder = "VIN"
      
      // Configure the body type field
      bodyTypeField.borderStyle = .roundedRect
      bodyTypeField.placeholder = "Vehicle Body Type Id"
      
      // Configure the Add button
      addButton.setTitle("Add", for: .normal)
      addButton.setTitleColor(.white, for: .normal)
      addButton.backgroundColor = .systemBlue
      addButton.layer.cornerRadius = 5
      addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
      
      // Set up the SnapKit constraints
      vinField.snp.makeConstraints { make in
          make.top.equalToSuperview().offset(200)
          make.leading.equalToSuperview().offset(20)
          make.trailing.equalToSuperview().offset(-20)
          make.height.equalTo(40)
      }
      
      bodyTypeField.snp.makeConstraints { make in
          make.top.equalTo(vinField.snp.bottom).offset(20)
          make.leading.trailing.height.equalTo(vinField)
      }
      
      addButton.snp.makeConstraints { make in
          make.top.equalTo(bodyTypeField.snp.bottom).offset(20)
          make.centerX.equalToSuperview()
          make.width.equalTo(100)
          make.height.equalTo(40)
      }
  }
  
  @objc func addButtonTapped() {
    viewModel.add(vin: vinField.text ?? "", vehicleBodyTypeId: bodyTypeField.text ?? "")
  }
}

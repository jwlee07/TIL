//
//  CallerViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit
import MobileCoreServices
import Contacts

class CallerViewController: UIViewController {

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupNavi()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        AppShared.phoneCallMenu["발신자"] = nameTextField.text ?? ""
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }
    
    // MARK: - Navi Setup
    private func setupNavi() {
        let getAddressItem = UIBarButtonItem(title: "연락처", style: .plain, target: self, action: #selector(getAddressEvent(_:)))
        let dismissItem = UIBarButtonItem(title: "확인", style: .plain, target: self, action: #selector(dismissEvent))
        self.navigationItem.rightBarButtonItems = [dismissItem]
    }
    
    @objc private func getAddressEvent(_ sender: UIBarButtonItem) {
        // 주소록에서 얻어온 데이터들을 저장할 배열
        var contacts = [CNContact]()
        
        // 주소록에서 가져올 데이터들의 타입, 이름, 폰번호
        let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey as CNKeyDescriptor]
        
        // 주소록에서 가져올 데이터들의 옵션을 저장하는 객체
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: {
            (granted , err) in
            //권한 허용 시
            if(granted){
                do {
                    try store.enumerateContacts(with: request) {
                    (contact, stop) in
                        // 이름은 있으나 폰 번호가 없는 경우
                        if !contact.phoneNumbers.isEmpty {
                            contacts.append(contact)
                        }
                    }
                    for info in contacts{
                        guard let phone = info.phoneNumbers[0].value.value(forKey: "digits") else {
                            return
                        }
                        let name = info.familyName + info.givenName
                        print(phone)
                        print(name)
                    }
                } catch {
                    print("unable to fetch contacts")
                }
            }
            // 권한 비 허용 시
            else {
                let toast = UIAlertController(title: "알림", message: "주소록 권한이 필요합니다.", preferredStyle: .alert)
                toast.addAction(UIAlertAction(title: "확인", style: .default, handler: {
                    (Action) -> Void in
                    let settingsURL = NSURL(string: UIApplication.openSettingsURLString)! as URL
                    UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                }))
                self.present(toast, animated: true, completion: nil)
            }
        })
    }
    
    @objc private func dismissEvent(_ sender: UIBarButtonItem) { navigationController?.popViewController(animated: true) }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        view.backgroundColor = .systemGray5
        
        view.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48),
            profileImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor)
        ])
        
        view.addSubview(registerButton)
        view.addSubview(removeButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 48),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            removeButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            removeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -48),
            removeButton.leadingAnchor.constraint(equalTo: registerButton.trailingAnchor, constant: 16),
            removeButton.widthAnchor.constraint(equalTo: registerButton.widthAnchor, multiplier: 1.0),
            removeButton.heightAnchor.constraint(equalTo: registerButton.heightAnchor)
        ])
        
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 24),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private let profileImageView: UIImageView = {
        var profileImage: UIImage = UIImage()
        
        if AppShared.phoneCallMenu["사진"] != nil {
            profileImage = UIImage(data: Data(base64Encoded: AppShared.phoneCallMenu["사진"]!)!)!
        } else {
            profileImage = UIImage(systemName: "person.circle.fill")!
        }
        
        let imageView = UIImageView(image: profileImage)
        imageView.tintColor = .lightGray
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("사진 등록", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clickedRegisterButton), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    @objc func clickedRegisterButton(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = [kUTTypeImage] as [String]
        present(imagePicker, animated: true)
    }
    
    lazy var removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("사진 삭제", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clickedRemoveButton), for: .touchUpInside)
        button.layer.cornerRadius = 15
        return button
    }()

    @objc func clickedRemoveButton(_ sender: UIButton) {
        AppShared.phoneCallMenu["사진"] = nil
        profileImageView.image = UIImage(systemName: "person.circle.fill")
    }
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "발신자의 이름을 입력하세요."
        textField.text = AppShared.phoneCallMenu["발신자"] ?? ""
        textField.font = .systemFont(ofSize: 20)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = .white
        return textField
    }()
    
    private lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        return imagePicker
    }()
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension CallerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            
            let selectedImage = editedImage ?? originalImage
            profileImageView.image = selectedImage
            
            let picToDataToString = selectedImage.pngData()!.base64EncodedString()
            AppShared.phoneCallMenu["사진"] = picToDataToString
        }
        
        picker.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

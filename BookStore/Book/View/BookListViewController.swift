//
//  BookListViewController.swift
//  BookStore
//
//  Created byAlDAIR cARRILO on 13/09/21.
//  Copyright © 2021 CGTI. All rights reserved.
//

import UIKit
import SDWebImage

var section: String = "Best Sellers"

class BookListViewController: UIViewController, bookViewModelProtocol, UITableViewDelegate, UITableViewDataSource {
   
    
    
    
    private var bookViewModel = BookViewModel()
    private var tableView = UITableView()
     private var books: [Book] = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = section
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
       
        
        bookViewModel.bind(view: self, delegate: self)
           
        self.bookViewModel.getBooks(targetVC: self, q: "")
    }
    
   
    

    func getResponse(response: Response) {
          //print(response)
        
        if let results = response.results {
            if results.books.count > 0 {
                self.books = results.books
                
                let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
                       let displayWidth: CGFloat = self.view.frame.width
                       let displayHeight: CGFloat = self.view.frame.height
                
                tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
                self.tableView.register(UINib(nibName: "book", bundle: nil), forCellReuseIdentifier: "cell")

                if section != "Best Sellers" {
                    self.books = self.books.filter{ $0.genre == section }
                }

                 title =  "\(section) (\(self.books.count))"
                
                
                self.view.addSubview(tableView)
                tableView.dataSource = self
                tableView.delegate = self
                
                print("here")
            }
        }
      }
      
      func getErrorResponse(error: NSString) {
             print("error: \(error)")
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellsTableViewCell  else {
                      fatalError("The dequeued cell is not an instance of RequisitoCell.")
                  }
        
        cell.viewBack.layer.masksToBounds = false
        cell.viewBack.layer.shadowColor = UIColor.black.cgColor
        cell.viewBack.layer.shadowOpacity = 0.5
        cell.viewBack.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.viewBack.layer.shadowRadius = 3
        
        if let image = books[indexPath.row].img {
            let urlImage = URL(string: image)
            cell.imgBook.sd_setImage(with: urlImage)
        }
        
        cell.titleBook.text = books[indexPath.row].title ?? ""
        cell.authorTitle.text = books[indexPath.row].author ?? ""
        
        
        
        
            cell.setNeedsLayout()
        cell.layoutIfNeeded()
           return cell
       }
}

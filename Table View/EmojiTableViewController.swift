//
//  EmojiTableViewController.swift
//  Table View
//
//  Created by Denis Bystruev on 09.10.2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis: [Emoji] = [
        Emoji(symbol: "🐢", name: "Черепаха", description: "Зеленая черепаха", usage: "Медленное движение"),
        Emoji(symbol: "🐶", name: "Собака", description: "Морда Собаки", usage: "Медленное движение"),
        Emoji(symbol: "🐰", name: "Кролик", description: "Серый с ушами", usage: "Медленное движение"),
        Emoji(symbol: "🐱", name: "Кот", description: "Желтая морда", usage: "Медленное движение"),
        Emoji(symbol: "🐭", name: "Мышь", description: "Серая мышь", usage: "Медленное движение"),
        Emoji(symbol: "🐹", name: "Хомяк", description: "Маленький хомяк", usage: "Медленное движение"),
        Emoji(symbol: "🦊", name: "Лиса", description: "Рыжая морда", usage: "Медленное движение"),
        Emoji(symbol: "🐻", name: "Медведь", description: "Морда медведя", usage: "Медленное движение"),
        
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return emojis.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmojiTableViewCell

        let emoji = emojis[indexPath.row]
        
        cell.update(with: emoji)

        return cell
    }
        
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    //Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }


    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function, segue.identifier ?? "nil")
        if segue.identifier == "EditEmoji"{
            let navigationController = segue.destination as! UINavigationController
            let viewController = navigationController.topViewController as!
            AddEditEmojiTableViewController
            let indexPath = tableView.indexPathForSelectedRow!
            viewController.emoji = emojis[indexPath.row]
            viewController.navigationItem.title = "Edit"
        }
       
    }

    @IBAction func unwind(segue: UIStoryboardSegue){
        print(#function, segue.identifier ?? "nil")
        if segue.identifier == "SaveSegue"{
           let viewController = segue.source as! AddEditEmojiTableViewController
            let emoji = viewController.emoji
            if let indexPath = tableView.indexPathForSelectedRow{
                emojis[indexPath.row] = emoji
                tableView.reloadRows(at: [indexPath], with: .none)}
                    else {
                let indexPath = IndexPath(row: emojis.count, section: 0)
                        emojis.append(emoji)
                tableView.insertRows(at: [indexPath], with: .automatic)
                    }
                }
            }
        }



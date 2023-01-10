//
//  ImageDetailViewController.swift
//  PixbaySearchImages
//
//  Created by Ravi Chokshi on 10/01/23.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTag: UILabel!
    
    var searchImageArray = [Hit]()
    var selectedImageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail View"
        
        collectionView.register(UINib(nibName: "ImageCVCell", bundle: nil), forCellWithReuseIdentifier: "ImageCVCell")


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
   }
    
    @IBAction func backButtonClick(_ sender: Any) {
        
        if selectedImageIndex > 0 {
            selectedImageIndex = selectedImageIndex - 1
        let newIndexPath = IndexPath(item: selectedImageIndex, section: 0)
            collectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
            collectionView.reloadData()
        } else {
            self.showAlert(message: "Oops, it is your first image, can not move back")
        }
    }
    @IBAction func forwardButtonClick(_ sender: Any) {
        let newIndex = selectedImageIndex + 1
        if newIndex < searchImageArray.count {
            selectedImageIndex = newIndex
            let newIndexPath = IndexPath(item: newIndex, section: 0)
            collectionView.scrollToItem(at: newIndexPath, at: .centeredHorizontally, animated: true)
            collectionView.reloadData()

        } else {
            self.showAlert(message: "Oops, it is your last image, can not move forward")
        }

        
    }
    @IBAction func closeButtonClick(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImageDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        // MARK: - UICollectionViewDataSource protocol
        
        // tell the collection view how many cells to make
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return searchImageArray.count
        }
        
        // make a cell for each cell index path
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCVCell", for: indexPath as IndexPath) as! ImageCVCell
            
            let searchItem = searchImageArray[selectedImageIndex]
            cell.imageViewDetail.showImageWithTheUseOfKingfisher(from: searchItem.largeImageURL)
            lblTag.text = searchItem.tags
            return cell
        }
        
        // MARK: - UICollectionViewDelegate protocol
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }


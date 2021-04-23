//
//  ViewController.swift
//  10year
//
//  Created by 簡吟真 on 2021/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    
//IBO
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateChoose: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var autoSwitch: UISwitch!

    var sliderNumber = 0
    var imageNumber = 0
    let dateformatter = DateFormatter()
    
    
    let image = [ 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003,
                  2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016,
                  1984 ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        dateformatter.dateFormat = "yyyy/MM/dd"
    }
    //利用 switch 與 image array 取元件的對應 抓取日期與文字的呈現
    //以下三個 func 均與 autoSwitch 的作用有關。尤其與 timer()搭配的應用
    var dateString : String = ""
    func choosePicture (num1 : Int){
        switch num1 {
        case 0:
            dateString = "1991/08/01"
        case 1:
            dateString = "1992/11/01"
        case 2:
            dateString = "1993/06/01"
        case 3:
            dateString = "1994/08/01"
        case 4:
            dateString = "1995/10/01"
        case 5:
            dateString = "1996/06/01"
        case 6:
            dateString = "1997/10/01"
        case 7:
            dateString = "1998/08/01"
        case 8:
            dateString = "1999/09/01"
        case 9:
            dateString = "2000/07/01"
        case 10:
            dateString = "2001/05/01"
        case 11:
            dateString = "2002/08/01"
        case 12:
            dateString = "2003/04/01"
        case 13:
            dateString = "2004/06/01"
        case 14:
            dateString = "2005/11/01"
        case 15:
            dateString = "2006/08/01"
        case 16:
            dateString = "2007/09/01"
        case 17:
            dateString = "2008/09/01"
        case 18:
            dateString = "2009/08/01"
        case 19:
            dateString = "2010/05/01"
        case 20:
            dateString = "2011/05/01"
        case 21:
            dateString = "2012/08/01"
        case 22:
            dateString = "2013/08/01"
        case 23:
            dateString = "2014/06/01"
        case 24:
            dateString = "2015/04/01"
        case 25:
            dateString = "2016/05/01"
        default:
            dateString = "1984/01/01"
        }
        let date = dateformatter.date(from: dateString)
        dateChoose.date = date!

        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: dateChoose.date)
        let year = dateComponents.year!
        label.text = "\(year)"
   }
    
    //啟動時間timer的寫法
    var timer : Timer?
    func time () {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
            self.compare()
        })
    }
    //利用 if else 比較陣列圖片，用在 @IBAction func autoTimer 上
    func compare () {
        if imageNumber >= image.count {
            imageNumber = 0
            choosePicture(num1: imageNumber)
            imageView.image = UIImage(named: String(image[imageNumber]))
        } else {
            choosePicture(num1: imageNumber)
            imageView.image = UIImage(named: String(image[imageNumber]))
        }
        slider.value = Float(imageNumber)
        imageNumber += 1
    }
 
    @IBAction func yearChangeDatePicker(_ sender: UIDatePicker) {
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: dateChoose.date)
        let year = dateComponents.year!
        let pictureDate = "\(year)"
        imageView.image = UIImage(named: pictureDate)
        slider.value = Float(year - 1991)
        label.text = "\(year)"
    }
 
    
    @IBAction func yearChangeSlider(_ sender: UISlider) {
        sender.value = round(sender.value)
        let newDate = DateComponents(calendar: Calendar.current, year: image[sliderNumber]).date
        dateChoose.date = newDate!
        sender.value.round()
        sliderNumber = Int(slider.value)
        label.text = String(image[sliderNumber])
//        timeLapseImageView.image = UIImage(named: "\(Int(dateSlider.value))")
        imageView.image = UIImage(named: String(image[sliderNumber]))
    }
    
    
    @IBAction func autuTimer(_ sender: UISwitch) {
        if sender.isOn {
            time()
            imageNumber = sliderNumber
            slider.value = Float(imageNumber)
        } else {
            timer?.invalidate()
        }
    }
    
}

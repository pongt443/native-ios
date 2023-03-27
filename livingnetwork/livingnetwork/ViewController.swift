import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let msisdn = ["66659332061","66659332051","66937060046","66937060048","QA1","QA2","QA3","QA4","QA5","QA6","QA7","QA8","QA9","QA10"]
    var mapToken = [String: String]()
    var token = "unknown"
    
    @IBOutlet var picker: UIPickerView!
    override func viewDidLoad() {
        mapToken["66659332061"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU0OjMyKzA3OjAwIn0.R4eHmEG4oP4pZnKl5bCZPdjDBkhkUzrCBdh1rVZKlJE"
        mapToken["66659332051"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU2OjIxKzA3OjAwIn0.f33Ing502a8_R9li5E7XJjLU4yOW4h-oKC0Girw-1Ug"
        mapToken["66937060046"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU3OjA0KzA3OjAwIn0.SJcZsrExTIqNwyzm6cn7CdpM1Vn_KMZdjnGbmZD_cQ0"
        mapToken["66937060048"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU3OjU1KzA3OjAwIn0.DO025Bzd27ZwVo72N5nyCDnq95qYs5wqa8XDbQNF3dQ"
        mapToken["QA1"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMSIsImlhdCI6MTUxNjIzOTAyMn0.dbYFJPSwNzNj-vPlexSW08gb6yP9q-6LSuFBz746TZE"
        mapToken["QA2"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMiIsImlhdCI6MTUxNjIzOTAyMn0.wZ8DmfL8ikHSpiJanN9IhzEEDTQ7Q2alkKiyNMgu64k"
        mapToken["QA3"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMyIsImlhdCI6MTUxNjIzOTAyMn0.MCIzx1QlGbLlYVW5GTn6FrL0gt9gWBhcckC_l1jgweE"
        mapToken["QA4"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNCIsImlhdCI6MTUxNjIzOTAyMn0.AYUcoGLYUPIo6iv1UOIIgLiyNtrKsDlGh_JBnCV8mw8"
        mapToken["QA5"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNSIsImlhdCI6MTUxNjIzOTAyMn0.hxYBrb-d4fLYtayhJNxgqvxOwScPW7WYSnL3chYVjsQ"
        mapToken["QA6"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNiIsImlhdCI6MTUxNjIzOTAyMn0.QxAHUpbogFL0wlvwHN9gQqMz14mPM_bvLRkc1aYkp5I"
        mapToken["QA7"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNyIsImlhdCI6MTUxNjIzOTAyMn0.UIyY1De8h0SqU2f06B5DM_5b76hKjTgIm8RkDI2lzJw"
        mapToken["QA8"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBOCIsImlhdCI6MTUxNjIzOTAyMn0.IGbDPPURT7Xj-4_FaZsSg7v-f1oYzOkEupLakB2Iy3s"
        mapToken["QA9"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBOSIsImlhdCI6MTUxNjIzOTAyMn0.nYWcZryvvEULkr4etvJStFLA861ZRSx4xIBRBJkA-ac"
        mapToken["QA10"] = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTAiLCJpYXQiOjE1MTYyMzkwMjJ9.cx7YTc-SzDV5-UcQyTOnVVGZBXpmhkbr_H56rr00XNM"
        picker.dataSource = self
        picker.delegate = self
        super.viewDidLoad()
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
        initial()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return msisdn.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        token = mapToken[msisdn[row]] ?? "unknown"
        return  msisdn[row]
    }
    
    lazy var flutterEngine = FlutterEngine(name: "flutter_engine")
    @objc func invokeFlutter(){
         let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
         let channel = FlutterMethodChannel(name: "LIVING_NETWORK", binaryMessenger:flutterViewController.binaryMessenger)
        channel.setMethodCallHandler({
                    (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
                      if(call.method == "open"){
                          print(call.arguments)
                      }

                  })
         channel.invokeMethod("open", arguments: token )
     }
    
     @objc func showFlutter(){
         invokeFlutter()
         let flutterViewController =
         FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
         flutterViewController.modalPresentationStyle = .fullScreen
         present(flutterViewController, animated: true, completion: nil)
     }
     func initial(){
     }

    @IBAction func OpenLN(_ sender: UIButton) {
        showFlutter()
    }
}

import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let msisdn = ["iot-66937060046","iot-66937060048","iot-66937060040","iot-66937060042","iot-66937060045","66659332061","66659332051","66937060046","66937060048","QA1", "QA2", "QA3", "QA4", "QA5", "QA6", "QA7", "QA8", "QA9", "QA10","QA11", "QA12", "QA13", "QA14", "QA15", "QA16", "QA17", "QA18", "QA19","QA20","QA21", "QA22", "QA23", "QA24", "QA25", "QA26", "QA27", "QA28", "QA29", "QA30"]
    var mapToken = [String: String]()
    var token = "unknown"
    
    @IBOutlet var picker: UIPickerView!
    override func viewDidLoad() {
        mapToken["iot-66937060046"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwNDYiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTA0LTAzVDE0OjA1OjMxKzA3OjAwIn0.fOMQYnePrzlcfaRTk_cvIoBsvzFYvTB9xNVqRCDbN8c";
        mapToken["iot-66937060048"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwNDgiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTA0LTAzVDE0OjEwOjQwKzA3OjAwIn0.EY9mME-z5cf6HgPvQCyz-P1OUzYpQykzuK0S5qGeeaM";
        mapToken["iot-66937060040"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwNDAiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTA0LTAzVDE0OjExOjM2KzA3OjAwIn0.tfMi45EuGlPlfViNSZpOLoRYxNAX6qly20bQKSjE7EY";
        mapToken["iot-66937060042"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwNDIiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTA0LTAzVDE0OjEyOjE1KzA3OjAwIn0.hzC9KSBVu0mU5MS5GRrj-mgW-UuqnjCc2JNXAVIoPh8";
        mapToken["iot-66937060045"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwNDUiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTA0LTAzVDE0OjEyOjUwKzA3OjAwIn0.2GV6aNZ0UtJAx0911hB52slYUaYseYKcv1isEhr_Bdw";
        mapToken["66659332061"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU0OjMyKzA3OjAwIn0.R4eHmEG4oP4pZnKl5bCZPdjDBkhkUzrCBdh1rVZKlJE"
        mapToken["66659332051"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU2OjIxKzA3OjAwIn0.f33Ing502a8_R9li5E7XJjLU4yOW4h-oKC0Girw-1Ug"
        mapToken["66937060046"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU3OjA0KzA3OjAwIn0.SJcZsrExTIqNwyzm6cn7CdpM1Vn_KMZdjnGbmZD_cQ0"
        mapToken["66937060048"] = "eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA2NTkzMzIwNjEiLCJuZXR3b3JrVHlwZSI6Ik1BU1MiLCJ0aW1lc3RhbXAiOiIyMDIzLTAzLTIzVDE0OjU3OjU1KzA3OjAwIn0.DO025Bzd27ZwVo72N5nyCDnq95qYs5wqa8XDbQNF3dQ"
        mapToken["QA1"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMSIsImlhdCI6MTUxNjIzOTAyMn0.dbYFJPSwNzNj-vPlexSW08gb6yP9q-6LSuFBz746TZE"
        mapToken["QA2"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMiIsImlhdCI6MTUxNjIzOTAyMn0.wZ8DmfL8ikHSpiJanN9IhzEEDTQ7Q2alkKiyNMgu64k"
        mapToken["QA3"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMyIsImlhdCI6MTUxNjIzOTAyMn0.MCIzx1QlGbLlYVW5GTn6FrL0gt9gWBhcckC_l1jgweE"
        mapToken["QA4"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNCIsImlhdCI6MTUxNjIzOTAyMn0.AYUcoGLYUPIo6iv1UOIIgLiyNtrKsDlGh_JBnCV8mw8"
        mapToken["QA5"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNSIsImlhdCI6MTUxNjIzOTAyMn0.hxYBrb-d4fLYtayhJNxgqvxOwScPW7WYSnL3chYVjsQ"
        mapToken["QA6"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNiIsImlhdCI6MTUxNjIzOTAyMn0.QxAHUpbogFL0wlvwHN9gQqMz14mPM_bvLRkc1aYkp5I"
        mapToken["QA7"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBNyIsImlhdCI6MTUxNjIzOTAyMn0.UIyY1De8h0SqU2f06B5DM_5b76hKjTgIm8RkDI2lzJw"
        mapToken["QA8"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBOCIsImlhdCI6MTUxNjIzOTAyMn0.IGbDPPURT7Xj-4_FaZsSg7v-f1oYzOkEupLakB2Iy3s"
        mapToken["QA9"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBOSIsImlhdCI6MTUxNjIzOTAyMn0.nYWcZryvvEULkr4etvJStFLA861ZRSx4xIBRBJkA-ac"
        mapToken["QA10"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTAiLCJpYXQiOjE1MTYyMzkwMjJ9.cx7YTc-SzDV5-UcQyTOnVVGZBXpmhkbr_H56rr00XNM"
        mapToken["QA11"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTEiLCJpYXQiOjE1MTYyMzkwMjJ9.jODcPq62NyJaIiLpHVsY2wBuPb8F5AF3vP564vXq30Y"
        mapToken["QA12"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTIiLCJpYXQiOjE1MTYyMzkwMjJ9.2PA3AhJKqidmGGQMMfpyFbZZ2BBCkmJawUyjWwq5h2I"
        mapToken["QA13"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTMiLCJpYXQiOjE1MTYyMzkwMjJ9.g4DuYQVhOGJXaZMsEDj_hKr94QqZL-cvNNVYcHkIeqw"
        mapToken["QA14"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTQiLCJpYXQiOjE1MTYyMzkwMjJ9.DNOzqkw1ot9Q8n99l3sBrSncoWg_FZMd5aIsKh9gHqM"
        mapToken["QA15"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTUiLCJpYXQiOjE1MTYyMzkwMjJ9.nqOlAiXrQHMBgjaa3EOvxB0Dzbb9vqKArmiBKEi-d5U"
        mapToken["QA16"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTYiLCJpYXQiOjE1MTYyMzkwMjJ9.EvdbdKx9GUspVF1hiZBPRartt4HygFXRgY5gukzzwVw"
        mapToken["QA17"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTciLCJpYXQiOjE1MTYyMzkwMjJ9.6tvRwcdIU_qYtHvB1PLbAnDTpbGNC6gZi7DMG-ZGATc"
        mapToken["QA18"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTgiLCJpYXQiOjE1MTYyMzkwMjJ9.7QrzIIWs5lfSABdbUsykQtnb-KCwkPrw81mu0enZ1gI"
        mapToken["QA19"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMTkiLCJpYXQiOjE1MTYyMzkwMjJ9.H8NADvjBPOpvbQJUMw60eJGIbsUd3Sxv97S38CDzlx0"
        mapToken["QA20"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjAiLCJpYXQiOjE1MTYyMzkwMjJ9.4XDcALzD80R7u8p_srYNsZywERsDelXHLwXQzZC5YGw"
        mapToken["QA21"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjEiLCJpYXQiOjE1MTYyMzkwMjJ9.AmuUaVHWQdkSfPoKl-gTvI_2hD8vxQG_GjdYW1hDQfw"
        mapToken["QA22"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjIiLCJpYXQiOjE1MTYyMzkwMjJ9.XWB-2ugVN9bvWPwj2UeolVCUHLWKYl_3DySD9bGEoGI"
        mapToken["QA23"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjMiLCJpYXQiOjE1MTYyMzkwMjJ9.Q-JRv5lU0iwPI31q8sPhZO8hq077x0dTZqu4UqMnjMQ"
        mapToken["QA24"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjQiLCJpYXQiOjE1MTYyMzkwMjJ9.5KrkM3ELTQ5B3rPGzJWzhXur0TmFUhVDg9yGzsxDc7E"
        mapToken["QA25"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjUiLCJpYXQiOjE1MTYyMzkwMjJ9.57k4YF5C3cSHNc4qk9Bek7kDfWzzWtd1kuJATdCRAMg"
        mapToken["QA26"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjYiLCJpYXQiOjE1MTYyMzkwMjJ9.6ek-yMJBDLg4_5k5c-slCtPidlFrcksL86NqeERdiGU"
        mapToken["QA27"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjciLCJpYXQiOjE1MTYyMzkwMjJ9.HcDcf8f-Xn2BX11gAEjY7RX3BLhZv-dhAP5YrLZsDFw"
        mapToken["QA28"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjgiLCJpYXQiOjE1MTYyMzkwMjJ9.4bBuM9NNM9ql8vWywcoqRyH873fKa27IwMupgNaAin0"
        mapToken["QA29"] = "5GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMjkiLCJpYXQiOjE1MTYyMzkwMjJ9.BXttYNDdmRvHqNd571z0JytWQjJCU1yz_bHFsqyfbwU"
        mapToken["QA30"] = "4GeyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IlFBMzAiLCJpYXQiOjE1MTYyMzkwMjJ9.kZe3awakeMs-qtP4Kanaw_Aim6XqP1Kj6gRbJzwmmZ4"
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

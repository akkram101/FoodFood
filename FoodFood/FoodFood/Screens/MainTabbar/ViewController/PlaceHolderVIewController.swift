//
//  PlaceHolderViewController.swift
//  FoodFood
//
//  Created by Akkram Bederi on 9/11/23.
//

import UIKit
import SnapKit

class PlaceHolderViewController: BaseViewController {
    
    let emoticonArray = [
        "( •_•)",
        "༼ ༎ຶ ᆺ ༎ຶ༽",
        "⁀⊙෴☉⁀",
        "๑(◕‿◕)๑",
        "٩(＾◡＾)۶",
        "8===D - -",
        "ʕ̡̢̡ʘ̅͟͜͡ʘ̲̅ʔ̢̡̢",
        "( ͡° ͜ʖ ͡° )",
        "(ᗒᗣᗕ)՞",
        "(๏ᆺ๏υ)",
        "꒰(･‿･)꒱",
        "Ⴚტ⊙▂⊙ტჂ",
        "⸂⸂⸜(രᴗര๑)⸝⸃⸃",
        "(╯•ᗣ•╰)",
        "彡໒(⊙ᴗ⊙)७彡",
        "／(=✪㉨✪=)＼",
        "(づ ՞ਊ ՞ )づ",
        "｡ﾟ( ﾟஇ▽இﾟ)ﾟ｡",
        "ƪ(=ｘωｘ=ƪ)",
        "(✦ ‿ ✦)",
        "(｡･･｡)",
        "╰(● ⋏ ●)╯",
        "⌗(́◉◞౪◟◉‵⌗)",
    
        "٭(•﹏•)٭",
        "(⋋°̧̧̧ω°̧̧̧⋌)",
        "(٭°̧̧̧ω°̧̧̧٭)",
        "( ˘▽˘)っ♨",
        "٩꒰ʘʚʘ๑꒱۶",
        "凸(⊙▂⊙✖ )",
        "ᕙ(⇀‸↼‶)ᕗ",
        "(✌ﾟ∀ﾟ)☞",
        "(シ_ _)シ",
        "( ๑‾̀◡‾́)σ\"",
        "(－‸ ლ)",
        "(●⌇ຶ ཅ⌇ຶ●)",
        "໒(⊙ᴗ⊙)७✎▤",
        "(o・┏ω┓・o)",
        "( ͒꒪̛ཅ꒪̛ ͒)",
        "(✪㉨✪)",
        "／(=✪ x ✪=)＼",
        "੯ੁૂ‧̀͡u\\",
        "(≚ᄌ≚) ƶ Ƶ",
        "(ٛ⁎꒪̕ॢ ˙̫ ꒪ٛ̕ॢ⁎)",
        "(✦థ ｪ థ)"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateEmoticon()
    }
    
    private func updateEmoticon() {
        emoticonLabel.text = emoticonArray.randomElement()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(emoticonLabel)
        emoticonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private lazy var emoticonLabel: UILabel = {
       let label = UILabel()
        label.font = .scaleBold(size: 50)
        label.textColor = .systemGray
        
        return label
    }()
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

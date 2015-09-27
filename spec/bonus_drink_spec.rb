require File.expand_path(File.dirname(__FILE__) + '/../bonus_drink')

describe BonusDrink do

  specify { expect(BonusDrink.total_count_for(0)).to eq 0 }
  specify { expect(BonusDrink.total_count_for(1)).to eq 1 }
  specify { expect(BonusDrink.total_count_for(3)).to eq 4 }
  specify { expect(BonusDrink.total_count_for(11)).to eq 16 }
  
  specify "本数確認" do
  
    total_amount = 0
    bonus_count = 0

    #100回ループ
    100.times do |i|
      
      bonus_count += 1
      total_amount += 1
      
      #３本で1本交換
      if bonus_count >= 3
        bonus_count -= 3    #3本と引き換えに
        bonus_count += 1    #1本もらう
        total_amount += 1   #合計本数に追加
      end
      
      puts i + 1
      
      expect(BonusDrink.total_count_for(i + 1)).to eq total_amount
      
    end
  end
  
  #数値以外
  specify { expect(BonusDrink.total_count_for("abc")).to eq -1 }
  specify { expect(BonusDrink.total_count_for(1.25)).to eq -1 }
  specify { expect(BonusDrink.total_count_for(-10)).to eq -1 }

end

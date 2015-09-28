class BonusDrink

  BONUS_DRINK_GET_COUNT = 3
  @error = ""
  
  attr_accessor :error
  
  def self.total_count_for(amount)
    
    #整数値チェック
    if !amount.is_a?(Integer)
      puts "error:#{amount} is not integer"
      return -1
    end
    
    #マイナスチェック
    if amount < 0
      puts "error:#{amount} is not positive number"
      return -1
    end
    
    #おまけがもらえる本数以下ならそのまま返す
    if amount < BONUS_DRINK_GET_COUNT
      return amount
    end

    # 3本で1本もらえるので、2本目以降のプレゼントは2本買えば1本もらえる
    # したがって3本以上のときに最初にもらえるプレゼント(1本目)は別として、2本目以降は(3 - 1)本で1本もらえることになる
    # (最初に購入した数 - 3) から (3-1)本を割った数が2本目以降にもらえる本数、それに1本目(最初にもらったボーナス分)を足す。
    bonus = (amount - BONUS_DRINK_GET_COUNT) / (BONUS_DRINK_GET_COUNT - 1) + 1
    
    #もらえる本数を返す
    return amount + bonus
    
  end
  
end

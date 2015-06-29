class TowerOfHanoi

  def initialize (d)

    @disks = d
   
    @board = [(1..d).to_a,[],[]]
    2.times do |i|
      d.times do |j|
        @board[i+1] << 0
      end
    end 

    # print @board.inspect

  end

  def play

    p "Let's play Tower of Hanoi"
    p "To quit type 'q'"

    while true



    end



  end


  def move



  end



  def board
    #@board[1,2,3,4],[],[]




  end

  def victory

    

  end



end





p "How many disks you want to play with"
game = TowerOfHanoi.new(gets.chomp.to_i)

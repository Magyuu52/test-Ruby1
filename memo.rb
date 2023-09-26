 require "csv" 
  
 puts "1 (新規でメモを作成する) 2 (既存のメモを編集する)"
  
 memo_type = gets.to_i 
 selected_number = memo_type
 
 def generate_memo()
   puts "拡張子を除いたタイトルを入力してください"
   @memo_title = gets.chomp
   puts "メモしたい内容を記入してください"
   puts "完了したら、Ctrl + Dを押します"
   @memo_sentence = STDIN.read
   @content = @memo_sentence.chomp
   
   CSV.open("#{@memo_title}.csv","a") do |csv|
   csv << ["#{@content}"]
   end
 end
  
  def edit_memo()
   puts "編集したいメモの拡張子を除いたタイトルを入力してください"
   @selected_title = gets.chomp
    puts "メモしたい内容を記入してください"
    puts "完了したら、Ctrl + Dを押します"
    @memo_new_sentence = STDIN.read
    @new_content = @memo_new_sentence.chomp
    CSV.open("#{@selected_title}.csv","w") do |csv|
    csv << ["#{@new_content}"]
   end
  end
 
 if selected_number == 1 
  generate_memo()
 elsif selected_number == 2
  edit_memo()
 else
  puts "1または2のいずれかを入力してください"
 end
 
 
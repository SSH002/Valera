class Interface
  def initialize; end

  def action_list
    puts '(1) - Пойти на работу'
    puts '(2) - Отдыхать'
    puts '(3) - Выпить с маргиналами'
    puts '(4) - Спеть'
    puts '(5) - Посмотреть сериал'
    puts '(6) - Спать'
    puts '(7) - Загрузитть игру'
    puts '(8) - Сохранить игру'
    puts '(9) - Выйти в главное меню'
    puts 'Ввод >> '
  end

  def file_list(directory, file_name_end)
    files = Dir["#{directory}/*.#{file_name_end}"]

    puts 'Список ранее сохранённых игр:'
    puts '+---------------------------------------------------+'
    files.each do |file_name|
      file_name["#{directory}/"] = ''
      file_name[".#{file_name_end}"] = ''
      print '| ', file_name, "\n"
    end
    puts '+---------------------------------------------------+'
    print "\nВведите название файла:\nВвод >> "
  end

  def menu_load(test, inp)
    system 'clear'
    file_list('saves', 'sv')

    input = readline.chop if test == false
    input = inp if test == true
    file_name = "saves/#{input}.sv"

    loop do
      break if File.file?(file_name)

      print "\nОшибка! Файл #{input} не существует.\n"
      file_list('saves', 'sv')
      print "\nВведите название файла:\nВвод >> "

      input = readline
      file_name = "saves/#{input}.sv"
    end

    file_name
  end

  def menu_save(test, inp)
    system 'clear'
    file_list('saves', 'sv')

    input = readline.chop if test == false
    input = inp if test == true
    file_name = "saves/#{input}.sv"

    if File.file?(file_name)
      print "\nФайл с таким названием уже существует. Перезаписать? (Y)\nВвод >> "
      inp = readline

      file_name if inp[0] == 'y' || inp[0] == 'Y'
    else
      file_name
    end
  end
end

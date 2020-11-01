class Interface
  def initialize; end

  def action_list
    print "(1) - Пойти на работу\n"
    print "(2) - Отдыхать\n"
    print "(3) - Выпить с маргиналами\n"
    print "(4) - Спеть\n"
    print "(5) - Посмотреть сериал\n"
    print "(6) - Спать\n"
    print "(7) - Загрузитть игру\n"
    print "(8) - Сохранить игру\n"
    print "(9) - Выйти в главное меню\n"
    print 'Ввод >> '
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

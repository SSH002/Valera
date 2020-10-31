class Interface
  def initialize; end

  def action_list
    print "(1) - Пойти на работу\n(2) - Отдыхать\n"
    print "(3) - Выпить с маргиналами\n(4) - Спеть\n"
    print "(5) - Посмотреть сериал\n(6) - Спать\n"
    print "(7) - Сыграть в \"21\"\n(8) - Загрузитть игру\n"
    print "(9) - Сохранить игру\n(0) - Выйти в главное меню\n"
    print 'Ввод >> '
  end

  def file_list(directory, file_name_end)
    files = Dir["#{directory}/*.#{file_name_end}"]

    print "Список ранее сохранённых игр:\n"
    print "+---------------------------------------------------+\n"
    files.each do |file_name|
      file_name["#{directory}/"] = ''
      file_name[".#{file_name_end}"] = ''
      print '| ', file_name, "\n"
    end
    print "+---------------------------------------------------+\n"
    print "\nВведите название файла:\nВвод >> "
  end

  def menu_load
    system 'clear'
    file_list('saves', 'sv')
    input = readline
    file_name = "saves/#{input.chop}.sv"

    loop do
      break if File.file?(file_name)

      system 'clear'
      print "Ошибка! Файл #{input.chop} не существует.\n"
      file_list('saves', 'sv')
      print "\nВведите название файла:\nВвод >> "
      input = readline
      file_name = "saves/#{input.chop}.sv"
    end

    file_name
  end

  def menu_save
    system 'clear'
    file_list('saves', 'sv')
    input = readline

    file_name = "saves/#{input.chop}.sv"
    if File.file?(file_name)
      print "\nФайл с таким названием уже существует. Перезаписать? (Y)\nВвод >> "
      inp = readline

      file_name if inp[0] == 'y' || inp[0] == 'Y'
    else
      file_name
    end
  end
end

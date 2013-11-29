puts 'load bible verses'
BibleVerse.delete_all
BibleVerse::load_from_file

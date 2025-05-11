#!/bin/bash

# 1. Поиск файла по имени
find_file() {
    echo -n "Введите имя файла: "
    read filename
    find / -name "$filename" 2>/dev/null
}

# 2. Поиск текста в файлах
grep_text() {
    echo -n "Введите текст для поиска: "
    read pattern
    grep -rIn --color=auto --exclude-dir={.git,.svn,node_modules} "$pattern" .
}

# 3. Показать 10 самых больших файлов
top10_files() {
    du -ah . | sort -rh | head -10
}

# 4. Мониторинг процессов
process_monitor() {
    top
}

# 5. Проверка использования диска
disk_usage() {
    df -h
}

# 6. Убить процесс по имени
kill_process() {
    echo -n "Введите имя процесса: "
    read process
    pkill -9 "$process"
}

# 7. Архивировать папку
archive_folder() {
    echo -n "Введите путь к папке: "
    read folder
    tar -czvf "${folder}.tar.gz" "$folder"
}

# 8. Проверить свободную память
free_memory() {
    free -h
}

# 9. Показать открытые порты
open_ports() {
    ss -tulnp
}

# 10. Заменить текст в файлах
replace_text() {
    echo -n "Введите старый текст: "
    read old
    echo -n "Введите новый текст: "
    read new
    find . -type f -exec sed -i "s/$old/$new/g" {} +
}

# 11. Проверить ping до сайта
check_ping() {
    echo -n "Введите домен или IP: "
    read host
    ping -c 4 "$host"
}

# 12. Показать IP-адреса
show_ips() {
    hostname -I
    ip addr | grep 'inet '
}

# 13. Проверить SSL-сертификат
check_ssl() {
    echo -n "Введите домен: "
    read domain
    openssl s_client -connect "$domain":443 -servername "$domain" | openssl x509 -noout -dates
}

# 14. Конвертировать видео в MP4
convert_to_mp4() {
    echo -n "Введите входной файл: "
    read input
    echo -n "Введите выходной файл (без .mp4): "
    read output
    ffmpeg -i "$input" "${output}.mp4"
}

# 15. Генератор случайного пароля
generate_password() {
    openssl rand -base64 16
}

# Меню
while true; do
    clear
    echo "------------------------------------"
    echo "  Меню полезных команд (15 функций) "
    echo "------------------------------------"
    echo "1.  Найти файл по имени"
    echo "2.  Найти текст в файлах"
    echo "3.  Топ-10 самых больших файлов"
    echo "4.  Мониторинг процессов (top)"
    echo "5.  Проверить использование диска"
    echo "6.  Убить процесс по имени"
    echo "7.  Архивировать папку"
    echo "8.  Проверить свободную память"
    echo "9.  Показать открытые порты"
    echo "10. Заменить текст в файлах"
    echo "11. Проверить ping"
    echo "12. Показать IP-адреса"
    echo "13. Проверить SSL-сертификат"
    echo "14. Конвертировать видео в MP4"
    echo "15. Сгенерировать пароль"
    echo "0.  Выход"
    echo "------------------------------------"
    echo -n "Выберите вариант: "
    read choice

    case $choice in
        1) find_file ;;
        2) grep_text ;;
        3) top10_files ;;
        4) process_monitor ;;
        5) disk_usage ;;
        6) kill_process ;;
        7) archive_folder ;;
        8) free_memory ;;
        9) open_ports ;;
        10) replace_text ;;
        11) check_ping ;;
        12) show_ips ;;
        13) check_ssl ;;
        14) convert_to_mp4 ;;
        15) generate_password ;;
        0) exit 0 ;;
        *) echo "Неверный выбор!" ;;
    esac

    echo
    echo -n "Нажмите Enter чтобы продолжить..."
    read
done

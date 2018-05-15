function dj --description 'shortcuts for django-like server'
    for option in $argv
        switch "$option"
            case -r --run run
                python -Wi manage.py runserver
            case -m --migrate migrate
                python -Wi manage.py migrate
            case '*'
                echo retry
        end
    end
end

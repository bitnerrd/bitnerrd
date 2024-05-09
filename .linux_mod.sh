function it() {
    local project=$1
    local option=$2
    local tractapi="tractapi"
    local gymapi="gymapi"
    local sudduthapi="sudduthapi"
    local sudduthapp="sudduthapp"
    local tract_v2_api="tract_v2_api"
    local gym_dev="gym-dev"
    local sudduth_api="sudduth-api"
    local sudduth_webapp="sudduth-webapp"

    # Check for valid project alias
    case "$project" in
        $tractapi)
            echo "Transitioning to the working directory for $tract_v2_api..."
            cd ~/Cipher/tract_v2_api
            if [[ "$option" == "nav" ]]; then
                return 0
            elif [[ -z "$option" ]]; then
                echo "Initiating Visual Studio Code for the $tract_v2_api..."
                code .
            else
                echo "Invalid option '$option'. did you mean 'nav' ?"
                return 1
            fi
            ;;
        $gymapi)
            echo "Transitioning to the working directory for $gym_dev..."
            cd ~/Cipher/gym_dev
            if [[ "$option" == "nav" ]]; then
                nvm use 18.18.2
            elif [[ -z "$option" ]]; then
                echo "Initiating Visual Studio Code for the $gym_dev..."
                nvm use 18.18.2
                code .
            else
                echo "Invalid option '$option'. did you mean 'nav' ?"
                return 1
            fi
            ;;
        $sudduthapi)
            echo "Transitioning to the working directory for $sudduth_api..."
            cd ~/Cipher/sudduth-api
            if [[ "$option" == "nav" ]]; then
                nvm use 18.18.2
            elif [[ -z "$option" ]]; then
                echo "Initiating Visual Studio Code for the $sudduth_api..."
                code .
                nvm use 18.18.2
            else
                echo "Invalid option '$option'. did you mean 'nav' ?"
                return 1
            fi
            ;;
        $sudduthapp)
            echo "Transitioning to the working directory for $sudduth_webapp..."
            cd ~/Cipher/sudduth-webapp
            if [[ "$option" == "nav" ]]; then
                return 0
            elif [[ -z "$option" ]]; then
                echo "Initiating Visual Studio Code for the $sudduth_webapp..."
                code .
            else
                echo "Invalid option '$option'. did you mean 'nav' ?"
                return 1
            fi
            ;;
        *)
            echo "Invalid project alias. did you mean?  $tractapi, $gymapi, $sudduthapi, $sudduthapp."
            return 1
            ;;
    esac
}



# for killing running port
dport() {
    PORT=$1
    PID=$(sudo lsof -t -i:$PORT)
    if [ -n "$PID" ]; then
        sudo kill $PID
        echo "Process with PID $PID, running on port $PORT, has been terminated."
    else
        echo "No process found running on port $PORT."
    fi
}


function up() {
    cd ~
    service=$1
    if [ "$service" = "psql" ]; then
        cd TechStack/dev_compose
        docker compose -f docker.compose.postgres.yml up -d
    else
        echo "Invalid Compose File Command"
    fi
}


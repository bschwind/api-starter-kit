#!/bin/sh

SCRIPT_DIR=`dirname $0`

case $1 in
    --help|help)
        echo "Usage: ./helper.sh [start|log|restart|ssh|stop|data|recreate-db|db|redis|migrate|destroy] \n\n \
start       - Starts the services in the background \n \
log         - Outputs recent logs from all containers. Stop with Ctrl-C \n \
restart     - Restart the services in the background \n \
ssh         - Provides an interactive bash shell in the API container \n \
stop        - Halts execution of the service containers \n \
data        - Attempts to load a mysql dump file in the sql/ directory into the DB \n \
recreate-db - Clears the DB and runs create.sql to start from a fresh state \n \
db          - Opens an interactive mysql shell \n \
redis       - Opens an interactive redis shell \n \
migrate     - Runs all DB migrations \n \
destroy     - Stops the services, removes the containers \n"
        ;;
    start)
        # Starts the docker machine, prints the IP address, and starts the services in the background
        (cd $SCRIPT_DIR/docker && docker-compose up -d)
        ;;
    log)
        # Outputs recent logs from all containers. Stop with Ctrl-C
        (cd $SCRIPT_DIR/docker && docker-compose logs -f)
        ;;
    restart)
        # Restart the services in the background
        (cd $SCRIPT_DIR/docker && docker-compose restart)
        ;;
    ssh)
        # Provides an interactive bash shell in the API container
        (cd $SCRIPT_DIR/docker && docker-compose exec api /bin/bash)
        ;;
    stop)
        # Halts execution of the service containers
        (cd $SCRIPT_DIR/docker && docker-compose stop)
        ;;
    data)
        # Attempts to load a mysql dump file in the sql/ directory into the DB
        # The path uses `/sqlscripts/...` because that is the name of the directory in the MySQL container
        # See docker/docker-compose.yml for the volume mappings
        DATA_LOAD_COMMAND="(psql -Uapi_starter_kit_user -dapi_starter_kit -c 'DROP DATABASE api_starter_kit') && (psql -Uapi_starter_kit_user -dapi_starter_kit -c 'CREATE DATABASE api_starter_kit') && (psql -Uapi_starter_kit_user -dapi_starter_kit < /sqlscripts/${2})"
        (cd $SCRIPT_DIR/docker && docker-compose exec mysql /bin/bash -c "$DATA_LOAD_COMMAND")
        ;;
    recreate-db)
        # Clears the DB and runs create.sql to start from a fresh state
        DATA_LOAD_COMMAND="(psql -Uapi_starter_kit_user -dapi_starter_kit -c 'DROP DATABASE api_starter_kit') && (psql -Uapi_starter_kit_user -dapi_starter_kit -c 'CREATE DATABASE api_starter_kit') && (psql -Uapi_starter_kit_user -dapi_starter_kit < /sqlscripts/create.sql)"
        (cd $SCRIPT_DIR/docker && docker-compose exec mysql /bin/bash -c "$DATA_LOAD_COMMAND")
        ;;
    db)
        # Opens an interactive postgres shell
        (cd $SCRIPT_DIR/docker && docker-compose exec pg /bin/bash -c 'psql -Uapi_starter_kit_user -dapi_starter_kit')
        ;;
    redis)
        # Opens an interactive redis shell
        (cd $SCRIPT_DIR/docker && docker-compose exec redis /bin/bash -c 'redis-cli')
        ;;
    # migrate)
    #     # Runs all DB migrations
    #     (cd $SCRIPT_DIR/docker && docker-compose exec api /bin/bash -c 'npm run migrate:run')
    #     ;;
    destroy)
        # Stops the services, removes the containers
        (cd $SCRIPT_DIR/docker && docker-compose down)
        ;;
    *)
        echo "unknown command"
        echo "Usage:"
        echo "./helper.sh [start|log|restart|ssh|stop|data|recreate-db|db|redis|migrate|destroy]"
        ;;
esac

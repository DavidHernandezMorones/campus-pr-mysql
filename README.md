## mysql con docker

El comando usado para mantener la conexion y persistencia con el contenedor fue:

>  docker run --name PR_mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=MYSQLd0cker!" -e "MYSQL_DATABASE=PerformanceReview" -v "C:\Users\a875530\Documents\PR\data:/var/lib/mysql" -d mysql:latest

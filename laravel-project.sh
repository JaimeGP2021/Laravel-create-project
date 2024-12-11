#!/bin/bash
echo Introduce el nombre del proyecto:
read proyecto

echo Introduce el nombre de la BBDD:
read bbdd

composer create-project laravel/laravel $proyecto &&
cd $proyecto &&
composer install &&
npm install &&
composer require laravel/breeze --dev &&
php artisan breeze:install &&
npm install -D tailwindcss postcss autoprefixer flowbite &&
npx tailwindcss init -p &&
sudo -u postgres createuser -P $bbdd && 
sudo -u postgres createdb -O $bbdd $bbdd && 
code .

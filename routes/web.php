<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->post('/register',  'AuthController@register');
    $router->post('/login',  'AuthController@login');

    $router->get('users', ['uses' => 'UserController@getUsers']);
    $router->get('users/ratings', ['uses' => 'UserController@getUserRatings']);
    $router->get('users/average', ['uses' => 'UserController@getUserAverage']);
  
    $router->post('ratings', ['uses' => 'RatingController@createRating']);
  });
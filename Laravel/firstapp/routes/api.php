<?php

use App\Http\Controllers\AuthController;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Controllers\PetController;

Route::get('/', function () {
    return 'Hola Tomás y Kevin';
});

Route::get('/user', function(Request $request){
    return $request->user();
})->middleware(middleware:'auth:sanctum');

Route::post('/signup', [AuthController::class, 'register']);

Route::post('/signin', [AuthController::class, 'login']);

Route::get('/all', [PetController::class, 'index']);

Route::post('/create', [PetController::class, 'store'])->middleware(middleware:'auth:sanctum');

Route::get('/read/{id}', [PetController::class, 'show'])->middleware(middleware:'auth:sanctum');

Route::put('/edit/{id}', [PetController::class, 'update'])->middleware(middleware:'auth:sanctum');

Route::delete('/delete/{id}', [PetController::class, 'delete'])->middleware(middleware:'auth:sanctum');
<?php

namespace App\Http\Controllers;

use App\Models\Pet;
use Illuminate\Http\Request;

class PetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pet = Pet::all();
        return response()->json($pet);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'age' => 'required|integer',
            'animal' => 'required|string',
        ]);
        $pet = Pet::create([
            'name' => $request->name,
            'age' => $request->age,
            'animal' => $request->animal,
        ]);
        return response("Animal creado", 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $pet = Pet::find($id);
        return response()->json($pet);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Validar los datos que vienen del formulario
        $request->validate([
            'name' => 'required|string|max:255',
            'age' => 'required|integer',
            'animal' => 'required|string',
        ]);
    
        // Buscar la mascota por ID
        $pet = Pet::findOrFail($id);
    
        // Actualizar los campos
        $pet->name = $request->input('name');
        $pet->age = $request->input('age');
        $pet->animal = $request->input('animal');
    
        // Guardar los cambios en la base de datos
        $pet->save();
    
        return response()->json(['message' => 'Pet updated successfully!']);
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function delete($id)
    {
        // Buscar la mascota por ID
        $pet = Pet::findOrFail($id);
    
        // Eliminar el registro de la base de datos
        $pet->delete();
    
        return response()->json(['message' => 'Pet deleted successfully!']);
    }
    
}

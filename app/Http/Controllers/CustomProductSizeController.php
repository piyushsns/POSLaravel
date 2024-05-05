<?php

namespace App\Http\Controllers;

use App\CustomProductSize;
use App\Notifications\CustomProductSizeRequestNotification;
use App\Notifications\NewCustomSizeRequestNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Webkul\User\Models\Admin;

class CustomProductSizeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'customer_id' => 'nullable|integer',
            'product_id' => 'required|integer',
            'email' => 'required|string',
            'customer_name' => 'required|string',
            'custom_size' => 'required|string',
            'custom_size_comments' => 'required|string',
        ]);

        if($validation->fails()) {
            return response()->json([
                "success" => false,
                "message" => "Validation Errors",
                'validation_errors' => $validation->errors()
            ], 422);
        }

        // Create the custom product size
        $customProductSize = CustomProductSize::create([
            'customer_id' => $request->input('customer_id'),
            'product_id' => $request->input('product_id'),
            'email' => $request->input('email'),
            'customer_name' => $request->input('customer_name'),
            'custom_size' => $request->input('custom_size'),
            'custom_size_comments' => $request->input('custom_size_comments'),
        ]);

        \Notification::route('mail', $request->input('email'))->notify(new NewCustomSizeRequestNotification(
            $customProductSize->product_flat->name,
            $customProductSize->custom_size,
            $customProductSize->custom_size_comments,
            $customProductSize->customer_name,
        ));

        // Send notification admins
        $admins = Admin::where("role_id", 1)->get();
        foreach ($admins as $admin) {
            $admin->notify(new CustomProductSizeRequestNotification($customProductSize));
        }

        return response()->json([
            'success' => true,
            'message' => 'Your custom size request for this product has beeen shared with the vendor.',
            'data' => $customProductSize],
        201);
    }

    /**
     * Display the specified resource.
     */
    public function show(CustomProductSize $customProductSize)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, CustomProductSize $customProductSize)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(CustomProductSize $customProductSize)
    {
        //
    }
}

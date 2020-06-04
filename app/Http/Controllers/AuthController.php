<?php
namespace App\Http\Controllers;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        
    }

    public function register(Request $request)
    {
        $this->validate(
            $request, [
                'name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required'
            ]
        );
        
        $newUser = User::create([
            'name'  =>  $request->name,
            'email'  =>  $request->email,
            'password'  =>  Hash::make($request->password),
        ]);

        if($newUser)
        {
            $data['token'] =  $newUser->createToken('bearer_token')->accessToken;

            $newUser->api_token = $data['token'];
            $data['name'] =  $newUser->name;
            $newUser->save();

            return response()->json([
                "message" => "User record created",
                "status" => true,
                "data" => $data
            ], 201);
        }
        else
        {
            return response()->json([
                "message" => "Error in Creating User"
            ], 500);
        }
    }

    public function login(Request $request)
    {
        $this->validate($request, [
            'email' => 'required',
            'password' => 'required'
             ]);
           $user = User::where('email', $request->input('email'))->first();
          if(Hash::check($request->input('password'), $user->password)){
               $apikey = $user->api_token;
               User::where('email', $request->input('email'));
               return response()->json(['status' => 'success', 'access_token' => $apikey], 200);
           }else{
               return response()->json(['status' => 'fail'],401);
           }
     
    }
}
<?php
namespace App\Http\Controllers;
use App\Rating;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class RatingController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function createRating(Request $request)
    {
        $this->validate(
            $request, [
                'rating_score' => 'required|numeric',
                'user_rater_id' => 'required|numeric'
            ]
        );

        $user = Auth::user();
        $userId = $user->id;

        $userRatingExist = Rating::where('user_rater_id', $request->user_rater_id)->where('user_id', $userId)->count();
        if($userRatingExist == 1 || $userRatingExist  > 1)
        {
            return response()->json([
                "message"   => "You've previously rated this user."
            ], 409);
        }
        else{
            if($request->rating_score > 10 || $request->rating_score < 1)
            {
                return response()->json([
                    "message"   =>  "Rating Score cannot be greater than 10 or less than 1"
                ], 400);
            }
            else 
            {
                $newUser = Rating::create([
                    'user_id'  =>  $userId,
                    'rating_score'  =>  $request->rating_score,
                    'user_rater_id'  =>  $request->user_rater_id,
                ]);
        
                if($newUser)
                {
                    return response()->json([
                        "message" => "You just rated this user"
                    ], 201);
                }
                else
                {
                    return response()->json([
                        "message" => "Check the values you're passing"
                    ], 400);
                }
            }
        }
        
    }
}
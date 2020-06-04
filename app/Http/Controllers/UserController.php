<?php
namespace App\Http\Controllers;
use App\User;
use App\Rating;
use Illuminate\Http\Request;
use Auth;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(
        Rating $rating, User $user)
    {
        $this->rating = $rating;
        $this->user   = $user;
        $this->middleware('auth');
    }

    public function getUsers() 
    {
        $users = User::get()->toJson(JSON_PRETTY_PRINT);

        return response($users, 200);
    }

    public function getUserRatings()
    {
        $user = Auth::user();
        $userId = $user->id;

        $user = $this->user->find($userId)->ratings()->with('userRated')->get();
        $averageRating = $this->rating->getUserAvgRating($userId);
        $data = [
            "rating" => $user,
            "average_rating" => $averageRating
        ];
        return response()->json([$data], 200);
    }
}
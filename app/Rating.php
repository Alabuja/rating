<?php

namespace App;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Rating extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'rating_score', 'user_id', 'user_rater_id'
    ];

   /**
     * A rating belongs to a user
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
   */
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function userRated()
    {
        return $this->belongsTo('App\User', 'user_id');
    }

    public static function getUserAvgRating($user_id)
    {
        $userTotalReviewCount 	= 	self::where('user_rater_id', $user_id)->count();
        $userTotalReviewSum     =   self::where('user_rater_id', $user_id)->sum('rating_score');
        
    	$totalAverageRating =  round($userTotalReviewSum / $userTotalReviewCount);

		return $totalAverageRating;
    }
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostTranslation extends Model {

    protected $fillable = ['title', 'short_description', 'content'];
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'post_translations';
}
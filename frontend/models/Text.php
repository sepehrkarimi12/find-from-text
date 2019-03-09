<?php

namespace frontend\models;

use yii\base\Model;

/**
 * Text form
 */
class Text extends Model
{
	public $text;

	public function rule() 
	{
		return [
			['text' => 'string'],
		];
	}
}
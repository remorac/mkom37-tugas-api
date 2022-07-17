<?php

namespace frontend\models;

use Yii;
use yii\httpclient\Client;

/**
 * This is the model class for table "payment".
 *
 * @property int $id
 * @property int $identity_number
 * @property int $paid_at
 *
 * @property User $id0
 * @property User $identityNumber
 * @property User $paidAt
 */
class Payment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['identity_number'], 'required'],
            [['identity_number'], 'string', 'max' => 32],
            [['paid_at'], 'integer'],
            [['identity_number'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'identity_number' => 'NIK',
            'paid_at' => 'Membayar pada',
        ];
    }

    /**
     * Gets query for [[Id0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getId0()
    {
        return $this->hasOne(User::className(), ['id' => 'id']);
    }

    public function beforeSave($insert)
    {
        $this->paid_at = time();
        return parent::beforeSave($insert);
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl(Yii::$app->params['serverUrl'].'/api/set-paid')
            ->setData([
                'identity_number' => $this->identity_number, 
                'paid_at' => $this->paid_at,
            ])
            ->send();
        if ($response->isOk) {
            Yii::info(\yii\helpers\Json::encode($response));
        }
    }

    public function afterDelete()
    {
        parent::afterDelete();

        $client = new Client();
        $response = $client->createRequest()
            ->setMethod('POST')
            ->setUrl(Yii::$app->params['serverUrl'].'/api/set-unpaid')
            ->setData([
                'identity_number' => $this->identity_number, 
                'paid_at' => $this->paid_at,
            ])
            ->send();
        if ($response->isOk) {
            Yii::info(\yii\helpers\Json::encode($response));
        }
    }
}

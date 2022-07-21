<?php

namespace app\controllers;

use Yii;
use yii\base\InvalidArgumentException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use common\models\User;

/**
 * Site controller
 */
class ApiController extends Controller
{

    /**
     * @inheritdoc
     */
    public function beforeAction($action)
    {            
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    public function actionSetPaid()
    {
        $post = Yii::$app->request->post();
        $user = User::findOne(['identity_number' => $post['identity_number']]);
        if ($user) {
            $user->payment_status = User::PAYMENT_STATUS_PAID;
            $user->save();
        }
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'status' => 200,
            'data' => \yii\helpers\Json::encode($post),
        ];
    }

    public function actionSetUnpaid()
    {
        $post = Yii::$app->request->post();
        $user = User::findOne(['identity_number' => $post['identity_number']]);
        if ($user) {
            $user->payment_status = User::PAYMENT_STATUS_UNPAID;
            $user->save();
        }
        Yii::$app->response->format = \yii\web\Response::FORMAT_JSON;
        return [
            'status' => 200,
            'data' => \yii\helpers\Json::encode($post),
        ];
    }
}

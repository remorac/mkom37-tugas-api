<?php

use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\models\PaymentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Payments';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="payment-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Payment', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'headerOptions' => ['style' => 'width:1px; white-space:nowrap'],
                'contentOptions' => ['style' => 'width:1px; white-space:nowrap'],
            ],
            /* [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, \frontend\models\Payment $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                },
                'headerOptions' => ['style' => 'width:1px; white-space:nowrap'],
                'contentOptions' => ['style' => 'width:1px; white-space:nowrap'],
            ], */
            [
                'attribute' => 'id',
                'headerOptions' => ['style' => 'width:1px; white-space:nowrap'],
                'contentOptions' => ['style' => 'width:1px; white-space:nowrap'],
            ],
            'identity_number',
            [
                'attribute' => 'paid_at',
                'format' => 'datetime',
                'headerOptions' => ['style' => 'width:1px; white-space:nowrap'],
                'contentOptions' => ['style' => 'width:1px; white-space:nowrap'],
            ],
        ],
    ]); ?>


</div>

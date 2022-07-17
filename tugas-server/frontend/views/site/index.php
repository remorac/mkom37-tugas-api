<?php

/** @var yii\web\View $this */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron text-center bg-transparent">
        <h1 class="display-1">Selamat Datang, <b><?= Yii::$app->user->identity->username ?></b>!</h1>

        <p class="lead display-4 text-success"><?= Yii::$app->user->identity->payment_status ? 'Selamat, akun anda sudah premium.' : 'Anda belum bayar woy!' ?></p>

    </div>

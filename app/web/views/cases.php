<div class="p_banerAo">
    <img src="/assets/web/img/NodeImg/15903836fde349a48513cfe647144c56.jpg"/>
</div>

<div id="cases" class="p_xian1 p_trundle"><a class="p_dang" href="cases.aspx?nid=4&pid=27">TVC广告</a><a
        href="cases.aspx?nid=4&pid=29">纪实专题片</a><a href="cases.aspx?nid=4&pid=37">形象宣传片</a><a
        href="cases.aspx?nid=4&pid=28">微电影</a><a href="cases.aspx?nid=4&pid=38">大型活动EFP作业</a><a
        href="cases.aspx?nid=4&pid=26">3D影像定制</a></div>
<div class="p_literal">
    <ul class="p_welter">
        <?php $v = 0; ?>
        <?php foreach ($cases as $cases_item): ?>
            <?php $v += 1; ?>
            <?php if ($v % 3 != 0): ?>
                <li>
                    <div class="p_Picturea" style="box-sizing: content-box;"><span><?= $cases_item['title'] ?></span><a
                            href='<embed src="http://player.youku.com/player.php/sid/<?= $cases_item['url'] ?>" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>'><img src="<?= $cases_item['thumb'] ?>" rel="prettyPhoto"></a>
                    </div>
                    <p><?= unix_to_human($cases_item['addtime'], TRUE, 'eu') ?></p></li>
            <?php else: ?>
                <li class="p_no">
                    <div class="p_Picturea" style="box-sizing: content-box;"><span><?= $cases_item['title'] ?></span><a title="生命人寿企业形象宣传片" href='<embed src="http://player.youku.com/player.php/sid/XMTI1OTc4NTY4OA==/v.swf" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash"></embed>' rel="prettyPhoto">
                            <img src="<?= $cases_item['thumb'] ?>" /></a>
                    </div>
                    <p><?= unix_to_human($cases_item['addtime'], TRUE, 'eu') ?></p></li>
            <?php endif; ?>
        <?php endforeach ?>
    </ul>
</div>
<div class="p_fany p_fany0a">
    <a class="fl">上一页</a><span><a class="p_dqys">01</a><a href="/cases.aspx?nid=4&pid=27&currentpage=2" rel="nofollow">02</a><a
            href="/cases.aspx?nid=4&pid=27&currentpage=3" rel="nofollow">03</a><a
            href="/cases.aspx?nid=4&pid=27&currentpage=3">...</a><a href="/cases.aspx?nid=4&pid=27&currentpage=3">03</a></span><a
        href="/cases.aspx?nid=4&pid=27&currentpage=2" rel="nofollow" class="fr">下一页</a>
</div>
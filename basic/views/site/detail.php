<?php

/* @var $this yii\web\View
 * @1013753944@qq.com
 */
use yii\helpers\Html;
$this->title();
?>

<div class="product_main clearfix" dd_name="单品区域">
    <div class="pic_info">
        <!-- 大图区开始 -->
        <div class="pic" id="largePicDiv">
            <a href="javascript:;" class="img">
                <img id="largePic" dd_name="大图" alt="<?=$data['title']?>"  src="<?=$data['img']?>" width="320" height="320">
                <div id="moveMask" class="zoom_pup" style="position: absolute; background: url(&quot;images/zoom_pup.png&quot;); left: 36.5px; top: 160px; display: none;"></div>
            </a>
            <a href="javascript:;" class="icon_online" id="read-online" style="" dd_name="免费在线读">免费在线读</a>

            <div class="big_pic" style="display: none;" id="detailPicDiv">
                <img src="<?=$data['img']?>" alt="<?=$data['title']?>" height="800" width="800" id="detailPic" style="left: -90px; top: -400px; position: absolute;">
            </div>
        </div>

        <div class="sale_lable" id="icon_label" style="display: none;">
            <img src="<?=$data['img']?>">
            <p class="cuxiao_word "></p>
        </div>
        <div class="dp_slide">
            <a id="pre_slide" href="javascript:;" class="mainimg_fy prev  " style="z-index:100"></a>
            <a id="next_slide" href="javascript:;" class="mainimg_fy next " style="z-index:100"></a>
            <div class="dp_slide_box" id="main-img-slide" style="visibility: visible; overflow: hidden; position: relative; z-index: 2; left: 0px; width: 295px;">
                <ul id="main-img-slider" style="z-index: 1; margin: 0px; padding: 0px; position: relative; list-style: none; width: 1180px; left: -295px;"><li style="overflow: hidden; float: left; width: 56px; height: 56px;"><a href="javascript:;" data-imghref="#"><img src="#"></a></li><li style="overflow: hidden; float: left; width: 56px; height: 56px;"></li><li style="overflow: hidden; float: left; width: 56px; height: 56px;"></li><li style="overflow: hidden; float: left; width: 56px; height: 56px;"></li><li style="overflow: hidden; float: left; width: 56px; height: 56px;"></li>
                    <li style="overflow: hidden; float: left; width: 56px; height: 56px;">
                        <a href="javascript:;" data-imghref="<?=$data['img']?>">
                            <img src="<?=$data['img']?>" style="width: 56px; height: 56px;"></a></li>
                    <li style="overflow: hidden; float: left; width: 56px; height: 56px;"></li>
                </ul>
            </div>

        </div>
        <div class="share_div clearfix">
            <div class="share_icon" id="share_div" dd_name="分享">
                <a href="javascript:;" class="btn_fxd"><i></i>分享</a> <!-- 回调分享数据 -->
                <ul id="share-url" style="display:none">
                    <li data-dstweb="qqzone" dd_name="分享到QQ空间"><a class="share_qzone" title="qq空间" href="javascript:;"></a></li>
                    <li data-dstweb="sina" dd_name="分享到新浪微博"><a class="share_sina" title="新浪微博" name="__sina" href="javascript:;"></a></li>
                </ul>
            </div>
            <span class="btn_sjf" id="points-tag" rel="nofollow" dd_name="送积分" style="">
                    <i></i>送积分<a href="#" target="_blank" id="pointsTag" name="__operation_jifen" rel="nofollow">2</a>
                </span>
            <a href="javascript:;" class="btn_scsp" title="收藏" dd_name="收藏商品" data-prd="25254513" id="collect_left"><i></i>收藏商品    </a>
        </div>
    </div>
        <!-- 大图区结束 -->
    <div class="show_info">
        <div class="sale_box clearfix">
            <div class="sale_box_left" id="product_info" dd_name="b">
                <!-- 标题区begin -->
                <div class="name_info" ddt-area="001">
                    <!-- 主标题 -->
                    <h1 title="<?=$data['title']?>"><?=$data['title']?></h1>
                    <!-- 副标题、促销语 -->
                    <h2>
                        <span class="head_title_name" title="<?=$data['description']?>&nbsp;&nbsp;"><?=$data['description']?></span>
                        <span class="hot" title="<?=$data['description']?>&nbsp;&nbsp;"></span>
                        <span class="yushou" id="presale-title" style="display: none;"></span>
                    </h2>
                </div>       <!-- 标题区 end-->
                <!-- 出版物begin -->
                <!-- 图书信息区 -->
                <div class="messbox_info">
                    <span class="t1" id="author" dd_name="作者" ddt-area="002">作者:<a href="#" dd_name="作者"><?=$data['author']?></a></span>
                    <span class="t1" dd_name="出版社" ddt-area="003">出版社:<a href="#" dd_name="出版社"><?=$data['press']?></a></span>
                    <span class="t1">出版时间:2018年03月&nbsp;</span>    <!-- 评论数 -->
                    <div class="pinglun">
                        <!-- 排名 -->
                        <span class="t1" id="pubbang" style="display:none" dd_name="图书排行榜排名"></span>
                        <!-- 星级 -->
                        <span class="t1">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                        <a href="javascript:void(0)" id="comm_num_down" dd_name="评论数">1069</a>条评论</span>
                        <a href="javascript:;" class="score write_comment" id="w-comment">我要写评论</a>
                    </div>
                </div>                    <!-- 出版物 end-->
                <!-- 价格区begin -->
                <div class="price_info clearfix">
                    <!-- 手机专享价 -->
                    <div class="price_ph" id="mobile-price" style="display:none">
                        <p class="t">手机专享价</p>
                        <p class="pr">
                            <span class="yen">¥</span>
                        </p>
                        <div class="price_ph_erwei">
                            <i></i>
                            <img src="">
                        </div>
                    </div>
                    <!-- 手机专享价 end -->
                    <div class="price_pc" id="pc-price">
                        <div class="price_d">
                            <p class="t" id="dd-price-text">小巧玲珑书价</p>
                            <p id="dd-price"><span class="yen">¥</span><?=$data['price']?></p>
                        </div>
                        <div class="price_zhe" id="dd-zhe">(6.91折)</div>
                        <div class="price_m price_m_t" id="original-price-text">定价</div>
                        <div class="price_m" id="original-price"><span class="yen">¥</span><?=$data['price']?></div>
                        <div class="price_vip" style="display:none" id="dd-vip">
                            <span></span>
                        </div>
                    </div>
                </div>
                <div class="new_user_price before_user_price" id="dd-vip-price" style="display: none;"></div>

                <div class="price_time" style="display:none">
                    <div class="yushou" id="promo-more" style="display:none">
                        <a href="javascript:void(0)" class="awhite" target="_blank" dd_name="查看更多限时抢商品">查看更多限时抢商品&gt;&gt;</a>
                    </div>
                    <div id="duration-time">
                        <span>倒计时</span><b>11</b><span>天</span><b>99</b><span>小时</span><b>33</b><span>分</span><b>33</b><span>秒</span>
                    </div>
                </div>


                <!-- 价格区 end-->
                <!-- 虚拟捆绑子商品区begin -->
                <!-- 虚拟捆绑子商品列表 -->
                <!-- 虚拟捆绑子商品区 end-->
                <!-- 促销区 -->

                <div class="cuxiao_info clearfix" style="display: block;" dd_name="促销">
                    <div class="left letter02">促销</div>
                    <div class="right" id="promo-list">
                        <div class="clearfix" data-promotype="229" data-promoid="6053522" ddt-area="025"><b>电子书加价购</b>
                            <div class="rule rule06">
                                <ul class="list_e">
                                    <li dd_name="电子书加价购" ddt-pit="0" position="" traced="1">
                                        <a href="javascript:;" class="checkboxa"></a>
                                        <a href="/1900494485.html#ddclick_reco_ebook_purch" class="jia_gou_e" title="+0.5元换购《<?=$data['title']?>(电子书)》作者：<?=$data['author']?>" target="_blank" data-price="0.5" data-pid="1900494485">
                                            +0.5元换购《<?=$data['title']?>(电子书)》作者：<?=$data['author']?>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 促销模板 -->
                    <div style="display:none" id="promo-template">
                        <script type="text/html" data-promoid="1-5-12-201">
                            <div class="clearfix" data-promotype="${promoType}" data-promoid="${promoId}" ddt-area="${ddtArea}">
                                <b>${title}</b>
                                <div class="rule ${rule}">
                                    $${text}
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="14-20-23-205-206-207-102">
                            <div class="clearfix" data-promotype="${promoType}" data-promoid="${promoId}">
                                <b>$${title}</b>
                                <div class="rule ${rule}">
                                    <p>
                                        <span class="text">$${text}</span>
                                        <a href="${activityUrl}" target="_blank" class="alink" rel="nofollow">详情>></a>
                                    </p>
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="3-28">
                            <div class="clearfix" data-promotype="${promoType}" data-promoid="${promoId}" data-show-width="${width}" dd_name="${title}" ddt-area="${ddtArea}">
                                <b>${title}</b>
                                <div class="rule ${rule}">
                                    <span class="text">${text}</span>
                                    <a href="javascript:;" class="xuan_gou xuan_gou_hover" data-text="${selectText}">收起</a>
                                    <div class="jia_gou_info {@if isMarkup != 1} zeng_info {@/if}">
                                        <a href="javascript:;" class="btn_a prev" style="display: none;"></a>
                                        <a href="javascript:;" class="btn_a next" style="display: none;"></a>
                                        <ul class="tab">
                                            {@if len > 1}
                                            {@each i in range(0, len)}
                                            {@if i == 0}
                                            <li class="now">${i}</li>
                                            {@else}
                                            <li>${i}</li>
                                            {@/if}
                                            <li style="display:none"></li>
                                            {@if promoType==3 }
                                            <li style="display:none"></li>
                                            {@/if}
                                            {@/each}
                                            {@/if}
                                        </ul>
                                        <div class="list list02">
                                            <ul class="clearfix">
                                                {@each gifts as gift}
                                                <li data-pid="${gift.productId}" data-price="${gift.exchangePrice}" data-is-spu="${gift.isSpu}" dd_name="${title}_${gift.idx}" ddt-pit="${gift.ddtPit}">
                                                    <a href="/${gift.productId}.html" title="${gift.title}" class="pic" target="_blank" dd_name="${title}图片_${gift.idx}"><img src="${gift.image}"/></a>
                                                    <span class="name" title="${gift.title}">${gift.title}</span>
                                                    {@if isMarkup == 1}
                                                    <span class="price_d {@if gift.isEBook == 1} icon_ebook {@/if}">+&yen;${gift.exchangePrice}</span>
                                                    {@/if}
                                                    {@if gift.count > 0}
                                                    <span class="num">x${gift.count}</span>
                                                    {@/if}
                                                    {@if gift.isMall != 1}
                                                    <span class="price_m {@if gift.isEBook != 1} price_m_no {@/if}">定价<span>&yen;${gift.originalPrice}</span></span>
                                                    {@else if gift.isEBook == 1}
                                                    <span class="price_m"></span>
                                                    {@/if}
                                                </li>
                                                {@/each}
                                                {@if gifts.length % width > 0}
                                                {@each idx in range(0, width - gifts.length % width)}
                                                <li style="border-color:white"></li>
                                                {@/each}
                                                {@/if}
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="30">
                            <div class="clearfix" data-promotype="${promoType}" data-promoid="${promoId}"><b>赠品</b>
                                <div class="rule rule02">
                                    <ul class="song_zeng clearfix">
                                        {@each gifts as gift}
                                        <li dd_name="买一赠多_${gift.idx}"><a href="/${gift.productId}.html" title="${gift.title}" target="_blank">
                                                <img src="${gift.image}"></a><span class="num">x${gift.count}</span></li>
                                        {@/each}
                                    </ul>
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="229">
                            <div class="clearfix" data-promotype="${promoType}" data-promoid="${promoId}" ddt-area="${ddtArea}"><b>电子书加价购</b>
                                <div class="rule rule06">
                                    <ul class="list_e">
                                        {@each gifts as gift,index}

                                        <li dd_name="${title}" ddt-pit="${index}">
                                            <a href="javascript:;" class="checkboxa"></a>
                                            <a href="/${gift.productId}.html#ddclick_reco_ebook_purch" class="jia_gou_e" title="$${gift.title}" target="_blank" data-price="${gift.exchangePrice}" data-pid="${gift.productId}">
                                                $${gift.title}
                                            </a>
                                        </li>
                                        {@/each}
                                    </ul>
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="login">
                            <div class="clearfix"><b>店铺VIP</b>
                                <div class="rule rule04">
                                    <p><span class="text"><a href="##">登录</a>后确认是否享有此优惠 </span></p>
                                </div>
                            </div>
                        </script>
                        <script type="text/html" data-promoid="225">
                            <div class="over over_package"  id="promotion_lists" data-promoid="${promoId}" ddt-area="${ddtArea}">
                                <a href="javascript:;" class="btn_a prev btn_none"></a>
                                <a href="javascript:;" class="btn_a next {@if products.length <= width} btn_none {@/if}"></a>
                                <div>
                                    <ul class="clearfix">
                                        {@each products as product}
                                        <li class="zhu" data-price="${product.price}" data-pid="${product.productId}" data-is-spu="${product.isCatalog}" data-number="${product.number}" data-select-id="${product.selectProductId}" ddt-pit="${product.ddtPit}">
                                            <p class="pic"><a href="/${product.productId}.html" target="_blank" title="$${product.titleShow}"><img alt="" src="${product.image}"><span class="num">x${product.number}</span></a></p>
                                            <p class="price"><span class="price_d">&yen;${product.price}</span></p>
                                            <p class="name"><a href="/${product.productId}.html" title="$${product.titleShow}" target="_blank">$${product.title}</a></p>
                                            <div class="add"></div>
                                        </li>
                                        {@/each}
                                        {@if products.length % width > 0 }
                                        {@each i in range(0, width - products.length % width)}
                                        <li></li>
                                        {@/each}
                                        {@/if}
                                    </ul>
                                </div>
                            </div>
                            <div class="group_info">
                                <i class="all"></i>
                                <p class="num"><a href="${promoUrl}" target="_blank" title="${titleText}">${titleText}</a></p>
                                <p class="price_all_d">总套餐价:<span>&yen;${directPrice}</span></p>
                                <p class="price_all_m">总价:<span>&yen;${totalDangPrice}</span></p>
                                <a href="javascript:;" class="btn btn_red" id="promotion_buyButton" data-direct-price="${directPrice}" ddt-src="packageShopChart" ddt-expose="on"><i class="cart"></i>加入购物车</a>
                            </div>
                        </script>
                    </div>
                    <!--促销模板结束 -->
                </div>
                <!-- 促销区 end-->
                <!-- 礼券 -->
                <div class="cuxiao_info  lingquan_info clearfix" style="display:none" dd_name="礼券" id="coupon-node">
                    <div class="left letter02">领券</div>
                    <div class="right J-right" id="coupon-right">
                        <ul class="clearfix lingquan" id="coupon-list">
                        </ul>
                    </div>
                    <script type="text/html" id="tpl-page">
                        {@each coupon as coup}
                        <li>
                            <a href="javascript:;">
                                {@if coup.couponMinUseValue == 0}
                                ${coup.couponValue}减${coup.couponValue}
                                {@else}
                                ${coup.couponMinUseValue}减${coup.couponValue}
                                {@/if}
                            </a>
                        </li>
                        {@/each}
                    </script>
                </div>                    <!-- 礼券 end -->
                <!-- 地址区 -->
                <div class="area_info clearfix">
                    <div class="left letter03">配送至</div>
                    <div class="right" id="geo-info">
                        <div class="select_add clearfix">
                            <span class="text" id="geo-name" dd_name="配送至">北京市东城区</span>
                            <div class="area_pop" style="display:none;" id="geo-pop">
                                <a href="javascript:;" class="close"></a>
                                <ul class="tab" id="geo-pop-name"><li><a href="javascript:;">北京</a></li><li><a href="javascript:;">北京市</a></li><li class="choose"><a href="javascript:;">东城区</a></li></ul>
                                <ul class="clearfix list list_notaligned" style="display: none;" data-list-name="province"></ul>
                                <ul class="clearfix list list_notaligned" style="display: none;" data-list-name="city"></ul>
                                <ul class="clearfix list" style="" data-list-name="district"><li data-gid="1110101"><a href="javascript:;">东城区</a></li><li data-gid="1110102"><a href="javascript:;">西城区</a></li><li data-gid="1110103"><a href="javascript:;">崇文区</a></li><li data-gid="1110104"><a href="javascript:;">宣武区</a></li><li data-gid="1110105"><a href="javascript:;">朝阳区</a></li><li data-gid="1110106"><a href="javascript:;">丰台区</a></li><li data-gid="1110107"><a href="javascript:;">石景山区</a></li><li data-gid="1110108"><a href="javascript:;">海淀区</a></li><li data-gid="11109"><a href="javascript:;">门头沟区</a></li><li data-gid="11110"><a href="javascript:;">房山区</a></li><li data-gid="104"><a href="javascript:;">通州区</a></li><li data-gid="101"><a href="javascript:;">顺义区</a></li><li data-gid="103"><a href="javascript:;">昌平区</a></li><li data-gid="102"><a href="javascript:;">大兴区</a></li><li data-gid="1110115"><a href="javascript:;">怀柔区</a></li><li data-gid="1110116"><a href="javascript:;">平谷区</a></li><li data-gid="1110117"><a href="javascript:;">延庆县</a></li><li data-gid="1110118"><a href="javascript:;">密云县</a></li></ul>
                                <ul class="clearfix list list_notaligned" style="display: none;" data-list-name="town"></ul>
                            </div>
                            <b>有货</b>
                            <a href="#" target="_blank" rel="nofollow" dd_name="港澳台运费" id="special-freight" style="display:none">运费为订单总额的50%，最低45元</a>
                            <div class="yunfei" dd_name="运费" id="freight">
                                <a href="#" id="dd_delivery_show" target="_blank" rel="nofollow">满49元免运费</a>
                                <ul>
                                    <li>自营订单满49元（含）免运费</li>
                                    <li>不足金额订单收取运费5元起</li>                        </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="area_info clearfix">
                    <div class="left letter02">服务</div>
                    <div class="right">
                        <div class="clearfix">
                            <span class="time">由“<b>小巧玲珑书吧</b>”发货，并提供售后服务。 <font id="arrive-time">21:45前完成下单，预计<b>明天(4月27日)</b>可送达</font></span>         </div>
                    </div>
                </div>
                <!-- 地址区end -->
                <!-- 关联选购 -->
                <!-- 百货关联 -->
                <div class="cuxiao_info choose_xilie clearfix" ddt-area="023">
                    <div class="left">关联商品</div>
                    <div class="right">
                        <div class="clearfix" dd_name="选择系列">
                            <ul class="list_e">
                                <li>
                                    <a href="javascript:void(0);" class="jia_gou_e chosen" ddt-pit="0" position="" traced="1">
                                        <img src="<?= $data['img']?>">
                                        <span><?= $data['title']?></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 百货关联end -->
                <!-- 按钮区begin -->
                <!-- 按钮区 -->
                <div class="buy_box clearfix" ddt-area="030">
                    <div class="num">
                        <input id="buy-num" class="text" value="1" type="text">
                        <a href="javascript:;" class="num_add" id="num_add" dd_name="数量加"></a>
                        <a href="javascript:;" class="num_del num_disabled" id="num_del" dd_name="数量减"></a>
                    </div>
                    <div class="buy_box_btn"><a href="javascript:;" class="btn btn_b btn_b_red" id="sign_no_stock" dd_name="到货通知" ddt-src="sign1" style="display: none;">到货通知</a>
                        <a href="javascript:;" id="part_buy_button" class="btn btn_red" dd_name="加入购物车" go-uri="" ddt-src="addChart1" style="display: block;"><i class="cart"></i>加入购物车</a>
                        <a href="javascript:;" id="gift_card_button" class="btn btn_red" dd_name="礼品卡加入购物车" style="display:none" ddt-src="giftCard1"><i class="cart"></i>加入购物车</a>
                        <div class="btn_pop" id="installment_buy_button" style="display:none">
                            <a href="javascript:;" id="installment_buy_button_a" class="btn btn_blue" dd_name="分期付款" ddt-src="installment1">分期付款</a>
                            <div class="pop_fenqi">
                                <h3>体验分期付款吧<a href="#" class="help" target="_blank"><i></i>帮助</a></h3>
                                <div class="fenqi_info">
                                    <ul class="clearfix">
                                    </ul>
                                    <div class="text">招行手续费收取规则：全部手续费在第一期一次性收取</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:;" id="buy_now_button" class="btn btn_b btn_b_red" dd_name="立即购买" style="" go-uri="" ddt-src="buyNow1">立即购买</a>
                        <a href="javascript:;" id="deposit_buy_button" rel="nofollow" class="btn btn_green" dd_name="支付定金" style="display: none"></a>
                        <div class="btn_pop btn_pop_click" style="z-index:30" id="deposit-share">
                            <a href="##" class="btn btn_b btn_orange02" style="display: none" id="invite_friend_button">邀请好友</a>
                            <div class="btn_yaoqing" id="deposit-share-url">
                                <span>邀请好友参加吧</span>
                                <span>
            			<a href="javascript:void(0)" class="qq" data-dstweb="qqzone" dd_name="分享到QQ空间" title="分享到QQ空间"></a>
            			<a href="javascript:void(0)" class="sina" data-dstweb="sina" dd_name="分享到新浪微博" title="分享到新浪微博"></a>
        			</span>
                            </div>
                        </div>

                        <a href="javascript:;" id="btn_buy_now" rel="nofollow" class="btn btn_b btn_b_red" dd_name="收藏商品" style="display: none" ddt-src="productCollect1">收藏商品</a>
                    </div>
                    <div id="buy-tip" class="text"></div>
                </div>
                <a id="button_endpoint" class="browser"></a>
                <!-- 按钮区 end-->
            </div>
            <div class="service_more" id="service-more" ddt-area="004">
                <div class="narrow_dang">
                    <a href="javascript:void(0)" class="dang" id="shop_btn">
                        <img src="images/narrow_dang.png" width="112" height="70">
                    </a>
                </div>
                <div class="service_more_info">
                    <p class="logo_shang" ddt-area="005">
                        <a href="#" target="_blank" title="新世界青春（北京）文化传媒有限责任公司" dd_name="自营品牌店logo">
                            <img src="/images/9005990030832042_1_o.jpg" width="180" height="60">
                        </a>
                    </p>
                    <p class="title clearfix" ddt-area="006">
                        <a href="#" class="nei_shang" target="_blank" title="新世界青春（北京）文化传媒有限责任公司" dd_name="自营品牌店名称">
                            新世界青春（北京）文化传媒有                </a>
                        <span class="title_name">
            	                <span class="icon dang"></span>
                                <span class="dang_red">小巧玲珑书吧自营</span>
                        </span>
                    </p>
                    <div class="shop_score_box" id="shop-info" dd_name="店铺评分"></div>

                    <ul class="fuwu clearfix" dd_name="服务标示" id="shop-service" style="">    <li class="zpbz">
                            <i></i>            <a href="#" target="_blank">正品保障</a>
                        </li>
                        <li class="hdfk" id="huodaofukuan">
                            <i></i>            <a href="#" target="_blank">货到付款</a>
                            <span class="pop_lipin" id="shop_service_tip_huodao">该店铺大部分商品支持货到付款，本商品是否支持货到付款，请您以结算页为准</span>    </li>
                        <li class="fwzc">
                            <i></i>            <a href="#" target="_blank">服务支持</a>
                        </li>
                        <li class="cjfh">
                            <i></i>            <a href="#" target="_blank">差价返还</a>
                        </li>
                        <li class="hh">
                            <i></i>            <a href="#" target="_blank">15天换货</a>
                        </li>
                        <li class="lpbz">
                            <i></i>礼品包装        <span class="pop_lipin">每个订单收取一次包装费，费用18.00<br>每个订单可选一张贺卡，费用2.00</span>
                        </li>
                        <li class="zcth other">
                            <i></i>            <a href="#" target="_blank">支持7天无理由退货</a>
                        </li>
                        <li class="zclpk other J-lpk">
                            <i></i>            <a href="#" target="_blank">支持礼品卡</a>
                        </li>
                    </ul>
                    <!-- 客服 -->
                    <div class="server_rightdiv" style="" id="live800_div">
                        <div class="s_one">
            	<span class="live800" dd_name="人工客服" style="display: none">
            		<span class="onlines" id="live800" title="点此与客服交流" style="display: none"></span>
            	</span>
                            <span class="server_dj" dd_name="机器人客服" style="" id="robotEntry" roboturl=""></span>
                        </div>
                    </div>
                    <!-- 客服end -->
                    <p class="goto_shop">
                        <a href="" target="_blank" dd_name="进入店铺" ddt-area="007">进入店铺</a>
                        <a id="shop_collect_btn" href="javascript:;" dd_name="店铺收藏">收藏店铺</a>
                    </p>

                    <ul class="shang_other book_product_right clearfix" id="sellers_list" dd_name="其他商家区" ddt-area="008">
                        <li class="clearfix shang_other_all" ddt-area="009">
                            <a href="#" target="_blank">17个商家在售</a>
                            <span class="price">¥23.90起</span>
                            <span class="yun">商家预计送达时间<b>5-14天</b></span>
                        </li>
                        <li class="clearfix J-other" ddt-pit="0">
                            <a href="/1327265577.html" target="_blank">文轩网旗舰店</a>
                            <span class="price">¥31.80</span>
                        </li>
                        <li class="clearfix J-other" ddt-pit="1">
                            <a href="/1185872669.html" target="_blank">博库网旗舰店</a>
                            <span class="price">¥24.28</span>
                        </li>
                    </ul>
                    <script type="application/tpl" id="sellers_list-tpl">
                        <li class="clearfix shang_other_all" ddt-area="009">
                            <a href="#" target='_blank'>${sellersCount}个商家在售</a>
                            <span class="price">&yen${minPrice}起</span>
                            <span class="yun">商家预计送达时间<b>5-14天</b></span>
                        </li>
                        {@each itemInfo as item,index}
                        <li class="clearfix J-other" ddt-pit="${index}">
                            <a href="/${item.productId}.html" target='_blank'>${item.shopName}</a>
                            <span class="price">&yen;${item.price}</span>
                        </li>
                        {@/each}
                    </script>
                </div>

            </div>            </div>
    </div>
</div>

<div class="product_content clearfix">
    <!-- 右侧主体 -->
    <div class="main" id="right-content">
        <div class="group_buy" dd_name="优惠套餐" ddt-area="027" id="buyPackage" style="display:none"></div>
        <div class="group_buy" dd_name="最佳拍档" ddt-area="011" id="buyTogether" style="">
            <ul class="tab clearfix">
                <li class="hover" data-type="buyTogether">经常一起购买的商品</li>
            </ul>
            <div class="over">         <!-- 不可选择时调取btn_none -->
                <a href="javascript:;" class="btn_a prev btn_none"></a>
                <a href="javascript:;" class="btn_a next"></a>
                <div class="paidang_box">
                    <ul class="paidang">
                        <li class="zhu" data-pid="25254513" data-select-product-id="25254513" data-is-spu="0" data-number="1" ddt-pit="0">
                            <p class="pic">
                                <a href="#" dd_name="经常一起购买的商品商品图片0" target="_blank">
                                    <img id="largePic" alt="" src="<?=$data['img']?>" title="<?=$data['title']?>&nbsp;">                     </a>                     <a href="javascript:void(0)" class="unchoose" dd_name="经常一起购买的商品勾选0"></a>
                            </p>
                            <p class="price">
                                <span class="price_d">¥27.50</span> </p>
                            <p class="name" dd_name="经常一起购买的商品商品名称0">
                                <a href="#" title="&nbsp;"><?=$data['title']?></a>
                            </p>
                        </li>
                    </ul>
                    <div id="buyTogether_lists">
                        <ul class="clearfix">
                            <li data-pid="25249360" data-is-spu="0" data-number="1" data-type="" data-request-id="201804261019096853_000107657786797095" ddt-pit="w_0_0" position="" traced="1">

                                <p class="pic">
                                    <a href="#" dd_name="经常一起购买的商品商品图片1" target="_blank">
                                        <img id="largePic" alt="仪式感：把将就的日子过成讲究的生活" src="/images/25249360-1_l_8.jpg" title="仪式感：把将就的日子过成讲究的生活&nbsp;将就的是日子，讲究的才是生活！生命很好，不要得过且过，不要让生活仅仅只是生存。生活需要仪式感来提醒我们，除了眼前的苟且，还有诗和远方；而我们都需要仪式感，来唤醒我们内心有趣的灵魂和热忱。">                             </a>
                                    <a href="javascript:void(0)" class="choose" dd_name="经常一起购买的商品勾选1"></a>
                                </p>
                                <p class="price">
                                    <span class="price_d">¥18.00</span>
                                </p>
                                <p class="name" dd_name="经常一起购买的商品商品名称1">
                                    <a href="#" target="_blank" title="">仪式感：把将就的日子过成讲究的生活</a>
                                </p>
                            </li>
                            <li data-pid="23644091" data-is-spu="0" data-number="1" data-type="pub2mall" data-request-id="201804261019098276_000000696867214537" ddt-pit="w_0_1" position="" traced="1">
                                <p class="pic">
                                    <a href="#" dd_name="经常一起购买的商品商品图片2">
                                        <img id="largePic" alt="百年经典美绘本：玛德琳系列（全6册）" src="/images/23644091-1_l_4.jpg" title="百年经典美绘本：玛德琳系列（全6册）&nbsp;全球销量超万册孩子童年不可错过的好书，精装全六册">
                                    </a>
                                    <a href="javascript:void(0)" class="choose" dd_name="经常一起购买的商品勾选2"></a>
                                </p>
                                <p class="price">
                                    <span class="price_d">¥113.40</span>
                                </p>
                                <p class="name" dd_name="经常一起购买的商品商品名称2">
                                    <a href="#" title="百年经典美绘本：玛德琳系列（全6册）&nbsp;全球销量超万册孩子童年不可错过的好书，精装全六册">百年经典美绘本：玛德琳系列（全6册）</a>
                                </p>
                            </li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div> </div>
        <a id="review_point" class="browser">&nbsp;</a>
        <a id="detail_point" class="browser"></a>
        <a id="comment_point" class="browser"></a>
        <a id="comment" class="browser" isloaded="1"></a>
        <a id="question_point" class="browser"></a>
        <a id="question" class="browser" isloaded="1"></a>
        <div class="t_box" id="product_tab">
            <div id="tab-panels" class="tab_panel" ddt-area="029" style="display: none;">
                <div class="tab_panel_kf">
                    <span class="icon dang"></span> <span class="name">自营</span>
                    <span class="live800" dd_name="人工客服（黏性导航）">
            		<span class="onlines" id="live800" title="点此与客服交流" style="display: none"><a href="javascript:void(0)" title="点此与客服交流">联系商家</a></span>
            	</span>
                    <span class="icon_dj" style="display:block" dd_name="机器人客服（黏性导航）">小当家</span>
                </div>
                <ul class="tab clearfix"></ul>
                <div class="tab_panel_btn" id="buyarea_tab"><a href="javascript:;" class="btn btn_red" dd_name="加入购物车" go-uri="" ddt-src="addChart2" style="display: block;" id="tab_pannel_btn"><i class="cart"></i>加入购物车</a>
                    <span class="price" id="buyarea_price">小巧玲珑书吧价格:<span class="price_d">¥27.50</span></span>
                </div>
            </div>

            <div id="tab-panels2" class="tab_panel" ddt-area="029">
                <div class="tab_panel_kf"></div>
                <ul class="tab clearfix">
                    <li class="hover" id="detail_tab" name="__tab_detail_pub" dd_name="商品详情tab"> 商品详情	                    	                </li>
                    <li class="" id="comment_tab" name="__tab_comment_pub" dd_name="商品评论tab" isload="1">商品评论(1069)</li>
                    <li class="" id="question_tab" name="__tab_wenda_pub" dd_name="商家问答tab" isload="1">商品问答(0)</li>
                </ul>
                <div class="tab_panel_btn"></div>
            </div>

            <div class="t_box_left" id="detail_all" name="Detail_pub" dd_name="商品详情">
                <div class="pro_content" id="detail_describe" ddt-area="010">

                    <ul class="key clearfix">
                        <li>版 次：1</li><li>页 数：</li><li>字 数：</li><li>印刷时间：2018年03月01日</li><li>开 本：16开</li><li>纸 张：轻型纸</li><li>包 装：平装-胶订</li><li>是否套装：否</li><li>国际标准书号ISBN：9787221098931</li><li class="clearfix fenlei" dd_name="详情所属分类" id="detail-category-path"><label>所属分类：</label></li>
                    </ul>
                </div>
                <!-- 快速直达 begin -->
                <a name="operation_point2" id="operation_point2" class="browser browser_op">&nbsp;</a>
                <script id="navigation-templates" type="text/template">
                    <li class="title">快速直达</li>
                    {@each navigationLabels as item}
                    <li data-idx="${item.index}" dd_name="${item.ddName}"><a href="javascript:;"><span class="icon"></span>${item.columnName}</a></li>
                    {@/each}
                </script>
                <div class="book_operation book_operation_fix" id="operation-fix" style="display: none;" dd_name="快速直达">
                    <ul id="navigation-labels">             <li class="title">快速直达</li>                          <li data-idx="feature" dd_name="导航-产品特色" class=""><a href="javascript:;"><span class="icon"></span>产品特色</a></li>                          <li data-idx="abstract" dd_name="导航-编辑推荐"><a href="javascript:;"><span class="icon"></span>编辑推荐</a></li>                          <li data-idx="content" dd_name="导航-内容简介"><a href="javascript:;"><span class="icon"></span>内容简介</a></li>                          <li data-idx="authorIntroduction" dd_name="导航-作者简介"><a href="javascript:;"><span class="icon"></span>作者简介</a></li>                          <li data-idx="catalog" dd_name="导航-目　　录"><a href="javascript:;"><span class="icon"></span>目　　录</a></li>                          <li data-idx="mediaFeedback" dd_name="导航-媒体评论"><a href="javascript:;"><span class="icon"></span>媒体评论</a></li>                          <li data-idx="extract" dd_name="导航-试读章节"><a href="javascript:;"><span class="icon"></span>试读章节</a></li>                      </ul>
                    <div class="erwei_dz">
                        <a href="javascript:;" id="eBook-download" dd_name="电子书推广">
                            <span>下载免费当当读书</span>
                        </a>
                    </div>

                </div>
                <!-- 快速直达 end -->
                <!-- 按需印刷说明 -->
                <!-- end 按需印刷说明 -->
                <!-- detail 说明 -->
                <div class="section" id="detail"><div id="feature" class="section"><div class="title"><span>产品特色</span></div><div class="descrip"><span id="feature-all"></span><img src="/images/99999990002771565_1_o.jpg" style="display: block;"></div></div><div id="abstract" class="section"><div class="title"><span>编辑推荐</span></div><div class="descrip"><span id="abstract-all"></span>★不再过度善良，告别“老好人”<br>★告诉你不迎合、不妥协，也能拥有人生主动权的奥秘
                            <div>★现象级图书《别让不好意思害了你》作者周维丽力作</div>
                            <div>★当你是你自己，世界才会记住你</div>
                            <div>★懂得工作和生活中的法则，成为制定规则的人，掌控主动权</div>
                            <div>★成为有原则的人，守住你的底线，你才能真正赢得世界</div>&nbsp;</div></div><div id="content" class="section"><div class="title"><span>内容简介</span></div><div class="descrip"><span id="content-all"></span>&nbsp; &nbsp; 很多人从小总是接受这样的教育：脾气越好的人越受欢迎，越能克制自己情绪的人越容易成就大事，自然而然长大以后就会形成这种错误的观念。
                            <div>&nbsp; &nbsp; 事实上，脾气越好，越能克制自己的人，越是难以有所成就，这是因为：他们处处迁就他人，哪怕是关键的事情，哪怕一再损害自己的利益，他们也是一而再、再而三地做出让步；他们难以坚持自己的意见，不敢坚持自己的原则，无法让自己的才能发挥出来。更关键的是，在充满竞争的环境中，一个人没“脾气”的老好人，总是会成为被利用、被伤害的对象，如此一来，好脾气的人不仅陷入被动的人生状态，*终更是难以有所作为。</div>
                            <div>&nbsp; &nbsp; &nbsp;本书能够让你认识到过于好脾气、过度压抑自己情绪的危害；帮助你建立属于自己的底线；让你不再迎合，做真正的自己，在工作和生活中获得人生的主动权。</div></div></div><div id="authorIntroduction" class="section"><div class="title"><span>作者简介</span></div><div class="descrip"><span id="authorIntroduction-all"></span>&nbsp;周维丽著有现象级图书《别让不好意思害了你》。
                            <div>&nbsp; &nbsp; 心理咨询师，企业心理培训专家，长期从事心理学相关工作和员工培训工作。周维丽在工作中发现：大量“过于好脾气”的人，他们处处迁就，时时妥协，结果在工作和生活中总是处于被动状态。
                                <div>&nbsp; &nbsp; &nbsp;本书能够让“过于好脾气”的人找回自己，守住底线，获得人生的主动权。</div>
                            </div></div></div><div id="catalog" class="section"><div class="title"><span>目　　录</span></div><div class="descrip"><span id="catalog-all"></span>第一章&emsp;为何脾气好的人难得到重视？
                            <div>这是一个“以和为贵”的时代 &nbsp; // &nbsp;003</div>
                            <div>为什么当“好人”会这么难？ &nbsp; // &nbsp;008</div>
                            <div>不要将这个世界想得太美好 &nbsp; // &nbsp;013</div>
                            <div>好脾气只是一项形象工程 &nbsp; // &nbsp;017</div>
                            <div>好脾气也是一种性格弱点？ &nbsp; // &nbsp;020<br>第二章&emsp;退让并不是解决问题的方法</div>
                            <div>退让只是姿态，而不是解决问题的方法 &nbsp; // &nbsp;027</div>
                            <div>吃亏是福，但有些亏不能吃 &nbsp; // &nbsp;031</div>
                            <div>退一步，未必海阔天空 &nbsp; // &nbsp;035</div>
                            <div>过度忍耐就是一种懦弱 &nbsp; // &nbsp;040</div>
                            <div>过度包容就是一种纵容 &nbsp; // &nbsp;044</div>
                            <div>合理维护自己的正当权益 &nbsp; // &nbsp;049<br>第三章&emsp;真正做自己，不要总是迎合别人</div>
                            <div>勇敢做自己，才能赢得尊重 &nbsp; // &nbsp;057</div>
                            <div>立场坚定，做一个有原则的人 &nbsp; // &nbsp;063</div>
                            <div>如果不符合心意，那就不妨坚持己见 &nbsp; // &nbsp;068</div>
                            <div>分歧面前，更要表现得自信一些 &nbsp; // &nbsp;073</div>
                            <div>避免有求必应，懂得拒绝别人 &nbsp; // &nbsp;078<br>第四章&emsp;真正的强者要严格待人待己</div>
                            <div>强大的人是需要一点脾气的 &nbsp; // &nbsp;087</div>
                            <div>精益求精，努力做到更好 &nbsp; // &nbsp;092</div>
                            <div>从细节做起，保持严谨的态度 &nbsp; // &nbsp;097</div>
                            <div>不达目的，绝不轻易罢手 &nbsp; // &nbsp;102<br>第五章&emsp;保持勇猛，你的人生才能突出重围</div>
                            <div>生活中有时候不需要“老好人” &nbsp; // &nbsp;109</div>
                            <div>保持竞争性是应对侵犯的重要方式 &nbsp; // &nbsp;112</div>
                            <div>在纯粹的生存环境下，弱者有时候也不值得同情 &nbsp; // &nbsp;119</div>
                            <div>把自己变成勇猛的人 &nbsp; // &nbsp;124<br>第六章&emsp;职场是激烈的竞争之地</div>
                            <div>办公室里的老好人总是会吃亏 &nbsp; // &nbsp;131</div>
                            <div>追求并保护自己的根本利益 &nbsp; // &nbsp;136</div>
                            <div>轻易满足是进步最大的敌人 &nbsp; // &nbsp;141</div>
                            <div>不要为他人的错误埋单 &nbsp; // &nbsp;145</div>
                            <div>不妨让自己成为一个有态度的人 &nbsp; // &nbsp;150</div>
                            <div>提升个人能力，让自己更有威严 &nbsp; // &nbsp;155<br>第七章&emsp;不做老好人，才会赢得博弈</div>
                            <div>聪明也是成功的一种特质 &nbsp; // &nbsp;163</div>
                            <div>利用好规则，弱者也可以掌握主动权 &nbsp; // &nbsp;167</div>
                            <div>限制信息，不要什么都说给别人听 &nbsp; // &nbsp;172</div>
                            <div>丑话更要说在前头 &nbsp; // &nbsp;177<br>第八章&emsp;别让你的善良成为他人的工具</div>
                            <div>善良也要带一点儿锋芒 &nbsp; // &nbsp;185</div>
                            <div>不要让善良成为他人利用的工具 &nbsp; // &nbsp;190</div>
                            <div>不要让他人对你的善良形成依赖 &nbsp; // &nbsp;195</div>
                            <div>善良并不是简单地同情弱者 &nbsp; // &nbsp;200</div>
                            <div>过度善良的9种表现 &nbsp; // &nbsp;205<br>第九章&emsp;不要被好脾气害了，更不要被坏脾气控制</div>
                            <div>抑制暴躁，避免被人利用 &nbsp; // &nbsp;213</div>
                            <div>发脾气的时候也要避免被权力操纵 &nbsp; // &nbsp;217</div>
                            <div>就事论事，不要为了发脾气而发脾气 &nbsp; // &nbsp;221</div>
                            <div>拒绝迟钝，但也要保持钝感力 &nbsp; // &nbsp;225</div>
                            <div>避免成为问题专家，该赞美的还是要赞美 &nbsp; // &nbsp;229</div>
                            <div>做好信息接收工作，先了解到底发生了什么 &nbsp; // &nbsp;233<br>后&emsp;记 &nbsp; // &nbsp;238</div></div></div><div id="mediaFeedback" class="section"><div class="title"><span>媒体评论</span></div><div class="descrip"><span id="mediaFeedback-all"></span>&nbsp; &nbsp;人不能太善良，如果事事太大度和宽容，别人不会感激你，反而会变本加厉。人就应有点脾气，过分善良会让自己丢失自己的价值和尊严。有句话：人善被人欺，马善被人骑。凡事适可而止，善良过了头，就缺少心眼；谦让过了头，就成了软弱。 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            <div style="text-align: left;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; <br>&nbsp;——李敖 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>&nbsp; &nbsp;“不该发脾气的时候发脾气”和“该发脾气的时候不发脾气”，都是情商不高的表现。&nbsp; &nbsp;乱发脾气固然不好，但是当一个人该有点脾气的时候，他却一再忍让，一再妥协，没有自己的底线，这种做法实在是不明智的，是不可取的。该有点脾气的时候就要有点脾气，才能真的有所作为。</div>
                            <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; ——赵小东 &nbsp; &nbsp; &nbsp;</div></div></div><div id="extract" class="section"><div class="title"><span>免费在线读</span></div><div class="descrip"><span id="extract-show">吃亏是福，但有些亏不能吃<br>人们常常说“吃亏是福”，这几乎是哲人公认的处世准则，当自己与外界发生摩擦或者利益纠纷时，他们更愿意维持一种和谐与平衡，所以吃亏成了一种比较温和有效的处世手段。清朝画家郑板桥说：“试看世间会打算的，何曾打算得别人一点，直是算尽自家耳。可哀可叹，吾弟识之。”他还提出了一个“难得糊涂”的观点，认为做人不妨糊涂一点，偶尔吃点亏也无妨，凡事没有必要和别人斤斤计较。<br>吃亏文化成了成功人士的哲学思维的重要组成部分，也成了许多人处理人际关系的一个重要准则。但是吃亏文化的流行并不意味着人们喜欢吃亏，不意味着人们可以将吃亏当成人际交往的主要手段，更不意味着处处都要主动吃亏。<br>吃亏是一种策略，它往往拥有一个基本的尺度，简单来说，就是吃亏的人应该明确什么亏可以吃，什么亏不能吃，而不要专注着当一个事事都吃亏的老好人。那么，一般来说，什么样的亏不能吃呢？<br>——涉及核心利益的亏不能吃<br>每一个人都有自己的利益取向，虽然在某些时候，人们愿意迎合他人的想法，但这并不代表他们可以选择漠视自己的利益。在一些不那么重要的事情上做出让步，是赢得和谐关系的一种方法，但是在涉及核心利益时，应当放弃吃亏的想法，因为这些核心利益可能事关自己的生存和发展，可能会对大局产生重大影响，一旦做出让步，就可能会让自己陷入绝境。<br>在过去，有一些老好人常常会无底线无原则地迎合别人的想法，或者无底线地保持退让的姿态，当对方想要获得A时，就大方地将A送出去；当对方想要获得B时，就大方地将B让出去，对于他们来说，似乎没有什么东西是不可以让给别人的，似乎没有什么亏是自己吃不起的，这种态度往往会让他们在核心问题上失去主动权，丧失竞争优势，一旦核心利益受损，便会彻底陷入被动局面。<br>——明显只针对自己的亏不要吃<br>任何一个群体或者团队中都有其最基本的游戏规则，这些规则往往会造成分配上的不均衡，就像一个企业中，管理者的工资和奖金会比员工的高一些，这是内部分配的一个基本原则，很少有人会对这种分配提出质疑。但是如果在分配中，管理者获得了大部分的利益，其他同事也拿到了比较可观的分红，但是自己的分红却最少。考虑到自己在工作中做出的贡献并不比其他人低，却只获得最少的利益，这样的分配很明显是针对自己一个人的。</span><span id="extract-show-all" style="display:none;"></span><textarea style="display:none" id="extract-textarea">吃亏是福，但有些亏不能吃&lt;br /&gt;人们常常说“吃亏是福”，这几乎是哲人公认的处世准则，当自己与外界发生摩擦或者利益纠纷时，他们更愿意维持一种和谐与平衡，所以吃亏成了一种比较温和有效的处世手段。清朝画家郑板桥说：“试看世间会打算的，何曾打算得别人一点，直是算尽自家耳。可哀可叹，吾弟识之。”他还提出了一个“难得糊涂”的观点，认为做人不妨糊涂一点，偶尔吃点亏也无妨，凡事没有必要和别人斤斤计较。&lt;br /&gt;吃亏文化成了成功人士的哲学思维的重要组成部分，也成了许多人处理人际关系的一个重要准则。但是吃亏文化的流行并不意味着人们喜欢吃亏，不意味着人们可以将吃亏当成人际交往的主要手段，更不意味着处处都要主动吃亏。&lt;br /&gt;吃亏是一种策略，它往往拥有一个基本的尺度，简单来说，就是吃亏的人应该明确什么亏可以吃，什么亏不能吃，而不要专注着当一个事事都吃亏的老好人。那么，一般来说，什么样的亏不能吃呢？&lt;br /&gt;——涉及核心利益的亏不能吃&lt;br /&gt;每一个人都有自己的利益取向，虽然在某些时候，人们愿意迎合他人的想法，但这并不代表他们可以选择漠视自己的利益。在一些不那么重要的事情上做出让步，是赢得和谐关系的一种方法，但是在涉及核心利益时，应当放弃吃亏的想法，因为这些核心利益可能事关自己的生存和发展，可能会对大局产生重大影响，一旦做出让步，就可能会让自己陷入绝境。&lt;br /&gt;在过去，有一些老好人常常会无底线无原则地迎合别人的想法，或者无底线地保持退让的姿态，当对方想要获得A时，就大方地将A送出去；当对方想要获得B时，就大方地将B让出去，对于他们来说，似乎没有什么东西是不可以让给别人的，似乎没有什么亏是自己吃不起的，这种态度往往会让他们在核心问题上失去主动权，丧失竞争优势，一旦核心利益受损，便会彻底陷入被动局面。&lt;br /&gt;——明显只针对自己的亏不要吃&lt;br /&gt;任何一个群体或者团队中都有其最基本的游戏规则，这些规则往往会造成分配上的不均衡，就像一个企业中，管理者的工资和奖金会比员工的高一些，这是内部分配的一个基本原则，很少有人会对这种分配提出质疑。但是如果在分配中，管理者获得了大部分的利益，其他同事也拿到了比较可观的分红，但是自己的分红却最少。考虑到自己在工作中做出的贡献并不比其他人低，却只获得最少的利益，这样的分配很明显是针对自己一个人的。&lt;br /&gt;一旦某个群体或者团队中开始出现针对个人的事件，内部分配体系就会崩塌，并且很可能表明这个人已经成了团队内部的背锅者，或者成了人人可以欺负的出气筒。此时如果还保持着吃亏让步的态度，就可能会彻底沦为可有可无的边缘人物，自身的利益也会不断受损。&lt;br /&gt;——被人利用的亏不要吃&lt;br /&gt;在处理人际关系的时候，免不了会出现一些行为和思想上的接触，免不了产生联系，这时候有人可能会获得更多的利益，而有的人可能会吃亏，这种吃亏有时候是出于社交和生存的需要，但有时候是被动的，吃亏的人受到了他人的利用，或者成了他人手上的一枚棋子，那么这个时候的退让和吃亏就显得毫无必要，也毫不值得了。&lt;br /&gt;职员A和职员B是一对好朋友，两个人一同去竞争一个主管职位，并成了最终的两位候选人。在公司对两人进行最后的考核之前，职员A言辞恳切地说：“我不希望因为工作的关系，使得咱们两个人的关系受到影响，所以我准备退出，我会亲自写信给老总，说明自己不适合担任这个职务，因此没有必要前去竞争。”职员B听了，觉得有些不好意思，于是当天晚上就写了一封信给老总，说明自己因为身体原因不适合参与竞争。就这样，这份工作最终落到了职员A手里，可是在某一次，职员B无意中从另外一个朋友口中得知职员A当初对于主管的职位志在必得，为了消除最后一个竞争对手，才想出了一出苦情戏，误导职员B主动放弃。听到这个消息后，职员B愤恨不已，但事已至此，已经追悔莫及。&lt;br /&gt;生活中，常常会出现这样的情况，有时候，人们觉得自己是好心做出让步，而成全别人，却不知道自己可能正中别人的圈套，跳入他人事先挖好的陷阱中，而面对类似的情形，一定要坚持维护自己的尊严和利益，果断地提出抗议。&lt;br /&gt;一般而言，以上几种情况下的吃亏都要尽量避免，不能表现得太过宽容大度，不能任由他人排斥和打击自己，在必要的时候应当大胆站出来说“不”，并主动维护自己的相关利益。&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;强大的人是需要一点脾气的&lt;br /&gt;很多书籍或者故事中都会将“好脾气”当作成功学的一个基本原则来对待，在这些作品中，个人的忍耐、包容、退让、示弱、吃亏会被当作一种美德和策略，而脾气越好的人似乎也越容易获得成功，这种说法是成功学的一个重要组成部分。可在现实中，一个人的脾气如果太好，反而会遭遇到各种尴尬，反而会处处受制于人，可以说脾气太好的人难以获得太多成功的机会。&lt;br /&gt;如果对那些知名的成功人士进行分析，就会发现多数人都不会表现出过好的脾气，不会表现出过分妥协与迎合的特质，他们之所以获得成功并非因为事事妥协和让步，并非因为没有任何脾气，而恰恰在于他们懂得把握一个好脾气的尺度。&lt;br /&gt;牛顿是一个非常严格的天才，他常常全身心地投入到工作当中去，而对于工作的专注也让他显得有些固执。据说，牛顿非常喜欢当众发表演说，可是一旦人们对他的演讲不感兴趣，并且离开，他会对着空房子一直说下去。但正是这份固执，使得他在物理学领域、数学领域都有了很大的突破。&lt;br /&gt;陆先生是一个脾气不太好的建筑师，这个毕业于名牌大学的建筑师人缘一直很不好，还非常热衷于和同事打口水仗，只要是和工作有关的事情，他都会表现出非常严谨的态度，会表现得非常勤奋。2009年，上海一家博物馆准备斥巨资建造一个具有欧式风格的巨大穹顶，为此博物馆以巨资悬赏建造方案，陆先生主动请缨，接下了这个难度很高的工作，当然，为了确保工作顺利完成，博物馆还邀请了其他建筑师一同参与设计。&lt;br /&gt;自信满满的他在进行实地测量和分析后，坚称有办法造出最美丽的大穹顶，但是却拒绝透露一些关键工艺。他有自己的一套工作方法，有自己的设计理念，虽然他也懂得与人进行交流，但那些人的想法完全没有吸引到他。不仅如此，他非常反感那些不懂装懂的人在自己面前指手画脚，而在一些设计理念上，他和其他建筑师的沟通一直都很不顺，工程进度一直停滞不前。为了避免受到干扰，陆先生对其他建筑师以及不是内行的管理者下达了逐客令，要求他们要么保持沉默，要么干脆退出。陆先生认为博物馆既然将任务交给了自己，那么自己应该拥有绝对的控制权和决策权。这条逐客令一公布出来，他很快就被众人孤立起来，但这使他有了更多的私人空间进行创作和设计，也使得他出色的才华不会受到世俗人的干扰。&lt;br /&gt;很多成功人士或多或少都有一些脾气和鲜明的个人态度，他们特立独行，从不迁就他人，也不将就任何事情。那么为什么许多强大的人不容易成为“老好人”呢？&lt;br /&gt;那些有脾气、有态度的人一般不太善于控制自己的情绪，这种人直爽、精力旺盛、容易动真感情。他们体内控制型的能量比较高，即便不以发脾气的形式表现出来，本身也属于严格、认真的类型，情绪外露比较明显，不喜欢隐藏，有事情会当面讲清楚。&lt;br /&gt;一些心理学家还提出了另外的看法，他们认为那些成功人士之所以表现出“不会完全迎合他人”的想法，关键在于特权：特权使人变得更有主见，有时候甚至使人变得更加粗鲁。加州大学伯克利分校的心理学家保罗·皮夫领导自己的研究团队进行了实验，来检测较高的社会地位是否意味着高贵的行为，结果答案让人吃惊：同较低阶层的个体相比，较高阶层的个体表现更缺乏宽容心。高层人士不习惯于他人与自己的观点不一致，不习惯于见到其他人违背自己的意愿，哪怕仅仅只是迟到和小失误，都可能让这些人火冒三丈。&lt;br /&gt;心理学家认为成功人士具备更强大的能力，他们拥有更多的资源，拥有更大的权力，有时候会将自己独立于他人甚至整个系统之外，并且会将自己的想法看得非常重，这些成就大事业的人更加注重自己的感受，更加自信，他们不愿意迁就他人，并且不喜欢围绕着他人去生活和工作，对他们来说，只要自己活着，就应该有所作为，而有所作为的前提是“一切都要依靠自己去奋斗”。&lt;br /&gt;这是一种与生俱来的特质，他们自出生起就带着“永不妥协”“不轻易退让”“大胆做自己”这一类特质。那些最强大的人，他们几乎从一开始就表现得与众不同，就不在意在他人面前展示自己“不那么好相处”的一面，对于他们来说，如何展示自己的影响力，如何避免被他人彻底干扰，才是最重要的事，为了达到自己的目的，他们有时候会适当做出让步，但不会轻易委曲求全。&lt;br /&gt;此外，强大的人在生活中会表现得更为认真一些、严谨一些，这些人以目标为导向，注重权威，对事的关注度比较高，非常看重规则和制度的约束作用，不允许有人违背原则；强大的人更具责任心和上进心，他们对生活的领悟能力和领悟的层次都要比一般人高，追求也要更高，更重要的是，他们不愿意随随便便就降低自己的姿态。强者更像是一头狮子，他们也会以狮子的标准来要求身边的人。&lt;br /&gt;他们有时候就像麻烦制造者一样，常常会给自己和身边的人增加各种压力，常常会选择给自己和他人提出更多更高的要求，但这些要求是自我提升的一个重要助力：要想变得更加强大，那么就要懂得去承受更多的激励，去承受更多的压力。</textarea><div class="section_show_more"><a href="javascript:void(0);" class="section_show_more" id="extract-btn" dd_name="显示全部信息">显示全部信息</a></div></div></div></div>
                <!-- detail 说明end -->
            </div>

            <!-- 详情页完 -->
            <!-- 价格说明begin -->
            <!-- 价格说明begin -->
            <div class="price_indication" id="price-explain">
                <div class="title">价格说明</div>
                <ul>
                    <li><span><i></i>当当价：</span>为商品的销售价，具体的成交价可能因会员使用优惠券、积分等发生变化，最终以订单结算页价格为准。</li>
                    <li><span><i></i>划线价：</span>划线价格可能是图书封底定价、商品吊牌价、品牌专柜价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或该商品曾经展示过的销售价等，由于地区、时间的差异化和市场行情波动，商品吊牌价、品牌专柜价等可能会与您购物时展示的不一致，该价格仅供您参考。</li>
                    <li class="word2"><span><i></i>折扣：</span>折扣指在划线价（图书定价、商品吊牌价、品牌专柜价、厂商指导价等）某一价格基础上计算出的优惠比例或优惠金额。如有疑问，您可在购买前联系客服咨询。</li>
                    <li class="word4"><span><i></i>异常问题：</span>如您发现活动商品销售价或促销信息有异常，请立即联系我们补正，以便您能顺利购物。</li>
                </ul>
            </div>
            <!-- 价格说明 end -->                <!-- 价格说明 end -->
            <!-- 评论区begin -->
            <!-- 商品评论 begin -->
            <div class="mbox3 book_comment" id="comment_all" dd_name="PC评论区域">
                <h3 class="tit"><a href="javascript:;" class="btn_red" id="w-short-comment">写短评 赚积分</a>短评（<span id="comment_total_num_title">1069</span>）</h3>
                <div class="comment_head">
                    <div class="comment_rate">
                        <div class="processingbar">
                            <svg id="comment-percent" xmlns="http://www.w3.org/2000/svg" version="1.1" width="114" height="114" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                                <path id="J-light" class="small " fill="none" d="M57,3A54,54,0,1,1,56.99,3" stroke-width="6" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 6;"></path>
                                <path id="J-deep" class="big " fill="none" d="M22.289469076926878,98.36639992842481A54,54,0,1,0,22.286870017882002,98.36421891979323" stroke-width="6" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); stroke-width: 6;"></path>
                            </svg><div class="nei"><span>好评率</span><span class="num" id="comment_percent">100<i>%</i></span></div>
                        </div>
                    </div>
                    <div class="comment_tag_wrap" id="comment_tags_div">          <div class="comment_tag_label">买过的人觉得</div>     <div class="comment_tag_total clearfix">         <a href="javascript:" class="up" dd_name="标签展开&amp;收回" style="display: none;">up</a>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="488" data-tag-num="12">实用（12）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="1218" data-tag-num="10">受益匪浅（10）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="1217" data-tag-num="10">干货满满（10）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="490" data-tag-num="10">振奋人心（10）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="489" data-tag-num="7">内容丰富（7）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="491" data-tag-num="7">感染力强（7）</a></span>                  <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="1216" data-tag-num="6">文笔流畅（6）</a></span>              </div>      </div>
                    <!-- <div class="comment_chart_list">对已购商品写评论<a type="button" id = 'writeCutComment' class="btn_red"  dd_name="写评论入口">写短评 赚积分</a></div> -->
                </div>
                <div class="comment_body">
                    <div class="comment_tabs">
                        <!-- 评论数 -->
                        <div class="clearfix comment_tabs_wrap" id="comment_num_tab">
                            <span class="on" data-type="1" dd_name="全部评论">全部（1069）</span>
                            <span data-type="2" dd_name="好评">好评（1069）</span>
                            <span data-type="3" dd_name="中评">中评（0）</span>
                            <span data-type="4" dd_name="差评">差评（0）</span>
                            <span data-type="5" dd_name="晒图评论">晒图（6）</span>
                        </div>
                        <div class="comment_sort " id="comment_sort">
                            <i class="icon"></i>
                            <span class="pl02">精彩评论</span>
                            <ul>
                                <li><a href="javascript:" dd_name="精彩评论排序">精彩评论</a></li>
                                <li><a href="javascript:" dd_name="时间排序">时间排序</a></li>
                            </ul>
                        </div>
                    </div>
                    <div id="comment_list">    <div class="item_wrap">
                            <!-- 评论列表 -->
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="#" target="_blank">一天就看完了，太适合我这种不断让步的人了，我要变的坚强，不要让我自以为的好心伤害了自己，不论是工作还是生活。加油吧，从今天起我要改变！改变！</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-26 07:20:03</span>
                                        <span></span>
                                        <span class="icon_yg">已购</span>
                                    </div>

                                    <div class="support" data-comment-id="325169322">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="1">1</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>

                                    </div>

                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="小雯子2107..." src="/images/header_o.jpg"></a>
                                    <span class="name" title="小雯子210718">小雯子2107...</span>
                                    <span class="level level">普通会员</span>
                                </div>

                            </div>
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="/" target="_blank">干货满满，文笔流畅，物超所值。</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-25 20:45:41</span>
                                        <span></span>
                                        <span class="icon_yg">已购</span>
                                    </div>

                                    <div class="support" data-comment-id="325158442">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="0">赞</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>

                                    </div>

                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="匿名用户" src="/images/header_o.jpg"></a>
                                    <span class="name" title="">匿名用户</span>
                                    <span class="level level04">钻石会员</span>
                                </div>
                            </div>
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="#" target="_blank">送给朋友的，很适合他们小两口</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-25 17:11:30</span>
                                        <span></span>
                                    </div>

                                    <div class="support" data-comment-id="325144994">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="0">赞</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>

                                    </div>

                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="无昵称用户" src="/images/header_o.jpg"></a>
                                    <span class="name" title="">无昵称用户</span>
                                    <span class="level level">普通会员</span>
                                </div>

                            </div>
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="#" target="_blank">质量很不错，价格也实惠</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-25 17:11:20</span>
                                        <span></span>
                                    </div>

                                    <div class="support" data-comment-id="325144930">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="0">赞</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>

                                    </div>

                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="无昵称用户" src="/images/header_o.jpg"></a>
                                    <span class="name" title="">无昵称用户</span>
                                    <span class="level level">普通会员</span>
                                </div>

                            </div>
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="#" target="_blank">书的内容很不错，是作者长期实际和总结出来的理论。最重要的是它的方法可以被普通人轻松运用并且效果显著。</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-25 17:11:09</span>
                                        <span></span>
                                    </div>

                                    <div class="support" data-comment-id="325144864">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="0">赞</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>
                                    </div>
                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="无昵称用户" src="/images/header_o.jpg"></a>
                                    <span class="name" title="">无昵称用户</span>
                                    <span class="level level">普通会员</span>
                                </div>
                            </div>
                            <div class="comment_items clearfix">
                                <div class="items_right">
                                    <div class="pinglun">
                        <span class="star_box">
                            <span class="star" style="width:100%"></span>
                        </span>
                                        <em>10分</em>
                                    </div>
                                    <div class="describe_detail">

                                        <span><a href="#" target="_blank">很喜欢这本书～语言的力量是不可以被忽视的，它可以摧毁一个人，也可以鼓舞一个人～这本书在很大程度上让我内心恢复平静</a></span>

                                    </div>
                                    <div class="pic_show_big" style="display:none" dd_name="晒图点击">
                                        <div class="big_pic_wrap"><img></div>
                                        <span class="big_pic_left"><i></i></span>
                                        <span class="big_pic_right"><i></i></span>
                                    </div>

                                    <div class="starline clearfix">
                                        <span>2018-04-25 17:10:58</span>
                                        <span></span>
                                    </div>

                                    <div class="support" data-comment-id="325144850">
                                        <a href="javascript:" class="zan " dd_name="赞" data-type="zan" data-number="0">赞</a>
                                        <a href="javascript:" class="cai " dd_name="踩" data-type="cai" data-number="0">踩</a>
                                        <a href="javascript:" style="display: none;" class="reply " dd_name="回复" data-type="huifu" data-number="0">回复</a>

                                    </div>
                                </div>
                                <div class="items_left_pic">
                                    <a href="javascript:" class="pic"><img alt="无昵称用户" src="/images/header_o.jpg"></a>
                                    <span class="name" title="">无昵称用户</span>
                                    <span class="level level">普通会员</span>
                                </div>
                            </div>
                        </div>
                        <!-- 评论列表end -->
                        <!-- 页码begin -->
                        <div class="fanye_box clearfix" id="comment_page" dd_name="评论翻页">
                            <div class="fanye">
                                <a href="javascript:" class="on J-num" dd_name="第一页翻页点击">1</a><a href="javascript:" class="J-num" dd_name="第二页翻页点击">2</a><a href="javascript:" class="J-num" dd_name="第三页翻页点击">3</a><a href="javascript:" class="J-num" dd_name="第四页翻页点击">4</a><a href="javascript:" class="J-num" dd_name="第五页翻页点击">5</a><span class="pot">...</span><a href="javascript:" class="btn next" dd_name="向右翻页点击"></a>            </div>
                        </div>
                        <!-- 页码end -->
                    </div>
                </div>
                <h3 class="tit"><a href="javascript:;" class="btn_red" id="w-long-comment">写长评 赚积分</a>长评（<span id="comment_long_total_num_title">0</span>）</h3>
                <div class="comment_body">
                    <div id="comment_long_list">

                        <div class="item_wrap">
                            <div class="comment_items comment_items_none" style="border-top: none">
                                <i class="icon"></i>暂无长评
                            </div>
                        </div>
                    </div>

                </div>
                <!-- 标签模板 -->
                <script type="text/template" id="comment_tags_tpl">
                    {@if tags.length == 0}
                    <div class="comment_tag_none">
                        <i class="icon"></i>
                        买家还没有留下对我的印象，陪我一起等一下嘛~
                    </div>
                    {@else}
                    <div class="comment_tag_label">买过的人觉得</div>
                    <div class="comment_tag_total clearfix">
                        <a href="javascript:" class="up" dd_name="标签展开&收回">up</a>
                        {@each tags as tag}
                        <span class="tag_posi" dd_name="买过的人觉得标签"><a href="javascript:" data-tag-id="${tag.label_id}" data-tag-num="${tag.num}">${tag.name}（${tag.num}）</a></span>
                        {@/each}
                    </div>
                    {@/if}
                </script>

            </div>
            <!-- 商品评论 end -->    			<!-- 评论区end -->

            <!-- 问答区begin -->
            <div id="question_all" class="mbox3" name="Question_b2c" dd_name="商品问答">	<h3 class="tit">
                    商品问答<i>（<a id="question_total_count" href="javascript:;">0</a>条）
                    </i>
                </h3>
                <div class="ques_none clearfix">
                    <input type="button" class="btn_ask right" value="我要提问" id="question_new" name="__Submit_qa_book" dd_name="问答按钮">目前没有问答
                </div>
                <!-- 商品问答 end --></div>
            <!-- 问答区end -->
        </div>
    </div>
    <!-- 右侧主体end -->
    <!-- 左侧主体 -->
    <div class="aside" dd_name="左侧区域">
        <div class="abox" dd_name="看过还看了" ddt-area="013" id="alsoView" style="">
            <h3>浏览此商品的顾客也同时浏览</h3>
            <ul class="none_b list01 list_alsoview">
                <li data-type="" data-request-id="201804261019096853_000107657786797095" ddt-pit="0" position="request_id=201804261019096853_000107657786797095&amp;perm_id=20180419112649185423722240614940031&amp;module=alsoview_pub&amp;main_pid=25254513&amp;reco_pid=25234505&amp;position=1&amp;state=dev&amp;client=PC" traced="1">
                    <p class="pic">
                        <a href="#" dd_name="浏览此商品的顾客也同时浏览商品图片0" target="_blank">
                            <img id="largePic" alt="姑娘，你活得太硬了" src="/images/25234505-1_l_1.jpg" title="姑娘，你活得太硬了&nbsp;百万治愈大号摇铃铛首部文集，披露辞职、下海、写作、创业励志经历！点击，评论，微博大号休闲璐、百万粉丝自媒体人鬼脚七、古风歌手河图联袂推荐！">                 </a>                 <span class="hover">
                            <span class="pinglun">227条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥26.00</span>
                    </p>
                    <p class="name">
                        <a href="#" dd_name="看了还看商品名称0" title="姑娘，你活得太硬了&nbsp;百万治愈大号摇铃铛首部文集，披露辞职、下海、写作、创业励志经历！点击，评论，微博大号休闲璐、百万粉丝自媒体人鬼脚七、古风歌手河图联袂推荐！">姑娘，你活得太硬了</a>             </p>
                    <p class="zuozhe">姚林君</p>
                </li>
                <li data-type="" data-request-id="" ddt-pit="1" position="" traced="1">
                    <p class="pic">
                        <a href="#" dd_name="浏览此商品的顾客也同时浏览商品图片1" target="_blank">                     <img id="largePic" alt="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝" src="/images/25174269-1_l_9.jpg" title="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）&nbsp;我们的人生，就是一场冷暖自知的修行。内心的从容，能让我们淡然面对一切苦难，成为连灵魂都优雅的人。">
                        </a>
                        <span class="hover">
                            <span class="pinglun">536条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥24.70</span>
                    </p>
                    <p class="name">
                        <a href="/25174269.html#ddclick_reco_reco_alsoview" dd_name="看了还看商品名称1" target="_blank" title="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）&nbsp;我们的人生，就是一场冷暖自知的修行。内心的从容，能让我们淡然面对一切苦难，成为连灵魂都优雅的人。">心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝</a>
                    </p>
                    <p class="zuozhe">张其姝</p>
                </li>
                             <li data-type="pub2mall" data-request-id="201804261019098276_000000696867214537" ddt-pit="14" position="request_id=201804261019098276_000000696867214537&amp;perm_id=20180419112649185423722240614940031&amp;module=alsoview_pub&amp;main_pid=25254513&amp;reco_pid=22624624&amp;position=15&amp;state=dev&amp;client=PC">             <p class="pic">                 <a href="/22624624.html#ddclick_reco_alsoview_b2c" dd_name="浏览此商品的顾客也同时浏览商品图片14" target="_blank">                     <img id="largePic" alt="别让不好意思害了你" src="/images/22624624-1_l_2.jpg" title="别让不好意思害了你&nbsp;">                 </a>                 <span class="hover">                                          <span class="price_e">电子书价:                         <a href="/1900494485.html" dd_name="看了还看电子书价14" target="_blank">¥1.00</a>                     </span>                                          <span class="pinglun">44310条评论</span>                 </span>             </p>             <p class="price">                 <span class="price_d">¥13.00</span>             </p>             <p class="name">                 <a href="/22624624.html#ddclick_reco_alsoview_b2c" dd_name="看了还看商品名称14" target="_blank" title="别让不好意思害了你&nbsp;">别让不好意思害了你</a>             </p>             <p class="zuozhe">周维丽</p>         </li>                  <li data-type="pub2mall" data-request-id="201804261019098276_000000696867214537" ddt-pit="15" position="request_id=201804261019098276_000000696867214537&amp;perm_id=20180419112649185423722240614940031&amp;module=alsoview_pub&amp;main_pid=25254513&amp;reco_pid=22632216&amp;position=16&amp;state=dev&amp;client=PC">             <p class="pic">                 <a href="/22632216.html#ddclick_reco_alsoview_b2c" dd_name="浏览此商品的顾客也同时浏览商品图片15" target="_blank">                     <img id="largePic" alt="天黑以后（与诺贝尔文学奖擦身而过的作家,村上春树关于孤独" src="/images/22632216-1_l_1.jpg" title="天黑以后（与诺贝尔文学奖擦身而过的作家,村上春树关于孤独的经典之作，全新译本！）&nbsp;">                 </a>                 <span class="hover">                                          <span class="pinglun">55931条评论</span>                 </span>             </p>             <p class="price">                 <span class="price_d">¥26.30</span>             </p>             <p class="name">                 <a href="/22632216.html#ddclick_reco_alsoview_b2c" dd_name="看了还看商品名称15" target="_blank" title="天黑以后（与诺贝尔文学奖擦身而过的作家,村上春树关于孤独的经典之作，全新译本！）&nbsp;">天黑以后（与诺贝尔文学奖擦身而过的作家,村上春树关于孤独</a>             </p>             <p class="zuozhe">〔日〕村上春树著,施小炜译</p>         </li>              </ul> </div>
        <!-- 同类图书排行榜 begin -->
        <div class="abox" dd_name="同类图书排行榜" id="bang_div" style="" isloaded="1">
            <h3>同类图书排行榜</h3>
            <ul class="tab" id="bang_tab"><li dd_name="畅销榜" class="hover">畅销榜</li><li dd_name="新书榜">新书榜</li></ul>
            <ul class="list02 clearfix" id="hotBang_data" style="" ddt-area="018">
                <li ddt-pit="0" class="hover">
                    <span class="num num_top3">1</span>
                    <a href="25209814.html" class="pic" dd_name="排行榜商品图片1" target="_blank" style="">
                        <img id="largePic" src="/images/25209814-1_x_2.jpg" title="生活需要仪式感 （你可以活得更高级，把温暖和感动带给你在乎的人）&nbsp;拥有仪式感，你才能真正成为有爱、有温度、有人情味的人，得到认可与尊重，收获惊喜、浪漫、幸运和精彩。人民日报强烈呼吁，3000家媒体感动推荐，5亿人热情参与，写给有心改变却失去方向的人。">
                    </a>
                    <p class="name" dd_name="排行榜商品名称1">
                        <a href="25209814.html" title="生活需要仪式感 （你可以活得更高级，把温暖和感动带给你在乎的人）&nbsp;拥有仪式感，你才能真正成为有爱、有温度、有人情味的人，得到认可与尊重，收获惊喜、浪漫、幸运和精彩。人民日报强烈呼吁，3000家媒体感动推荐，5亿人热情参与，写给有心改变却失去方向的人。" target="_blank">生活需要仪式感 （你可以活得更高级，把温暖和感动带给你在乎的人）</a>
                    </p>
                    <p class="zuozhe" style="">李思圆 著等</p>
                    <p class="price" style="">
                        <span class="price_d">24.80</span>
                        <span class="price_zhe">(6.89折)</span>
                    </p>
                </li>
                <li ddt-pit="1">
                    <span class="num num_top3">2</span>
                    <a href="23271503.html" class="pic" dd_name="排行榜商品图片2" target="_blank" style="display:none">
                        <img id="largePic" src="" title="断舍离&nbsp;">           </a>
                    <p class="name" dd_name="排行榜商品名称2">
                        <a href="23271503.html" title="断舍离&nbsp;" target="_blank">断舍离</a>
                    </p>
                    <p class="zuozhe" style="display:none">(日)山下英子</p>
                    <p class="price" style="display:none">
                        <span class="price_d">23.00</span>
                        <span class="price_zhe">(7.19折)</span>
                    </p>
                </li>
                <li ddt-pit="2">
                    <span class="num num_top3">3</span>
                    <a href="23927251.html" class="pic" dd_name="排行榜商品图片3" target="_blank" style="display:none">
                        <img id="largePic" src="http://img3m1.ddimg.cn/40/17/23927251-1_x_14.jpg" title="遇见未知的自己（全新修订版）&nbsp;杨幂再度推荐！美好的事物会因为我们有意识的选择而发生。华语世界深具影响力身心灵作家张德芬代表作，畅销逾500万册。">
                    </a>
                    <p class="name" dd_name="排行榜商品名称3">
                        <a href="23927251.html" title="遇见未知的自己（全新修订版）&nbsp;杨幂再度推荐！美好的事物会因为我们有意识的选择而发生。华语世界深具影响力身心灵作家张德芬代表作，畅销逾500万册。" target="_blank">遇见未知的自己（全新修订版）</a>
                    </p>
                    <p class="zuozhe" style="display:none">张德芬 著等</p>
                    <p class="price" style="display:none">
                        <span class="price_d">24.70</span>
                        <span class="price_zhe">(6.5折)</span>
                    </p>
                </li>
                <li ddt-pit="3">
                    <span class="num ">4</span>
                    <a href="22783643.html" class="pic" dd_name="排行榜商品图片4" target="_blank" style="display:none">
                        <img id="largePic" src="http://img3m3.ddimg.cn/80/5/22783643-1_x_9.jpg" title="活法&nbsp;畅销十年,单本在中国发行突破200万册。 两家世界500强企业京瓷及KDDI的创立者，日航起死回生奇迹的缔造者。 他是经营界的传奇式人物，却始终坚持简单而平实的活法。他就是稻盛和夫！">
                    </a>
                    <p class="name" dd_name="排行榜商品名称4">
                        <a href="22783643.html" title="活法&nbsp;畅销十年,单本在中国发行突破200万册。 两家世界500强企业京瓷及KDDI的创立者，日航起死回生奇迹的缔造者。 他是经营界的传奇式人物，却始终坚持简单而平实的活法。他就是稻盛和夫！" target="_blank">活法</a>
                    </p>
                    <p class="zuozhe" style="display:none">(日)稻盛和夫　著等</p>
                    <p class="price" style="display:none">
                        <span class="price_d">16.20</span>
                        <span class="price_zhe">(6折)</span>
                    </p>
                </li>
                <li ddt-pit="4">
                    <span class="num ">5</span>
                    <a href="23962991.html" class="pic" dd_name="排行榜商品图片5" target="_blank" style="display:none">
                        <img id="largePic" src="" title="拆掉思维里的墙（百万经典版）&nbsp;新增两万字《管理者以为你知道的职场常识》,升级你的“人生操作系统”！">           </a>           <p class="name" dd_name="排行榜商品名称5">
                        <a href="23962991.html" title="拆掉思维里的墙（百万经典版）&nbsp;新增两万字《管理者以为你知道的职场常识》,升级你的“人生操作系统”！" target="_blank">拆掉思维里的墙（百万经典版）</a>
                    </p>
                    <p class="zuozhe" style="display:none">古典</p>
                    <p class="price" style="display:none">
                        <span class="price_d">28.70</span>
                        <span class="price_zhe">(7.22折)</span>
                    </p>
                </li>
                <li ddt-pit="5">
                    <span class="num ">6</span>
                    <a href="23458812.html" class="pic" dd_name="排行榜商品图片6" target="_blank" style="display:none">
                        <img id="largePic" src="" title="100个基本:松浦弥太郎的人生信条（100个简单、亲和的基本生活理念，让我们审视日常的美好，遇见全新的自己）(浦睿文化出品）&nbsp;">
                    </a>
                    <p class="name" dd_name="排行榜商品名称6">
                        <a href="23458812.html" title="100个基本:松浦弥太郎的人生信条（100个简单、亲和的基本生活理念，让我们审视日常的美好，遇见全新的自己）(浦睿文化出品）&nbsp;" target="_blank">100个基本:松浦弥太郎的人生信条（100个简单、亲和的基本生活理念，让我们审视日常的美好，遇见全新的自己）(浦睿文化出品）</a>                 </p>
                    <p class="zuozhe" style="display:none">(日)松浦弥太郎</p>
                    <p class="price" style="display:none">
                        <span class="price_d">33.10</span>
                        <span class="price_zhe">(7.89折)</span>
                    </p>
                </li>
                <li ddt-pit="6">
                    <span class="num ">7</span>
                    <a href="23708799.html" class="pic" dd_name="排行榜商品图片7" target="_blank" style="display:none">
                        <img id="largePic" src="" title="断舍离+断舍离（心灵篇）+自在力 套装（全三册）&nbsp;减法生活，自在人生！百万人生活方式从此改变，入选2014年中国年度十大流行语，全民热议实践不断的人生整理术。">
                    </a>
                    <p class="name" dd_name="排行榜商品名称7">
                        <a href="23708799.html" title="断舍离+断舍离（心灵篇）+自在力 套装（全三册）&nbsp;减法生活，自在人生！百万人生活方式从此改变，入选2014年中国年度十大流行语，全民热议实践不断的人生整理术。" target="_blank">断舍离+断舍离（心灵篇）+自在力 套装（全三册）</a>
                    </p>
                    <p class="zuozhe" style="display:none">山下英子</p>
                    <p class="price" style="display:none">
                        <span class="price_d">69.10</span>
                        <span class="price_zhe">(7.2折)</span>
                    </p>
                </li>
                <li ddt-pit="7">
                    <span class="num ">8</span>
                    <a href="25208979.html" class="pic" dd_name="排行榜商品图片8" target="_blank" style="display:none">
                        <img id="largePic" src="" title="小学问 : 解决你的7种人生焦虑(团购请致电010-57993380)&nbsp;继《好好说话》畅销百万册后，马东团队全新力作。在这个充满焦虑的时代，如何做一个聪明人？只有知识，没有观点的人，正在被淘汰。《小学问》——迅速提升你解决焦虑的能力！">
                    </a>
                    <p class="name" dd_name="排行榜商品名称8">
                        <a href="25208979.html" title="小学问 : 解决你的7种人生焦虑(团购请致电010-57993380)&nbsp;继《好好说话》畅销百万册后，马东团队全新力作。在这个充满焦虑的时代，如何做一个聪明人？只有知识，没有观点的人，正在被淘汰。《小学问》——迅速提升你解决焦虑的能力！" target="_blank">小学问 : 解决你的7种人生焦虑(团购请致电010-57993380)</a>
                    </p>
                    <p class="zuozhe" style="display:none">马薇薇、邱晨、周玄毅、黄执中、胡渐彪</p>
                    <p class="price" style="display:none">
                        <span class="price_d">41.00</span>
                        <span class="price_zhe">(7.89折)</span>
                    </p>
                </li>
                <li ddt-pit="8">
                    <span class="num ">9</span>
                    <a href="25068992.html" class="pic" dd_name="排行榜商品图片9" target="_blank" style="display:none">
                        <img id="largePic" src="" title="极简主义 （乔布斯、扎克伯格奉行的生活方式）&nbsp;美职场精英放弃6位数年薪，扔掉90%家中物，却找到生命真意！8小时清空橱柜，21天过上极简生活。">
                    </a>
                    <p class="name" dd_name="排行榜商品名称9">
                        <a href="25068992.html" title="极简主义 （乔布斯、扎克伯格奉行的生活方式）&nbsp;美职场精英放弃6位数年薪，扔掉90%家中物，却找到生命真意！8小时清空橱柜，21天过上极简生活。" target="_blank">极简主义 （乔布斯、扎克伯格奉行的生活方式）
                        </a>
                    </p>
                    <p class="zuozhe" style="display:none">[美]乔舒亚·菲尔茨·米尔本 瑞安·尼科迪默斯 著等</p>
                    <p class="price" style="display:none">
                        <span class="price_d">25.40</span>
                        <span class="price_zhe">(6.52折)</span>
                    </p>
                </li>
                <li ddt-pit="9">
                    <span class="num ">10</span>
                    <a href="23453189.html" class="pic" dd_name="排行榜商品图片10" target="_blank" style="display:none">
                        <img id="largePic" src="" title="不抱怨的世界&nbsp;200万册增订版；新增30%心灵变革实践篇；世界500强推崇的员工心理自助书；冯仑、李开复、张德芬、奥普拉感动推荐">
                    </a>
                    <p class="name" dd_name="排行榜商品名称10">
                        <a href="23453189.html" title="不抱怨的世界&nbsp;200万册增订版；新增30%心灵变革实践篇；世界500强推崇的员工心理自助书；冯仑、李开复、张德芬、奥普拉感动推荐" target="_blank">不抱怨的世界</a>
                    </p>
                    <p class="zuozhe" style="display:none">[美]威尔·鲍温（Will Bowen） 著等</p>
                    <p class="price" style="display:none">
                        <span class="price_d">14.40</span>
                        <span class="price_zhe">(4.84折)</span>
                    </p>
                </li>
            </ul>
            <div class="link_more" style="">
                <a href="#" target="_blank">更多&gt;&gt;</a>
            </div>
            <ul class="list02 clearfix" id="newBang_data" style="display: none" ddt-area="019">
                <li ddt-pit="0" class="hover">
                    <span class="num num_top3">1</span>
                    <a href="25254513.html" class="pic" dd_name="排行榜商品图片1" target="_blank" style="">
                        <img id="largePic" src="/images/22624624-1_l_2.jpg" title="别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）&nbsp;现象级图书《别让不好意思害了你》周维丽全新力作，当你是你自己，世界才会记住你，成为有原则的人，守住你的底线，你才能真正赢得世界">           </a>
                    <p class="name" dd_name="排行榜商品名称1">
                        <a href="25254513.html" title="别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）&nbsp;现象级图书《别让不好意思害了你》周维丽全新力作，当你是你自己，世界才会记住你，成为有原则的人，守住你的底线，你才能真正赢得世界" target="_blank">别让好脾气害了你（不再过度善良，告别“老好人”；告诉你不迎合、不妥协，也能拥有人生主动权的奥秘）</a>
                    </p>
                    <p class="zuozhe" style="">周维丽</p>
                    <p class="price" style="">
                        <span class="price_d">27.50</span>
                        <span class="price_zhe">(6.91折)</span>
                    </p>
                </li>
                <li ddt-pit="1">
                    <span class="num num_top3">2</span>
                    <a href="25259304.html" class="pic" dd_name="排行榜商品图片2" target="_blank" style="display:none">
                        <img id="largePic" src="" title="我这么自律，就是为了不平庸至死（500册亲笔签名本随机发）&nbsp;“简书励志写作新偶像”怀左同学重磅新作，简书14万喜欢，全平台阅读10亿+，人民日报/新华社多次转载、江一燕/彭小六感动推荐。从自律到写作，120000字肺腑之言、经验之谈，写给所有心怀梦想，不惧未来">           </a>
                    <p class="name" dd_name="排行榜商品名称2">
                        <a href="25259304.html" title="我这么自律，就是为了不平庸至死（500册亲笔签名本随机发）&nbsp;“简书励志写作新偶像”怀左同学重磅新作，简书14万喜欢，全平台阅读10亿+，人民日报/新华社多次转载、江一燕/彭小六感动推荐。从自律到写作，120000字肺腑之言、经验之谈，写给所有心怀梦想，不惧未来" target="_blank">我这么自律，就是为了不平庸至死（500册亲笔签名本随机发）</a>
                    </p>
                    <p class="zuozhe" style="display:none">怀左同学</p>
                    <p class="price" style="display:none">
                        <span class="price_d">28.50</span>
                        <span class="price_zhe">(7.5折)</span>
                    </p>
                </li>
                <li ddt-pit="2">
                    <span class="num num_top3">3</span>
                    <a href="25244160.html" class="pic" dd_name="排行榜商品图片3" target="_blank" style="display:none">
                        <img id="largePic" src="" title="好好说话&nbsp;马云推崇的沟通读本，给亿万人转念转运的说话之道。史上首次将佛经中的说话之道化用到日常生活、工作中的语言智慧学经典。你嘴里所说的人生，就是你的运势，好好说话，就能改变命运！紫图出品">
                    </a>
                    <p class="name" dd_name="排行榜商品名称3">
                        <a href="25244160.html" title="好好说话&nbsp;马云推崇的沟通读本，给亿万人转念转运的说话之道。史上首次将佛经中的说话之道化用到日常生活、工作中的语言智慧学经典。你嘴里所说的人生，就是你的运势，好好说话，就能改变命运！紫图出品" target="_blank">好好说话</a>
                    </p>
                    <p class="zuozhe" style="display:none">学诚法师 著 紫图 出品</p>
                    <p class="price" style="display:none">
                        <span class="price_d">34.40</span>
                        <span class="price_zhe">(6.9折)</span>
                    </p>
                </li>
                <li ddt-pit="3">
                    <span class="num ">4</span>
                    <a href="25252643.html" class="pic" dd_name="排行榜商品图片4" target="_blank" style="display:none">
                        <img id="largePic" src="" title="向死而爱（挺立在绝望的废墟上寻找希望！从困境里奋起，一本写给当下女性的自励书。著名学者李泽厚感叹推荐！）&nbsp;当人生遭遇重大挫折，我们究竟要如何完成生命中看似不可能的蜕变之旅~">
                    </a>
                    <p class="name" dd_name="排行榜商品名称4">
                        <a href="25252643.html" title="向死而爱（挺立在绝望的废墟上寻找希望！从困境里奋起，一本写给当下女性的自励书。著名学者李泽厚感叹推荐！）&nbsp;当人生遭遇重大挫折，我们究竟要如何完成生命中看似不可能的蜕变之旅~" target="_blank">向死而爱（挺立在绝望的废墟上寻找希望！从困境里奋起，一本写给当下女性的自励书。著名学者李泽厚感叹推荐！）</a>
                    </p>
                    <p class="zuozhe" style="display:none">黄梅/著</p>
                    <p class="price" style="display:none">
                        <span class="price_d">28.70</span>
                        <span class="price_zhe">(7.22折)</span>
                    </p>
                </li>
                <li ddt-pit="4">
                    <span class="num ">5</span>
                    <a href="#" class="pic" dd_name="排行榜商品图片5" target="_blank" style="display:none">
                        <img id="largePic" src="" title="为何越爱越孤独（升级版）&nbsp;资深心理学家、百万畅销书作家武志红诚心之作！愿你拥有被爱照亮生命！全彩增订！送给千万年轻人心智开启读物！家是港湾，可为何家会伤人？揭示孤独感背后心理机制，帮助我们看到关系的真实样子，用爱照亮彼此生命。">           </a>           <p class="name" dd_name="排行榜商品名称5">
                        <a href="#" title="为何越爱越孤独（升级版）&nbsp;资深心理学家、百万畅销书作家武志红诚心之作！愿你拥有被爱照亮生命！全彩增订！送给千万年轻人心智开启读物！家是港湾，可为何家会伤人？揭示孤独感背后心理机制，帮助我们看到关系的真实样子，用爱照亮彼此生命。" target="_blank">为何越爱越孤独（升级版）</a>                 </p>
                    <p class="zuozhe" style="display:none">武志红</p>
                    <p class="price" style="display:none">
                        <span class="price_d">35.50</span>
                        <span class="price_zhe">(7.89折)</span>
                    </p>
                </li>
                <li ddt-pit="5">
                    <span class="num ">6</span>
                    <a href="25254241.html" class="pic" dd_name="排行榜商品图片6" target="_blank" style="display:none">
                        <img id="largePic" src="" title="你的气质里，藏着曾走过的路&nbsp;你的气质里，藏着你读过的书、走过的路和爱过的人。">
                    </a>
                    <p class="name" dd_name="排行榜商品名称6">
                        <a href="25254241.html" title="你的气质里，藏着曾走过的路&nbsp;你的气质里，藏着你读过的书、走过的路和爱过的人。" target="_blank">你的气质里，藏着曾走过的路</a>
                    </p>
                    <p class="zuozhe" style="display:none">苏听风  著</p>
                    <p class="price" style="display:none">
                        <span class="price_d">28.70</span>
                        <span class="price_zhe">(7.22折)</span>
                    </p>
                </li>
                <li ddt-pit="6">
                    <span class="num ">7</span>
                    <a href="25211338.html" class="pic" dd_name="排行榜商品图片7" target="_blank" style="display:none">            <img id="largePic" src="http://img3m8.ddimg.cn/97/19/25211338-1_x_3.jpg" title="改变人生的勇气&nbsp;畅销350万册的大卖之作《被讨厌的勇气》作者岸见一郎又一力作！">
                    </a>
                    <p class="name" dd_name="排行榜商品名称7">
                        <a href="25211338.html" title="改变人生的勇气&nbsp;畅销350万册的大卖之作《被讨厌的勇气》作者岸见一郎又一力作！" target="_blank">改变人生的勇气</a>
                    </p>
                    <p class="zuozhe" style="display:none">岸见一郎</p>
                    <p class="price" style="display:none">
                        <span class="price_d">32.40</span>
                        <span class="price_zhe">(7.2折)</span>
                    </p>
                </li>
                <li ddt-pit="7">
                    <span class="num ">8</span>
                    <a href="25255739.html" class="pic" dd_name="排行榜商品图片8" target="_blank" style="display:none">
                        <img id="largePic" src="http://img3m9.ddimg.cn/47/20/25255739-1_x_3.jpg" title="人生精进系列：好好说话、好好听话（全两册）学诚法师与您分享佛陀的说话与听话之道！&nbsp;好好听话是内修，是修自己；好好说话是外弘，是度众生。只有听得见，听得懂，听得明白，才能学得会，说得对，做得好 。马云推崇的沟通读本，给亿万人转念转运的说话之道！紫图出品">
                    </a>
                    <p class="name" dd_name="排行榜商品名称8">
                        <a href="25255739.html" title="人生精进系列：好好说话、好好听话（全两册）学诚法师与您分享佛陀的说话与听话之道！&nbsp;好好听话是内修，是修自己；好好说话是外弘，是度众生。只有听得见，听得懂，听得明白，才能学得会，说得对，做得好 。马云推崇的沟通读本，给亿万人转念转运的说话之道！紫图出品" target="_blank">人生精进系列：好好说话、好好听话（全两册）学诚法师与您分享佛陀的说话与听话之道！</a>
                    </p>
                    <p class="zuozhe" style="display:none">学诚法师 著   紫图出品</p>
                    <p class="price" style="display:none">
                        <span class="price_d">68.90</span>
                        <span class="price_zhe">(6.91折)</span>
                    </p>
                </li>
                <li ddt-pit="8">
                    <span class="num ">9</span>
                    <a href="25240712.html" class="pic" dd_name="排行榜商品图片9" target="_blank" style="display:none">
                        <img id="largePic" src="http://img3m2.ddimg.cn/68/15/25240712-1_x_4.jpg" title="世界顶级思维&nbsp;">           </a>           <p class="name" dd_name="排行榜商品名称9">
                        <a href="25240712.html" title="世界顶级思维&nbsp;" target="_blank">世界顶级思维</a>
                    </p>
                    <p class="zuozhe" style="display:none">李原 编</p>
                    <p class="price" style="display:none">
                        <span class="price_d">23.00</span>
                        <span class="price_zhe">(7.19折)</span>
                    </p>
                </li>
                <li ddt-pit="9">
                    <span class="num ">10</span>
                    <a href="25261222.html" class="pic" dd_name="排行榜商品图片10" target="_blank" style="display:none">
                        <img id="largePic" src="http://img3m2.ddimg.cn/85/27/25261222-1_x_3.jpg" title="放胆做自己（如果只想着和别人一样，你就输了。）&nbsp;（《人民日报》、十点读书、思想聚焦、《青年文摘》超人气写手，90后热血才女少女喵向全世界霸气放话：勇敢做自己，你的人生还有救！）">           </a>           <p class="name" dd_name="排行榜商品名称10">
                        <a href="25261222.html" title="放胆做自己（如果只想着和别人一样，你就输了。）&nbsp;（《人民日报》、十点读书、思想聚焦、《青年文摘》超人气写手，90后热血才女少女喵向全世界霸气放话：勇敢做自己，你的人生还有救！）" target="_blank">放胆做自己（如果只想着和别人一样，你就输了。）</a>                 </p>                    <p class="zuozhe" style="display:none">少女喵</p>
                    <p class="price" style="display:none">
                        <span class="price_d">28.70</span>
                        <span class="price_zhe">(7.22折)</span>
                    </p>
                </li>
            </ul>
            <div class="link_more" style="display: none">
                <a href="#" target="_blank">更多&gt;&gt;</a>
            </div>
        </div>
        <!-- 同类图书排行榜 end -->
        <div id="cpc_0" class="abox ad_product" dd_name="热卖商品1"></div>
        <div class="abox attention" dd_name="购买本书的用户还关注了" ddt-area="014" id="alsoAttention" style="">
            <h3>购买本书的用户还关注了</h3>
            <ul class="list01">
                <li data-request-id="201804261019098276_000000696867214537" ddt-pit="0">
                    <p class="pic" dd_name="购买本书的用户还关注了商品图片0">
                        <a href="25174269.html" target="_blank">
                            <img id="largePic" alt="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）" src="/images/25174269-1_l_9.jpg" title="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）&nbsp;">
                        </a>
                        <span class="hover">
                            <span class="pinglun">537条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥24.70</span>
                        <span class="price_zhe"></span>
                    </p>
                    <p class="name" dd_name="购买本书的用户还关注了商品名称0">
                        <a href="25174269.html" target="_blank" title="心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）&nbsp;">心若从容，便是优雅（总点击过3亿！百万级畅销书作家张其姝新作。献给每一个成长中的女子）</a>
                    </p>
                </li>
                <li data-request-id="201804261019098276_000000696867214537" ddt-pit="1">
                    <p class="pic" dd_name="购买本书的用户还关注了商品图片1">
                        <a href="25189759.html" target="_blank">
                            <img id="largePic" alt="不能错过的迪士尼双语经典电影故事：寻梦环游记" src="/images/25189759-1_l_3.jpg" title="不能错过的迪士尼双语经典电影故事：寻梦环游记&nbsp;">
                        </a>
                        <span class="hover">
                            <span class="pinglun">162条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥20.10</span>
                        <span class="price_zhe"></span>
                    </p>
                    <p class="name" dd_name="购买本书的用户还关注了商品名称1">
                        <a href="25189759.html" target="_blank" title="不能错过的迪士尼双语经典电影故事：寻梦环游记&nbsp;">不能错过的迪士尼双语经典电影故事：寻梦环游记</a>
                    </p>
                </li>

                <li data-request-id="201804261019098276_000000696867214537" ddt-pit="2">
                    <p class="pic" dd_name="购买本书的用户还关注了商品图片2">
                        <a href="25234505.html" target="_blank">
                            <img id="largePic" alt="姑娘，你活得太硬了" src="/images/25234505-1_l_1.jpg" title="姑娘，你活得太硬了&nbsp;">
                        </a>
                        <span class="hover">
                            <span class="pinglun">243条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥26.00</span>
                        <span class="price_zhe"></span>
                    </p>
                    <p class="name" dd_name="购买本书的用户还关注了商品名称2">
                        <a href="25234505.html" target="_blank" title="姑娘，你活得太硬了&nbsp;">姑娘，你活得太硬了</a>
                    </p>
                </li>
                <li data-request-id="201804261019098276_000000696867214537" ddt-pit="3">
                    <p class="pic" dd_name="购买本书的用户还关注了商品图片3">
                        <a href="22880790.html" target="_blank">
                            <img id="largePic" alt="我们仨（新版）" src="/images/22880790-1_l_2.jpg" title="我们仨（新版）&nbsp;">                 </a>
                        <span class="hover">
                            <span class="price_e">电子书价:<b>¥13.80</b></span>
                            <span class="pinglun">638860条评论</span>
                        </span>
                    </p>
                    <p class="price">
                        <span class="price_d">¥11.20</span>
                        <span class="price_zhe"></span>
                    </p>
                    <p class="name" dd_name="购买本书的用户还关注了商品名称3">
                        <a href="22880790.html" target="_blank" title="我们仨（新版）&nbsp;">我们仨（新版）</a>
                    </p>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧主体end -->
</div>
